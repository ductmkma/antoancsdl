package com.zent.json;

import java.util.List;

import com.zent.entity.Category;
import com.zent.entity.Tags;

public class TagsJsonObject {
	int iTotalRecords;
	 
    int iTotalDisplayRecords;
 
    String sEcho;
 
    String sColumns;
 
    List<Tags> aaData;
 
    public int getiTotalRecords() {
	return iTotalRecords;
    }
 
    public void setiTotalRecords(int iTotalRecords) {
	this.iTotalRecords = iTotalRecords;
    }
 
    public int getiTotalDisplayRecords() {
	return iTotalDisplayRecords;
    }
 
    public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
	this.iTotalDisplayRecords = iTotalDisplayRecords;
    }
 
    public String getsEcho() {
	return sEcho;
    }
 
    public void setsEcho(String sEcho) {
	this.sEcho = sEcho;
    }
 
    public String getsColumns() {
	return sColumns;
    }
 
    public void setsColumns(String sColumns) {
	this.sColumns = sColumns;
    }
 
    public List<Tags> getAaData() {
        return aaData;
    }
 
    public void setAaData(List<Tags> aaData) {
        this.aaData = aaData;
    }
}
