package dao;

import bean.Anime;
import bean.Article;
import bean.Image;
import bean.Message;
import dao.Dao;


public class DaoFactory {
	
	public static Dao<Image> getImageDao() {
		return new ImageDaoImpl();
	}
	
	public static Dao<Anime> getAnimeDao() {
		return new AnimeDaoImpl();
	}
	
	public static Dao<Message> getMessageDao() {
		return new MessageDaoImpl();
	}
	
	public static Dao<Article> getArticleDao() {
		return new ArticleDaoImpl();
	}

}
