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
		// 目标值
		BigDecimal target = BigDecimal.valueOf(9);
		// 记录下标1
		Integer numsA;
		// 记录下标2
		Integer numsB;
		// 用于判断是否重复使用数组元素 重复使用则置为true跳入下次循环
		boolean falge = false;

		Pattern pattern = Pattern.compile("[0-9]*");
		for (int i = 0; i < nums.length; i++) {
			// 整数判断
			if (!pattern.matcher(String.valueOf(nums[i])).matches()) {
				continue;
			}
			// 防止出现 当前元素加当前元素 符合要求 加i！=j判断
			for (int j = 0; j < nums.length && i != j; j++) {
				// 判断前重新置为false 防止出错
				falge = false;
				// 判断是否重复使用元素
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
				// 整数判断
				if (!pattern.matcher(String.valueOf(nums[j])).matches()) {
					continue;
				}
				if (nums[i].add(nums[j]).compareTo(target)==0) {
					// 将符合要求的数组下标记录到list中用于判断 是否重复使用数组元素
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
