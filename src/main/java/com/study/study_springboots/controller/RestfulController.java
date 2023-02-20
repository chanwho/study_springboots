package com.study.study_springboots.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.study.study_springboots.service.CommonCodeOurService;

@RestController
@CrossOrigin
public class RestfulController {

    @RequestMapping(value = "/api/v1/helloworld", method = RequestMethod.GET)
    public String helloworld() { // v1은 버전을 뜻한다
        return "hello world !";
    }

    // params - title = "learn ajax!"& description="we learn with ajax"
    @RequestMapping(value = "/api/v1/requestParams", method = RequestMethod.GET)
    public String requestParams(Map<String, Object> params) { // v1은 버전을 뜻한다
        Map<String, Object> result = new HashMap<String, Object>();
        result.putAll(params);
        result.put("id", "yojulab");
        return "requestParams !";
    }

    @Autowired
    CommonCodeOurService commonCodeOurService;

    // currentPage : 1
    @RequestMapping(value = "/api/v1/requestParamsWithDB", method = RequestMethod.POST)
    public Map requestParamsWithDB(@RequestParam Map<String, Object> params) {
        params.put("currentPage", Integer.parseInt((String) params.get("currentPage")));
        params.put("pageScale", 10);

        Map<String, Object> resultMap = new HashMap<>();
        resultMap = (Map<String, Object>) commonCodeOurService.getListWithPagination(params);

        return resultMap;
    }

}
