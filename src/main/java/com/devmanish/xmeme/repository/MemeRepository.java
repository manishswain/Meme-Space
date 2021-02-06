package com.devmanish.xmeme.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.devmanish.xmeme.entity.Meme;

public interface MemeRepository extends JpaRepository<Meme, Integer> {

	@Modifying
	@Query(value ="update meme m set m.meme_url = ?,m.caption = ? where m.meme_id = ?" ,nativeQuery = true)
	@Transactional
	public void updateMemeSetUrlCaption(String url,String caption,Integer id);
}
