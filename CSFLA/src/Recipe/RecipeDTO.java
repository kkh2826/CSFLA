package Recipe;

import java.sql.Timestamp;

public class RecipeDTO {
	int recipeNum;
	String recipeTitle;
	String writer;
	Timestamp recipeDate;
	String recipeContent;
	
	public RecipeDTO() {}
	public RecipeDTO(int recipeNum, String recipeTitle, String writer, Timestamp recipeDate, String recipeContent) {
		this.recipeNum = recipeNum;
		this.recipeTitle = recipeTitle;
		this.writer = writer;
		this.recipeDate = recipeDate;
		this.recipeContent = recipeContent;
	}
	public int getRecipeNum() {
		return recipeNum;
	}
	public void setRecipeNum(int recipeNum) {
		this.recipeNum = recipeNum;
	}
	public String getRecipeTitle() {
		return recipeTitle;
	}
	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRecipeDate() {
		return recipeDate;
	}
	public void setRecipeDate(Timestamp recipeDate) {
		this.recipeDate = recipeDate;
	}
	public String getRecipeContent() {
		return recipeContent;
	}
	public void setRecipeContent(String recipeContent) {
		this.recipeContent = recipeContent;
	}

	
}
