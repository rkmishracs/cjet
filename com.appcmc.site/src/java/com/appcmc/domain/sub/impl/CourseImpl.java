package com.appcmc.domain.sub.impl;

import java.util.Date;
import java.util.UUID;

import com.appcmc.domain.sub.Course;

public class CourseImpl implements Course {
	private Long id;
	private String guid;
	private String courseName;
	private Double courseFee;
	private String duration;
	private Double serviceTax;
	private Integer affirmitivePrice;
	private Integer numberOfInstallments;
	private Double feePerInstallment;
	private Double outStandingCourseFee;
	private Double courseFeeAfterDiscount;
	private Date createdOn;
	private Long createdBy;
	private Date modifiedOn;
	private Long modifiedBy;
	private Double discount;
	private Double outStandingDiscount;
	private Double serviceTaxAmount;
	private Short active;
	
	public CourseImpl(){
		setGuid(UUID.randomUUID().toString());
	}

	@Override
	public void setId(Long id) {
		// TODO Auto-generated method stub
		this.id = id;
	}

	@Override
	public Long getId() {
		// TODO Auto-generated method stub
		return id;
	}

	@Override
	public void setGuid(String guid) {
		// TODO Auto-generated method stub
		this.guid = guid;
	}

	@Override
	public String getGuid() {
		// TODO Auto-generated method stub
		return guid;
	}

	@Override
	public void setCreatedOn(Date createdOn) {
		// TODO Auto-generated method stub
		this.createdOn = createdOn;
	}

	@Override
	public Date getCreatedOn() {
		// TODO Auto-generated method stub
		return createdOn;
	}

	@Override
	public void setCreatedBy(Long createdBy) {
		// TODO Auto-generated method stub
		this.createdBy = createdBy;
	}

	@Override
	public Long getCreatedBy() {
		// TODO Auto-generated method stub
		return createdBy;
	}

	@Override
	public void setModifiedOn(Date modifiedOn) {
		// TODO Auto-generated method stub
		this.modifiedOn = modifiedOn;
	}

	@Override
	public Date getModifiedOn() {
		// TODO Auto-generated method stub
		return modifiedOn;
	}

	@Override
	public void setModifiedBy(Long modifiedBy) {
		// TODO Auto-generated method stub
		this.modifiedBy = modifiedBy;
	}

	@Override
	public Long getModifiedBy() {
		// TODO Auto-generated method stub
		return modifiedBy;
	}

	@Override
	public void setActive(Short active) {
		// TODO Auto-generated method stub
		this.active = active;
	}

	@Override
	public Short getActive() {
		// TODO Auto-generated method stub
		return active;
	}

	@Override
	public void setCourseName(String courseName) {
		// TODO Auto-generated method stub
		this.courseName = courseName;
	}

	@Override
	public String getCourseName() {
		// TODO Auto-generated method stub
		return courseName;
	}

	@Override
	public void setCourseFee(Double courseFee) {
		// TODO Auto-generated method stub
		this.courseFee = courseFee;
	}

	@Override
	public Double getCourseFee() {
		// TODO Auto-generated method stub
		return courseFee;
	}

	@Override
	public void setDuration(String duration) {
		// TODO Auto-generated method stub
		this.duration = duration;
	}

	@Override
	public String getDuration() {
		// TODO Auto-generated method stub
		return duration;
	}

	@Override
	public void setServiceTax(Double serviceTax) {
		// TODO Auto-generated method stub
		this.serviceTax = serviceTax;
	}

	@Override
	public Double getServiceTax() {
		// TODO Auto-generated method stub
		return serviceTax;
	}

	@Override
	public void setAffirmitivePrice(Integer affirmitivePrice) {
		// TODO Auto-generated method stub
		this.affirmitivePrice = affirmitivePrice;
	}

	@Override
	public Integer getAffirmitivePrice() {
		// TODO Auto-generated method stub
		return affirmitivePrice;
	}

	@Override
	public void setFeePerInstallment(Double feePerInstallment) {
		// TODO Auto-generated method stub
		this.feePerInstallment = feePerInstallment;
	}

	@Override
	public Double getFeePerInstallment() {
		// TODO Auto-generated method stub
		return feePerInstallment;
	}

	@Override
	public void setOutStandingCourseFee(Double outStandingCourseFee) {
		// TODO Auto-generated method stub
		this.outStandingCourseFee = outStandingCourseFee;
	}

	@Override
	public Double getOutStandingCourseFee() {
		// TODO Auto-generated method stub
		return outStandingCourseFee;
	}

	@Override
	public void setNumberOfInstallments(Integer numberOfInstallments) {
		this.numberOfInstallments = numberOfInstallments;
	}

	@Override
	public Integer getNumberOfInstallments() {
		// TODO Auto-generated method stub
		return numberOfInstallments;
	}
	@Override
	public void setDiscount(Double discount) {
		// TODO Auto-generated method stub
		this.discount = discount;
	}

	@Override
	public Double getDiscount() {
		// TODO Auto-generated method stub
		return discount;
	}

	@Override
	public void setOutStandingDiscount(Double outStandingDiscount) {
		// TODO Auto-generated method stub
		this.outStandingDiscount = outStandingDiscount;
	}

	@Override
	public Double getOutStandingDiscount() {
		// TODO Auto-generated method stub
		return outStandingDiscount;
	}
	
	@Override
	public void setServiceTaxAmount(Double serviceTaxAmount) {
		// TODO Auto-generated method stub
		this.serviceTaxAmount = serviceTaxAmount;
	}

	@Override
	public Double getServiceTaxAmount() {
		// TODO Auto-generated method stub
		return serviceTaxAmount;
	}
	@Override
	public void setCourseFeeAfterDiscount(Double courseFeeAfterDiscount) {
		// TODO Auto-generated method stub
		this.courseFeeAfterDiscount = courseFeeAfterDiscount;
	}

	@Override
	public Double getCourseFeeAfterDiscount() {
		// TODO Auto-generated method stub
		return courseFeeAfterDiscount;
	}

	@Override
	public String toString() {
		return "CourseImpl [id=" + id + ", guid=" + guid + ", courseName="
				+ courseName + ", courseFee=" + courseFee + ", duration="
				+ duration + ", serviceTax=" + serviceTax
				+ ", affirmitivePrice=" + affirmitivePrice
				+ ", numberOfInstallments=" + numberOfInstallments
				+ ", feePerInstallment=" + feePerInstallment
				+ ", outStandingCourseFee=" + outStandingCourseFee
				+ ", courseFeeAfterDiscount=" + courseFeeAfterDiscount
				+ ", createdOn=" + createdOn + ", createdBy=" + createdBy
				+ ", modifiedOn=" + modifiedOn + ", modifiedBy=" + modifiedBy
				+ ", discount=" + discount + ", outStandingDiscount="
				+ outStandingDiscount + ", serviceTaxAmount="
				+ serviceTaxAmount + ", active=" + active + "]";
	}

	

	
}
