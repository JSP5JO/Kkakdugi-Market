package dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {
	private int idx; //���� ��ȣ
	private String name; //�̸�
	private String id; //���̵�
	private String pw; //�н�����
	private String email; //�̸���
	private String proIdx; //������ ��ȣ(ī�װ� ��ȣ)
}
