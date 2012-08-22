package com.appcmc.domain;

import java.util.Date;

public interface Domain {

	void setId(Long id);

	Long getId();

	void setGuid(String guid);

	String getGuid();

	void setCreatedOn(Date createdOn);

	Date getCreatedOn();

	void setCreatedBy(Long createdBy);

	Long getCreatedBy();

	void setModifiedOn(Date modifiedOn);

	Date getModifiedOn();

	void setModifiedBy(Long modifiedBy);

	Long getModifiedBy();

	void setActive(Short active);

	Short getActive();

}
