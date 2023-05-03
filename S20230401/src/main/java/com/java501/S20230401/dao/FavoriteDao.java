package com.java501.S20230401.dao;

import com.java501.S20230401.model.Article;
import com.java501.S20230401.model.Favorite;

public interface FavoriteDao {

	// 양동균
	int dgFavorite(Favorite favorite);		// 찜목록 조회
	int shareFavoriteAdd(Article article);	// 찜목록 추가
	int shareFavoriteDel(Article article);	// 찜 삭제


}
