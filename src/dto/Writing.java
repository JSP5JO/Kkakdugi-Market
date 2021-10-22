package dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Writing {
	private int idx; 
	private String categoryIdx;
	private String name;	// 카테고리 이름
	private String userId;
	private String subject;
	private String content;
	private int readCount;
	private short commentCount;
	private Timestamp wdate;
}