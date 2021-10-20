package dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Categorylist {
	private int idx;
	private String userId; 
	private String password;
	private String subject;
	private String content;
	private int readCount;
	private Timestamp wdate;
	private short commentCount;
}