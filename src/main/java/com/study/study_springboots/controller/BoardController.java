package com.study.study_springboots.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

// * Cast 
// - use bootstrap
// - 항목 : title, content,userName, date
// - CRUD : 
//   + list.jsp(/board) -> view.jsp(/board/view) -> list.jsp(/board/list)
//   + list.jsp(/board) -> form.jsp(/board/form) -> form.jsp(/board/form) with Post  -> list.jsp(/board/list)
//   + view.jsp(/board/view) -> edit.jsp(/board/edit) -> list.jsp(/board/list)
// @Controller
public class BoardController {
    // @RequestMapping(value = "/board/form", method = RequestMethod.GET)
    public String form() {
        return "/WEB-INF/views/board/form.jsp";
    }
    // @RequestMapping(value = "/board/form", method = RequestMethod.POST)
    public String formPost() {
        // insert biz
        return "/WEB-INF/views/board/list.jsp";
    }
    // @RequestMapping(value = "/board/temp", method = RequestMethod.GET)
    public ModelAndView temp() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("searchString", "firstValue");
        // modelAndView.setViewName("/WEB-INF/views/board/temp.jsp");
        modelAndView.setViewName("/board/temp");
        // insert biz
        return modelAndView;
    }

}
