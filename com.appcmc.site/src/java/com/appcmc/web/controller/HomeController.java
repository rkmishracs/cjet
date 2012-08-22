/**
 * 
 */
package com.appcmc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.appcmc.web.forms.SignInForm;

/**
 * @author Sudarsan
 * 
 */
@Controller
@RequestMapping("/appHome")
public class HomeController {

	@RequestMapping(method = RequestMethod.GET)
	public String showHome(@ModelAttribute SignInForm signInForm) {
		return "/home/appHome";
	}

}
