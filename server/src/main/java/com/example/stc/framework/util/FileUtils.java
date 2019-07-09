package com.example.stc.framework.util;

import com.example.stc.controller.FileUploadController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;

public class FileUtils {

    private static Logger logger = LoggerFactory.getLogger(FileUtils.class);

    /**
     * 上传文件的保存路径
     */
    public static String UPLOAD_FOLDER = "files/";

    /**
     * 文件名转uid（一个随意的算法）
     */
    public static String randomUid(int index) {
        int rand = (int) (Math.random() * Integer.MAX_VALUE);
        StringBuilder sb = new StringBuilder("rd-upload-");
        sb.append(rand);
        sb.append("-");
        sb.append(index);
        return new String(sb);
    }

    /** 删除一个pid下的所有文件 */
    public static void deleteAllFiles(String pid) {
        String filepath = UPLOAD_FOLDER + pid + "/";
        File fileDirs = new File(filepath);
        File[] files = fileDirs.listFiles();
        if (files != null) {
            for (File file : files) {
                if (file.delete())
                    logger.info("Delete File " + file.getName() + " Under pid = " + pid);
                else logger.info("Delete File " + file.getName() + " Failed, pid = " + pid);
            }
            if (fileDirs.delete())
                logger.info("Delete File Director " + pid);
            else logger.info("Delete File Director " + pid + " Failed");
        }
    }

}
