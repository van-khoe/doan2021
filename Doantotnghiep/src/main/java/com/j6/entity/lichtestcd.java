package com.j6.entity;

import java.util.Date;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


import lombok.Data;

@Data
@Entity
@Table(name = "lichtestcd")
public class lichtestcd {
	@Id
	int idlichtestcd;
	Date ngaytest;
	int soluongnguoitest;
	int mauamtinh;
	int mauduongtinh;

}
