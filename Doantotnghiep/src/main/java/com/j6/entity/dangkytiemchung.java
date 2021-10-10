package com.j6.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "dangkytiemchung")
public class dangkytiemchung implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int iddangkytiemchung;
	String hoten;
	@Temporal(TemporalType.DATE)
	@Column(name = "ngaysinh")
	Date ngaysinh = new Date();
	boolean gioitinh;
	String cmnd;
	Date ngaytiem;
	String tiensubenh;

	@ManyToOne
	@JoinColumn(name = "taikhoan_username")
	taikhoan account;
	@ManyToOne()
	@JoinColumn(name = "vacxin_idvacxin")
	vacxin vacxin;
	
	@JsonIgnore
	@OneToMany(mappedBy = "dangkytiemchung")
	List<lichsutiem> lichsutiem;
	@JsonIgnore
	@OneToMany(mappedBy = "dangkytiemchung")
	List<phieudangkylichhen> phieudangkylichhen;	
}
