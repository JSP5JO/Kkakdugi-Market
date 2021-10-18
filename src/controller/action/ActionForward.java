package controller.action;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class ActionForward {

	boolean isRedirect=false;
	String url;
	
}
