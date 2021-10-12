package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
	private int idx; //��� ��ȣ
	private int writingIdx; //�� ��ȣ
	private String userId; //���� ���̵�
	private String content; //��� ����
}
