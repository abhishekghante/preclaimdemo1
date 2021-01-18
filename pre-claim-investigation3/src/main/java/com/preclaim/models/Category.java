package com.preclaim.models;

public class Category {
	private String categoryNameEn;
	private String imgCatEng;
	private String categoryNameHin;
	private String imgCatHin;
	private int isEnImageSame;
	private int createdBy;
	private String createdDate;
	private String updatedDate;
	private int updatedBy;
	private int  orderNo;
	private int status;
	private int categoryId;
	
	public Category() {
		
		this.categoryNameEn="";
		this.imgCatEng="";
		this.categoryNameHin="";
		this.imgCatHin="";
		this.isEnImageSame=0;
		this.createdBy=0;
		this.createdDate="";
		this.updatedDate="";
		this.updatedBy=0;
		this.orderNo=1;
		this.status=0;
		this.categoryId=0;
		
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryNameEn() {
		return categoryNameEn;
	}

	public void setCategoryNameEn(String categoryNameEn) {
		this.categoryNameEn = categoryNameEn;
	}

	public String getImgCatEng() {
		return imgCatEng;
	}

	public void setImgCatEng(String imgCatEng) {
		this.imgCatEng = imgCatEng;
	}

	public String getCategoryNameHin() {
		return categoryNameHin;
	}

	public void setCategoryNameHin(String categoryNameHin) {
		this.categoryNameHin = categoryNameHin;
	}

	public String getImgCatHin() {
		return imgCatHin;
	}

	public void setImgCatHin(String imgCatHin) {
		this.imgCatHin = imgCatHin;
	}

	public int getIsEnImageSame() {
		return isEnImageSame;
	}

	public void setIsEnImageSame(int isEnImageSame) {
		this.isEnImageSame = isEnImageSame;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public int getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	

	public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public String getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}


	@Override
	public String toString() {
		return "Category [categoryNameEn=" + categoryNameEn + ", imgCatEng=" + imgCatEng + ", categoryNameHin="
				+ categoryNameHin + ", imgCatHin=" + imgCatHin + ", isEnImageSame=" + isEnImageSame + ", createdBy="
				+ createdBy + ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + ", updatedBy="
				+ updatedBy + ", orderNo=" + orderNo + ", status=" + status + ", categoryId=" + categoryId + "]";
	}


	
	
	

}
