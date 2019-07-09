package com.example.stc.controller;

import com.example.stc.domain.FileDetail;
import com.example.stc.framework.util.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 样本上传托相关接口
 */
@RestController
public class FileUploadController extends BaseController {

    private Logger logger = LoggerFactory.getLogger(FileUploadController.class);

    /**
     * 上传URL（前半部分）
     */
    private static String UPLOAD_URL_HALF = "http://localhost:8080/api/project/files?pid=";

    /**
     * 保存文件
     */
    private void saveUploadedFiles(String pid, List<MultipartFile> files) throws IOException {
        // 建立文件夹
        String filepath = FileUtils.UPLOAD_FOLDER + pid + "/";
        File fileDirs = new File(filepath);
        if (!fileDirs.exists()) {
            fileDirs.mkdirs();
        }
        // 保存所有下载的文件
        for (MultipartFile file : files) {
            if (file.isEmpty()) continue;
            byte[] bytes = file.getBytes();
            Path path = Paths.get(filepath + file.getOriginalFilename());
            Files.write(path, bytes);
        }
    }

    /**
     * 已上传文件查询
     */
    @Secured({"ROLE_CUS", "ROLE_SS"})
    @GetMapping("/files/name")
    public @ResponseBody
    List<FileDetail> getUploadFiles(@RequestParam(value = "pid") String pid) {
        logger.info("getUploadFiles: ");
        if (pid.equals(""))
            return new ArrayList<>();
        String filepath = FileUtils.UPLOAD_FOLDER + pid + "/";
        File fileDirs = new File(filepath);
        File[] files = fileDirs.listFiles();
        List<FileDetail> fileList = new ArrayList<>();
        // 若files == null，说明该路径不存在，即从未上传文件
        if (files != null) {
            int index = 0;
            for (File file : files) {
                if (!file.isDirectory()) {
                    String filename = file.getName();
                    String uploadURL = UPLOAD_URL_HALF + pid + "&filename=" + filename;
                    FileDetail fileDetail = new FileDetail();
                    fileDetail.setName(filename);
                    fileDetail.setUid(FileUtils.randomUid(index));
                    fileDetail.setStatus("done");
                    fileDetail.setUrl(uploadURL);
                    fileList.add(fileDetail);
                    logger.info("get File " + filename);
                    index += 1;
                }
            }
        }
        return fileList;
    }

    /**
     * 文件上传
     */
    @Secured({"ROLE_CUS"})
    @PostMapping("/files")
    public @ResponseBody
    ResponseEntity<?> uploadFileMulti(@RequestParam(value = "pid") String pid,
                                      HttpServletRequest request) {
        List<MultipartFile> files = ((MultipartHttpServletRequest) request)
                .getFiles("file");

        logger.info("Multiple File Upload");

        String filenames = files.stream().map(x -> x.getOriginalFilename())
                .filter(x -> !StringUtils.isEmpty(x)).collect(Collectors.joining(" , "));
//        String filenames = files.getName();
        logger.info("Get Upload Filenames: " + filenames);

        if (StringUtils.isEmpty(filenames)) {
            return new ResponseEntity("File Not Found, Please Select a File", HttpStatus.OK);
        }
        try {
            saveUploadedFiles(pid, files);
            logger.info("Upload Success");

        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return new ResponseEntity("Upload Success - " + filenames, HttpStatus.OK);
    }

    /**
     * 文件删除
     */
    @Secured({"ROLE_CUS"})
    @DeleteMapping("/files")
    public @ResponseBody
    String deleteFile(@RequestParam String pid, @RequestParam String filename) {
        // 删除的文件所在位置
        String filepath = FileUtils.UPLOAD_FOLDER + pid + "/";
        File file = new File(filepath + filename);

        logger.info("File Delete From" + filepath + filename);

        if (file.delete())
            return "Delete Success";
        else return "Delete Failed - File Not Found";
    }

    /**
     * 文件下载
     */
    @Secured({"ROLE_CUS", "ROLE_SS"})
    @GetMapping("/files")
    public @ResponseBody
    String downloadFile(@RequestParam String pid,
                        @RequestParam String filename,
                        HttpServletRequest request, HttpServletResponse response) {
        // 下载所在源文件
        String filepath = FileUtils.UPLOAD_FOLDER + pid + "/";
        File file = new File(filepath + filename);

        logger.info("File Download From" + filepath + filename);

        if (file.exists()) {
            response.setContentType("application/force-download");// 设置强制下载不打开
            response.addHeader("Content-Disposition", "attachment;filename=" + filename);// 设置文件名
            byte[] buffer = new byte[1024]; // 一次读1KB
            FileInputStream fis = null;
            BufferedInputStream bis = null;
            try {
                fis = new FileInputStream(file);
                bis = new BufferedInputStream(fis);
                OutputStream os = response.getOutputStream();
                int i = bis.read(buffer);
                while (i != -1) {
                    os.write(buffer, 0, i); // 写入response
                    i = bis.read(buffer);
                }
                try {
                    bis.close();
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                logger.info("Download Success");
                return "Download Success";
            } catch (Exception e) {
                e.printStackTrace();
                return "Download Failed";
            }
        }
        logger.info("Download Failed - File Not Found");
        return "Download Failed - File Not Found";
    }

}
