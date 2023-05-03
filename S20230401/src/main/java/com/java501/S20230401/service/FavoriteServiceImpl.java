package com.java501.S20230401.service;

import org.springframework.stereotype.Service;

import com.java501.S20230401.dao.FavoriteDao;
import com.java501.S20230401.model.Article;
import com.java501.S20230401.model.Favorite;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FavoriteServiceImpl implements FavoriteService {
	private final FavoriteDao fd;
	
	// 양동균
	// 찜목록 조회
	@Override
	public int dgFavorite(Favorite favorite) { return fd.dgFavorite(favorite); }
	// 찜목록 추가
	@Override
	public int shareFavoriteAdd(Article article) {	return fd.shareFavoriteAdd(article); }
	// 찜목록 삭제
	@Override
	public int shareFavoriteDel(Article article) {	return fd.shareFavoriteDel(article); }

}
