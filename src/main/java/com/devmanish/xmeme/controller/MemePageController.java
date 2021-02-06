package com.devmanish.xmeme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.devmanish.xmeme.entity.Meme;
import com.devmanish.xmeme.repository.MemeRepository;

@Controller
public class MemePageController {

	@Autowired
	private MemeRepository memeRepository;

	@GetMapping("/")
	public String showForm(Model theModel) {
		Meme meme = new Meme();
		theModel.addAttribute("memes", meme);
		return "memeForm";
	}

	@PostMapping("/")
	public String processForm(@ModelAttribute("memes") Meme memes) {
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(dt);
		memes.setDate(currentTime);
		System.out.println(memes);
		memeRepository.save(memes);
		return "redirect:/memeForm";
	}
}
