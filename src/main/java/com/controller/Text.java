package com.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class Text {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		BigDecimal nums[] = { BigDecimal.valueOf(2), BigDecimal.valueOf(7), BigDecimal.valueOf(11),
				BigDecimal.valueOf(15) ,BigDecimal.valueOf(4.5),BigDecimal.valueOf(4.5)};
		List<Integer[]> list = new ArrayList<>();
		// Ŀ��ֵ
		BigDecimal target = BigDecimal.valueOf(9);
		// ��¼�±�1
		Integer numsA;
		// ��¼�±�2
		Integer numsB;
		// �����ж��Ƿ��ظ�ʹ������Ԫ�� �ظ�ʹ������Ϊtrue�����´�ѭ��
		boolean falge = false;

		Pattern pattern = Pattern.compile("[0-9]*");
		for (int i = 0; i < nums.length; i++) {
			// �����ж�
			if (!pattern.matcher(String.valueOf(nums[i])).matches()) {
				continue;
			}
			// ��ֹ���� ��ǰԪ�ؼӵ�ǰԪ�� ����Ҫ�� ��i��=j�ж�
			for (int j = 0; j < nums.length && i != j; j++) {
				// �ж�ǰ������Ϊfalse ��ֹ����
				falge = false;
				// �ж��Ƿ��ظ�ʹ��Ԫ��
				for (int k = 0; k < list.size() && list.size() > 0; k++) {
					numsA = list.get(k)[0];
					numsB = list.get(k)[1];
					if ((numsA == j && numsB == i) || (numsA == i && numsB == j)) {
						falge = true;
					}
				}
				if (falge) {
					continue;
				}
				// �����ж�
				if (!pattern.matcher(String.valueOf(nums[j])).matches()) {
					continue;
				}
				if (nums[i].add(nums[j]).compareTo(target)==0) {
					// ������Ҫ��������±��¼��list�������ж� �Ƿ��ظ�ʹ������Ԫ��
					Integer[] indexs = new Integer[2];
					indexs[0] = i;
					indexs[1] = j;
					list.add(indexs);

					System.out.println("[" + i + "," + j + "]");
				}

			}

		}

	}

}
