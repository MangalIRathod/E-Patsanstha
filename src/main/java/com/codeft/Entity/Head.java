package com.codeft.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name ="addhead")
public class Head {

public Head(String name) {
		super();
		Name = name;
	}
public Head() {
	
}


@Id
int id;
String Name;

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return Name;
}
public void setName(String headName) {
	Name = headName;
}
}
