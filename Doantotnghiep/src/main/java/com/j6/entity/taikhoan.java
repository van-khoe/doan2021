package com.j6.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "taikhoan")
public class taikhoan implements Serializable {

	@Id
	String username;
	String hoten;
	String matkhau;
	String diachi;
	boolean gioitinh;
	String sdt;
	@Temporal(TemporalType.DATE)
	@Column(name = "ngaysinh")
	Date ngaysinh = new Date();
	boolean trangthai;
	
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<khaibaoyte> khaibaoyte;
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<dangkytiemchung> dangkytiemchung;
	@JsonIgnore
	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
	List<capquyen> capquyen;
}
