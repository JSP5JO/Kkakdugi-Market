package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Bbs {
	private int boardId;
	private int writingIdx;
	private String bbsTitle;
	private String userId;
	private String bbsDate;
	private String bbsContent;
	private String map;
	private int bbsAvailable;
	
}
