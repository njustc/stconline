package com.example.stc.framework.core.web;

import com.example.stc.framework.enums.ResponseType;
import org.springframework.hateoas.Link;
import org.springframework.hateoas.Resource;

/**
 * 通用返回类型
 *
 * @author lfm
 */
public class BasicResponse<T> {
    private class Response {
        // 实体数据
        private T data;
        // 状态码信息
        private int status;
        // 附加说明信息
        private String message;

        Response(T data, int status, String message) {
            this.data = data;
            this.status = status;
            this.message = message;
        }
    }

    /**
     * 用于需要进行hateoas链接的成功返回
     *
     * @param data:  需要返回的数据
     * @param links: 链接信息
     */
    public Resource<Response> success(T data, Link... links) {
        Response response = new Response(data, 200, "success");
        return new Resource<>(response, links);

    }

    /**
     * 用于普通成功返回
     *
     * @param data: 需要返回的数据
     */
    public Response success(T data) {
        return new Response(data, 200, "success");
    }

    /**
     * 用于需要进行hateoas链接的失败返回
     *
     * @param responseType: 返回枚举类, 与状态码\信息 对应
     * @param links:        链接信息
     */
    public Resource<Response> fail(ResponseType responseType, Link... links) {
        Response response = new Response(null, responseType.getStatus(), responseType.getMessage());
        return new Resource<>(response, links);
    }

    /**
     * 用于普通失败返回
     *
     * @param responseType: 返回枚举类, 与状态码\信息 对应
     */
    public Response fail(ResponseType responseType) {
        return new Response(null, responseType.getStatus(), responseType.getMessage());
    }
}
