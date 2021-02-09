package com.devmanish.xmeme.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "meme")
public class Meme {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "meme_id")
	private int id;

	@Column(name = "name")
	private String name;

	@Column(name = "meme_url")
	private String url;

	@Column(name = "caption")
	private String caption;

	@Column(name = "date")
	//@JsonIgnore
	private String date;

	public Meme() {
	}

	public Meme(String name, String url, String caption, String date) {
		super();
		this.name = name;
		this.url = url;
		this.caption = caption;
		this.date = date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String memeUrl) {
		this.url = memeUrl;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public int getId() {
		return id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Meme [memeId=" + id + ", name=" + name + ", memeUrl=" + url + ", caption=" + caption + ", date="
				+ date + "]";
	}

}
