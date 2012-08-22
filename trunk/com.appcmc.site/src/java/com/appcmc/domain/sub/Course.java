package com.appcmc.domain.sub;

import com.appcmc.domain.Domain;

public interface Course extends Domain {
	void setCourseName(String courseName);

	String getCourseName();

	void setCourseFee(Double courseFee);

	Double getCourseFee();

	void setDuration(String duration);

	String getDuration();

	void setServiceTax(Double serviceTax);

	Double getServiceTax();

	void setAffirmitivePrice(Integer affirmitivePrice);

	Integer getAffirmitivePrice();

	void setFeePerInstallment(Double feePerInstallment);

	Double getFeePerInstallment();

	void setOutStandingCourseFee(Double outStandingCourseFee);

	Double getOutStandingCourseFee();

	void setNumberOfInstallments(Integer numberOfInstallments);

	Integer getNumberOfInstallments();
	
	void setDiscount(Double discount);
	Double getDiscount();
	
	void setOutStandingDiscount(Double outStandingDiscount);
	Double getOutStandingDiscount();
	
	void setServiceTaxAmount(Double serviceTaxAmount);
	Double getServiceTaxAmount();
	
	void setCourseFeeAfterDiscount(Double courseFeeAfterDiscount);
	Double getCourseFeeAfterDiscount();

}
