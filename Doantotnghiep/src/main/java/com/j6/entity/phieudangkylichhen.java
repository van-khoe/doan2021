package com.j6.entity;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "phieudangkylichtiem")
public class phieudangkylichhen implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long idphieudangkylichtiem;
	String cosoyte;
	String diachi;
	@Temporal(TemporalType.DATE)
	@Column(name = "ngaytiem")
	Date ngaytiem= new Date();
	Time giotiem;
	Double phidichvu;
	
	@ManyToOne
	@JoinColumn(name = "dangkytiemchung_iddangkytiemchung")
	dangkytiemchung dangkytiemchung;
}
