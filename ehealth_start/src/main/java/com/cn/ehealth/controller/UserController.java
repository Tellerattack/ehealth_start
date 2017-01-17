package com.cn.ehealth.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Autowired;
import com.cn.ehealth.model.User;
import com.cn.ehealth.service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/registerUser123", method = RequestMethod.POST)
    @ResponseBody
    public Ajax registerUser(HttpServletRequest request, Model model,
            @RequestParam("tel") String tel,
            @RequestParam("pwd") String pwd,
            @RequestParam("d_p") String d_p) {
    	System.out.println("sdfsd");
        Ajax ajax = new Ajax();
        try {
        	User user = new User();
        	user.setTel(tel);
        	user.setPwd(pwd);
        	user.setdP(d_p);
            boolean res = userService.registerUser(user);
            if (res) {
                ajax.setCode(Ajax.SUCCESS);
                ajax.setMsg("������ӳɹ���");
            } else {
                ajax.setCode(Ajax.FAILURE);
                ajax.setMsg("�������ʧ�ܣ�");
            }
        } catch (Exception e) {
            ajax.setCode(Ajax.ERROR);
            ajax.setMsg("���ݿ����ʧ�ܣ�");
        }
        return ajax;
    }

}

