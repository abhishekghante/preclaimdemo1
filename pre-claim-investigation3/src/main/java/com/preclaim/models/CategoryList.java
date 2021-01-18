package com.preclaim.models;

public class CategoryList {

	private int srNo;
	private String categoryNameEn;
	private String imgCatEng;
	private String categoryNameHin;
	private String imgCatHin;
    private int status;
    private int categoryId;
	
    
    public CategoryList() {
	
    	this.categoryNameEn="";
    	this.imgCatEng="";
    	this.categoryNameEn="";
    	this.imgCatHin="";
    	this.status=0;
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


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getSrNo() {
		return srNo;
	}

	public void setSrNo(int srNo) {
		this.srNo = srNo;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	@Override
	public String toString() {
		return "CategoryList [srNo=" + srNo + ", categoryNameEn=" + categoryNameEn + ", imgCatEng=" + imgCatEng
				+ ", categoryNameHin=" + categoryNameHin + ", imgCatHin=" + imgCatHin + ", status=" + status
				+ ", categoryId=" + categoryId + "]";
	}

	


}

