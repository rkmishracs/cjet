package com.appcmc.tests;

import org.apache.log4j.Logger;

import com.appcmc.context.id.names.ContextIdNames;
import com.appcmc.domain.sub.AppUser;
import com.appcmc.service.AppUserService;
import com.appcmc.utils.AppCmcSpringContext;
import com.appcmc.utils.AppContext;

public class AppUserTest {

	/**
	 * @param args
	 */

	private static Logger LOG = Logger.getLogger(AppUserTest.class);

	public static void main(String[] args) {

		AppCmcSpringContext.init();
		AppUserService appUserService = (AppUserService) AppContext.APPCONTEXT
				.getBean(ContextIdNames.APP_USER_SERVICE);

		/*AppUser appUser = appUserService.authenticate("gani_451983@gmail.com",
				"pwd");

		LOG.debug(appUser);*/
                AppUser appUser = appUserService.findByGuid("6f71f6f2-6065-4562-98bf-9e2f5e22e437");
                LOG.debug(appUser);

	}
}
