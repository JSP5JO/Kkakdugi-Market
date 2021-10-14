package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Writing {
	private int idx; 
	private String categoryIdx;
	private String userId;
	private String subject;
	private String content;
}