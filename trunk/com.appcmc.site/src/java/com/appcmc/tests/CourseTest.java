package com.appcmc.tests;

import org.apache.log4j.Logger;

import com.appcmc.domain.sub.Course;
import com.appcmc.domain.sub.impl.CourseImpl;
import com.appcmc.service.CourseService;
import com.appcmc.service.impl.CourseServiceImpl;

public class CourseTest {

	/**
	 * @param args
	 */
	private static Logger LOG = Logger.getLogger(CourseTest.class);

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CourseService courseService = new CourseServiceImpl();
		Course course = new CourseImpl();

		LOG.debug("In Course Test");
		// course = courseService.findByCourseName("cjet");
		// if (course == null) {
		// LOG.debug("User Not Found");
		// return;
		// }

		// LOG.debug("Found");

		course.setModifiedBy(course.getModifiedBy());
		course.setModifiedOn(new java.util.Date());
		course.setCreatedBy(course.getCreatedBy());
		course.setCreatedOn(new java.util.Date());
		course.setActive(course.getActive());
		course.setCourseName("edj");

		course.setCreatedBy(1L);
		course.setModifiedBy(1L);
		course.setActive(Short.parseShort("1"));
		course.setCourseFee(130000.00);
		course.setAffirmitivePrice(1);
		course.setFeePerInstallment(20000.00);
		course.setDuration("1 year");
		course.setNumberOfInstallments(5);
		course.setServiceTax(12.36);
		course.setDiscount(10.00);
		course.setServiceTaxAmount((course.getCourseFee() * course
				.getServiceTax()) / 100);

		Double outStandingFee = (course.getCourseFee() * course.getServiceTax()) / 100;
		course.setOutStandingCourseFee(outStandingFee + course.getCourseFee());
		Double outStandingDiscount = (course.getOutStandingCourseFee() * course
				.getDiscount()) / 100;
		course.setCourseFeeAfterDiscount(course.getOutStandingCourseFee()
				- course.getOutStandingCourseFee() * 10 / 100);
		course.setOutStandingDiscount(outStandingDiscount);

		// course.setDiscount((course.getOutStandingCourseFee() * 10 )/ 100 );
		// course.setOutStandingDiscount(course.getDiscount());
		courseService.create(course);

	}

}
