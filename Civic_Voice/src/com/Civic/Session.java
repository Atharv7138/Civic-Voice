package com.Civic;

public class Session {
private static int csrno;
private static String oid;
private static String dept;


	public static void setCsrno(int cid){
	csrno=cid;	
	}
	public static int getCsrno(){
		return csrno;
	}
	

	public static void setOid(String id){
	oid=id;	
	}
	public static String getOid(){
		return oid;
	}

	public static void setDept(String deptr){
	dept=deptr;	
	}
	
	public static String getDept(){
		return dept;
	}	
}
