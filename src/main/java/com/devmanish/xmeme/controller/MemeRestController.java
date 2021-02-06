package com.devmanish.xmeme.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.devmanish.xmeme.entity.Meme;
import com.devmanish.xmeme.repository.MemeRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@RestController
public class MemeRestController 
{
	@Autowired
	private MemeRepository repository;
	
	@Autowired
	private ObjectMapper mapper;
	
	@GetMapping("/memes/{id}")
	public Optional<Meme> findByIdMeme(@PathVariable(name = "id") Integer id)
	{
		return repository.findById(id);
	}
	
	@GetMapping("/memes")
	public List<Meme> showAll()
	{
		return repository.findAll(Sort.by(Sort.Direction.DESC, "id"));
	}
	
	@PostMapping("/memes")
	public ObjectNode postMeme(@RequestBody Meme meme)
	{
		java.util.Date dt = new java.util.Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(dt);
		meme.setDate(currentTime);
		repository.save(meme);
		
		ObjectNode objectNode = mapper.createObjectNode();
		objectNode.put("id",meme.getId());
		return objectNode;
	}
	
	@PatchMapping("/memes/{id}")
	public void updateMeme(@PathVariable("id")Integer id,@RequestBody Meme meme)
	{
		System.out.println(meme);
		repository.updateMemeSetUrlCaption(meme.getUrl(),meme.getCaption(),id);
	}
	
	
}
