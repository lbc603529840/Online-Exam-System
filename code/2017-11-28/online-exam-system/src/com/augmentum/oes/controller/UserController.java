package com.augmentum.oes.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.augmentum.oes.Constants;
import com.augmentum.oes.common.AppContext;
import com.augmentum.oes.exception.ParameterException;
import com.augmentum.oes.exception.ServiceException;
import com.augmentum.oes.model.User;
import com.augmentum.oes.service.UserService;
import com.augmentum.oes.util.PropertyUtil;

@Controller
@RequestMapping("/page/user")
@SessionAttributes("user")
public class UserController {
    UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    ModelAndView modelAndView = new ModelAndView();

    @RequestMapping(value = "/readyToLogin", method = RequestMethod.GET)
    public ModelAndView readyToLogin() {
        User user = AppContext.getAppContext().getUser();

        if (user == null) {
            modelAndView.addObject(Constants.SERVICE_ERROR, null);
            modelAndView.setViewName("user_login");
        } else {
            modelAndView.setView(new RedirectView(AppContext.getContextPath() + "/page/user/readyToLogout"));
        }

        return modelAndView;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(
                              @RequestParam(value = "input_username", defaultValue="") String username,
                              @RequestParam(value = "input_password", defaultValue="") String password,
                              @RequestParam(value = "input_is_remember", defaultValue="") String isRemember,
                              ModelMap modelMap,
                              HttpServletResponse response) {
        try {
            User user = null;
            user = userService.login(username, password);

            if (Constants.IS_REMEMBER.equals(isRemember)) {
                Cookie cookieUsername = new Cookie(Constants.COOKIE_USERNAME, user.getUsername());
                cookieUsername.setMaxAge(Integer.valueOf(PropertyUtil.getProperty(Constants.COOKIE_GENERATE)));
                response.addCookie(cookieUsername);

                Cookie cookiePassword = new Cookie(Constants.COOKIE_PASSWORD, user.getPassword());
                cookiePassword.setMaxAge(Integer.valueOf(PropertyUtil.getProperty(Constants.COOKIE_GENERATE)));
                response.addCookie(cookiePassword);
            } else {
                Cookie cookieUsername = new Cookie(Constants.COOKIE_USERNAME, user.getUsername());
                cookieUsername.setMaxAge(Integer.valueOf(PropertyUtil.getProperty(Constants.COOKIE_CLEAN)));
                response.addCookie(cookieUsername);

                Cookie cookiePassword = new Cookie(Constants.COOKIE_PASSWORD, user.getPassword());
                cookiePassword.setMaxAge(Integer.valueOf(PropertyUtil.getProperty(Constants.COOKIE_CLEAN)));
                response.addCookie(cookiePassword);
            }

            user.setPassword(null);
            modelMap.addAttribute("user", user);
            modelAndView.setView(new RedirectView(AppContext.getContextPath() + "/page/user/readyToLogout"));
        } catch (ParameterException parameterException) {
            parameterException.printStackTrace();

            Map<String, String> parameterErrorField = parameterException.getParameterErrorField();
            modelAndView.addObject(Constants.PARAMETER_ERROR_FIELD, parameterErrorField);
            modelAndView.setViewName("user_login");
        } catch (ServiceException serviceException) {
            serviceException.printStackTrace();

            modelAndView.addObject(Constants.SERVICE_ERROR, serviceException.getServiceErrorMessage());
            modelAndView.setViewName("user_login");
        }

        return modelAndView;
    }

    @RequestMapping(value = "/readyToLogout", method = RequestMethod.GET)
    public ModelAndView readyToLogout(@RequestParam(value = "input_user_logout", defaultValue="") String logout, SessionStatus sessionStatus) {
        if ("logout".equals(logout)) {
            sessionStatus.setComplete();
            modelAndView.setView(new RedirectView(AppContext.getContextPath() + "/page/user/readyToLogin"));
        } else {
            modelAndView.setViewName("user_welcome");
        }

        return modelAndView;
    }
}
