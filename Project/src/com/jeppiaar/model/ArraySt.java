package com.jeppiaar.model;

public class ArraySt {
public static String st(String array[]) {
	String temp="";
	for(int i=0;i<array.length;i++){
		
		if(i==array.length-1)
			temp+=array[i];
		else
			temp+=array[i]+",";
	}
	return temp;
}
//public static void main(String[] args){
//	String sus[]={"ddf","ddd","dsss","ass"};
//	String res=ArraySt.st(sus);
//	System.out.println(res);
//}
}
