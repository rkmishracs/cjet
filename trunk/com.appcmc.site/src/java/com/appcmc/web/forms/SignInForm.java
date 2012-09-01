/**
 *
 */
package com.appcmc.web.forms;

/**
 * @author Sudarsan
 *
 */
public class SignInForm {

    private String userId;
    private String password;
    private String rememberMe;

    public String getRememberMe() {
        return rememberMe;
    }

    public void setRememberMe(String rememberMe) {
        this.rememberMe = rememberMe;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
