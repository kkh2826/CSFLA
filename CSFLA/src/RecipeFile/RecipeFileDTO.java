package RecipeFile;

import java.sql.Timestamp;

public class RecipeFileDTO {
	int recipeNum;
	String recipeFileName;
	String recipeFileType;
	int recipeFileUploadNum;
	String writer;
	
	public RecipeFileDTO() {}
	public RecipeFileDTO(int recipeNum, String recipeFileName, String recipeFileType, int recipeFileUploadNum, String writer) {
		this.recipeNum = recipeNum;
		this.recipeFileName = recipeFileName;
		this.writer = writer;
		this.recipeFileType = recipeFileType;
		this.recipeFileUploadNum = recipeFileUploadNum;
	}
	public int getRecipeNum() {
		return recipeNum;
	}
	public void setRecipeNum(int recipeNum) {
		this.recipeNum = recipeNum;
	}
	public String getRecipeFileName() {
		return recipeFileName;
	}
	public void setRecipeFileName(String recipeFileName) {
		this.recipeFileName = recipeFileName;
	}
	public String getRecipeFileType() {
		return recipeFileType;
	}
	public void setRecipeFileType(String recipeFileType) {
		this.recipeFileType = recipeFileType;
	}
	public int getRecipeFileUploadNum() {
		return recipeFileUploadNum;
	}
	public void setRecipeFileUploadNum(int recipeFileUploadNum) {
		this.recipeFileUploadNum = recipeFileUploadNum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
}
