package com.example.stc.framework.core.web;

import com.alibaba.fastjson.JSON;
import com.example.stc.framework.enums.ResponseType;
import org.springframework.hateoas.Link;
import org.springframework.hateoas.Resource;

public class Response {
    private static class BasicResponse<T> {
        // 实体数据
        private T data;
        // 状态码信息
        private int status;
        // 附加说明信息
        private String message;

        BasicResponse(T data, int status, String message) {
            this.data = data;
            this.status = status;
            this.message = message;
        }

        public T getData() {
            return data;
        }

        public void setData(T data) {
            this.data = data;
        }

        public int getStatus() {
            return status;
        }

        public void setStatus(int status) {
            this.status = status;
        }

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }
    }

    /**
     * 用于需要进行hateoas链接的成功返回
     *
     * @param data:  需要返回的数据
     * @param links: 链接信息
     */
    public static JSON success(Object data, Link... links) {
        BasicResponse response = new BasicResponse(data, 200, "success");
        return (JSON) JSON.toJSON(new Resource<>(response, links));
    }

    /**
     * 用于普通成功返回
     *
     * @param data: 需要返回的数据
     */
    public static JSON success(Object data) {
        BasicResponse response = new BasicResponse(data, 200, "success");
        return (JSON) JSON.toJSON(new Resource<>(response));
    }

    /**
     * 用于需要进行hateoas链接的失败返回
     *
     * @param responseType: 返回枚举类, 与状态码\信息 对应
     * @param links:        链接信息
     */
    public static JSON fail(ResponseType responseType, Link... links) {
        BasicResponse response = new BasicResponse(null, responseType.getStatus(), responseType.getMessage());
        return (JSON) JSON.toJSON(new Resource<>(response, links));
    }

    /**
     * 用于普通失败返回
     *
     * @param responseType : 返回枚举类, 与状态码\信息 对应
     * @return
     */
    public static JSON fail(ResponseType responseType) {
        BasicResponse response = new BasicResponse(null, responseType.getStatus(), responseType.getMessage());
        return (JSON) JSON.toJSON(new Resource<>(response));
    }
}
