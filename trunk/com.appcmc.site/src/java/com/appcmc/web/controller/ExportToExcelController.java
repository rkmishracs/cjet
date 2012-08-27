/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.appcmc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Sudarsan
 */
@Controller
@RequestMapping("/export")
public class ExportToExcelController {
    
    @RequestMapping(method = RequestMethod.GET, value = "/all")
    public String all(){
        
        return "";
    }
}
