package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Writing {
	private int idx; //�۹�ȣ
	private String categoryIdx; //ī�װ� ��ȣ
	private String userId; //���� ���̵�
	private String subject; //�� ����
	private String content; //�� ����
}
