package com.therepanic.api;

import com.google.gson.Gson;
import com.therepanic.api.request.PistonExecuteRequest;
import com.therepanic.api.response.PistonExecuteResponse;
import com.therepanic.api.response.PistonRuntimesResponse;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;

import java.io.IOException;
import java.io.UncheckedIOException;

public class PistonApi {

    private final String url;

    private final OkHttpClient client;

    private final Gson mapper;

    public PistonApi(String url, OkHttpClient client, Gson mapper) {
        this.url = url;
        this.client = client;
        this.mapper = mapper;
    }

    public PistonExecuteResponse execute(PistonExecuteRequest request) {
        String req = this.mapper.toJson(request);
        String response;
        try {
            response = this.client.newCall(new Request.Builder().url(this.url + "/api/v2/execute")
                    .post(RequestBody.create(req.getBytes())).build())
                    .execute().body().string();
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
        return this.mapper.fromJson(response, PistonExecuteResponse.class);
    }

    public PistonRuntimesResponse[] getRuntimes() {
        String response;
        try {
            response = this.client
                    .newCall(new Request.Builder().url(this.url + "/api/v2/runtimes")
                            .get()
                            .build())
                    .execute().body().string();
        } catch (IOException e) {
            throw new UncheckedIOException(e);
        }
        return this.mapper.fromJson(response, PistonRuntimesResponse[].class);
    }

}
