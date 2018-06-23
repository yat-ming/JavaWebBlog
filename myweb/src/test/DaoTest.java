package test;

import java.util.Date;
import java.util.List;

import bean.Anime;
import bean.Article;
import dao.Dao;
import dao.DaoFactory;

public class DaoTest {

	public static void main(String[] args) {
		Dao<Article> articleDao = DaoFactory.getArticleDao();
//		Article article = new Article();
//		article.setDate(new Date());
//		article.setTitle("hello world");
//		article.setContent("这是一段测试用的文字");
//		articleDao.add(article);
//		测试添加，通过
//		List<Article> articlelist = articleDao.findAll();
//		Article article = articlelist.get(0);
//		System.out.println(article.getTitle());
//		System.out.println(article.getDate());
//		System.out.println(article.getContent());
//		测试遍历查询，通过
//		articleDao.deleteById(2);
//		测试删除，通过
	}
}
