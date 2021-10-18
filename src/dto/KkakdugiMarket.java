package dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class KkakdugiMarket {

	private int idx;
	private String categoryIdx;
	private String userId;
	private String subject;
	private String content;
	private String readCount;
	private short commentCount;
	private Timestamp wdate;
}
