package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Jjim {
	private String userId; 
	private int writingIdx; 
	private String categoryIdx;
}