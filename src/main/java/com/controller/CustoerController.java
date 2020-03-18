package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Customer;
import com.model.User;
import com.service.CustomerService;
import com.service.UserService;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

@Controller

@RequestMapping("/customer")
public class CustoerController {
	private static WritableCellFormat wcf_value;
	// ���������ʽ
	private static WritableCellFormat wcf_value_left;
	private static WritableCellFormat wcf_key;
	// ��ͷ��ʽ
	private static WritableCellFormat wcf_name_left;
	// ������ʽ
	private static WritableCellFormat wcf_name_right;
	// ������ʽ
	private static WritableCellFormat wcf_name_center;
	// ������ʽ
	private static WritableCellFormat wcf_title;
	// ҳ������ʽ
	private static WritableCellFormat wcf_percent_float;

	@Resource
	private CustomerService customerService;
	
	@Resource
	private UserService userService;
	@RequestMapping("/select")
	public String select(Customer customer, User user, HttpServletRequest request) {

		return "customerInsert";

	}

	@RequestMapping("/insert")
	@ResponseBody
	public Map<String, String> insert(@RequestBody Customer customer, HttpServletRequest request) {
		// selectByPrimaryKey
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// �������ڸ�ʽ
		Date date = new Date(System.currentTimeMillis());
		customer.setInsertDate(date);
		customer.setUpdateDate(date);
		Map<String, String> resMap = new HashMap<>();
		User user = (User) request.getSession().getAttribute("user");
		int count = customerService.selectByPhoneCount(customer);
		if (count > 0 ) {
			resMap.put("eorLog", "�벻Ҫ¼���ظ��ͻ�");
		}
		if (user != null && count == 0) {
			customer.setSalesMan(String.valueOf(user.getId()));
			customer.setSalesManName(user.getName());
			customer.setPriorityLevel(2);
			// new Date()Ϊ��ȡ��ǰϵͳʱ��
			customerService.insertCustomerInfo(customer);
			int id = customerService.selectMaxId();
			customer.setId(id);
			customerService.insertCustomerLog(customer);
			resMap.put("date", "date");

		} 

		return resMap;

	}

	@RequestMapping("/insertPage")
	public String insertPage(Customer customer, User user, HttpServletRequest request) {
		// selectByPrimaryKey
		System.out.println(user.getName());
		return "customerInsert";

	}

	@RequestMapping("/list")
	public String List(Customer customer, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		customer.setUser(user);
		List<Customer> customerList = customerService.selectCustomerAll(customer);
		request.setAttribute("customerSelectInfo", customer);
		request.setAttribute("customerList", customerList);
		request.setAttribute("userList",userService.selectUserAllLevel());

		if (user == null) {
			return "index";
		} else {
			return "customerList";
		}

	}

	@RequestMapping("/updatePage")
	public String customerUpdate(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("customerId"));
		Customer customer = customerService.selectCustomerListById(id);
		customer.setId(id);
		request.setAttribute("customer", customer);
		request.setAttribute("userList",userService.selectUserAllLevel());
		return "customerUpdatePage";

	}

	@RequestMapping("/logList")
	public String customerLogList(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("customerId"));
		List<Customer> customer = customerService.selectCustomerLogListById(id);
		request.setAttribute("customerList", customer);
		request.setAttribute("customerid", id);
		return "customerLogList";

	}

	@RequestMapping("/update")
	@ResponseBody
	public Map<String, String> update(@RequestBody Customer customer, HttpServletRequest request) {
		System.out.println("update");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// �������ڸ�ʽ
		Date date = new Date(System.currentTimeMillis());
		User user = (User) request.getSession().getAttribute("user");
		customer.setUpdateDate(date);
		customer.setSalesMan(String.valueOf(user.getId()));
		customer.setSalesManName(user.getName());
		if (("����").equals(customer.getState())) {
			customer.setPriorityLevel(0);
		} else {
			customer.setPriorityLevel(1);
		}
		
		customerService.insertCustomerLog(customer);
		
		System.out.println("hhhhh"+customer.getUserId());
		if (customer.getUserId() != null && !"".equals(customer.getUserId())) {
			User updateSalam=userService.selectByPrimaryKey(Integer.valueOf(customer.getUserId()));
			customer.setSalesMan(String.valueOf(updateSalam.getId()));
			customer.setSalesManName(updateSalam.getName());
			System.out.println("ssss"+updateSalam.getId());
			System.out.println("ssss"+updateSalam.getName());
		}
		System.out.println(customer.getSalesMan());
		System.out.println(customer.getSalesManName());
		customerService.updateCustomerInfo(customer);
		Map<String, String> resMap = new HashMap<>();
		resMap.put("date", "date");
		return resMap;

	}

	@RequestMapping("/downLoad")
	public void downLoad(Customer customer, HttpServletRequest request, HttpServletResponse response)
			throws IOException, WriteException {
		System.out.println(customer.getCustomerName());
		response.addHeader("Content-Disposition",
				"attachment;filename=" + new String(("ziliao.xls").getBytes("utf-8"), "iso8859-1"));
		OutputStream os = response.getOutputStream();
		/****** �������ʽstart *****/
		WritableFont wf_key = new jxl.write.WritableFont(WritableFont.createFont("����"), 10, WritableFont.NO_BOLD);
		WritableFont wf_value = new jxl.write.WritableFont(WritableFont.createFont("����"), 10, WritableFont.NO_BOLD);
		// ���õ�Ԫ����ʽ
		wcf_value = new WritableCellFormat(wf_value);
		// ��Ԫ��������ʽ
		wcf_value.setAlignment(jxl.format.Alignment.CENTRE);
		// ��Ԫ��ˮƽ������ʽ
		wcf_value.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
		// ��Ԫ��ֱ������ʽ
		wcf_value_left = new WritableCellFormat(wf_value);
		wcf_value_left.setAlignment(jxl.format.Alignment.LEFT);
		wcf_value_left.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
		wcf_value_left.setWrap(true);
		wcf_key = new WritableCellFormat(wf_key);
		wcf_key.setAlignment(jxl.format.Alignment.CENTRE);
		wcf_key.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN);
		wcf_name_left = new WritableCellFormat(wf_key);
		wcf_name_left.setAlignment(Alignment.LEFT);
		wcf_name_left.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
		wcf_name_right = new WritableCellFormat(wf_key);
		wcf_name_right.setAlignment(Alignment.LEFT);
		wcf_name_center = new WritableCellFormat(wf_key);
		wcf_name_center.setAlignment(Alignment.CENTRE);
		jxl.write.NumberFormat wf_percent_float = new jxl.write.NumberFormat("0.00");
		// ���嵥Ԫ������������
		wcf_percent_float = new jxl.write.WritableCellFormat(wf_value, wf_percent_float);
		wcf_percent_float.setAlignment(jxl.format.Alignment.CENTRE);
		wcf_percent_float.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
		wcf_percent_float.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN);
		WritableFont wf_title = new jxl.write.WritableFont(WritableFont.createFont("����"), 18, WritableFont.NO_BOLD);
		// ���������ʽ
		wcf_title = new WritableCellFormat(wf_title);
		wcf_title.setAlignment(Alignment.CENTRE);
		wcf_title.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN);
		/****** �������ʽend *****/// ���ݴ��������list������excel��������
		try {
			WritableWorkbook wb = Workbook.createWorkbook(os);
			// ����Excel����������
			WritableSheet ws = wb.createSheet("����ƻ�", 0);
			int startRowNum = 0;
			// ��ʼ��
			int startColNum = 0;
			// ��ʼ��
			int maxColSize = 12;
			// �������// �����п�
			ws.setColumnView(0, 10);
			ws.setColumnView(1, 18);
			ws.setColumnView(2, 12);
			ws.setColumnView(3, 12);
			ws.setColumnView(4, 12);
			ws.setColumnView(5, 28);
			ws.setColumnView(6, 28);
			ws.setColumnView(7, 28);
			ws.setColumnView(8, 28);
			ws.setColumnView(9, 28);
			ws.setColumnView(10, 28);
			ws.setColumnView(11, 28);
			ws.addCell(new Label(startColNum, startRowNum, "�ͻ�����", wcf_title));
			ws.mergeCells(startColNum, startRowNum, startColNum + maxColSize - 1, startRowNum);
			// �ϲ���Ԫ�񣬺ϲ�(1,0)��(1,9)startColNum =
			// 0;
			startRowNum++;//��1�У����Ʊ�ͷ
			ws.addCell(new Label(startColNum, startRowNum, "����", wcf_key));
			startColNum++;
			ws.addCell(new Label(startColNum, startRowNum, "�Ԓ", wcf_key));
			startColNum++;
			ws.addCell(new Label(startColNum, startRowNum, "܇ϵ", wcf_key));
			startColNum++;
			ws.addCell(new Label(startColNum, startRowNum, "܇��", wcf_key));
			startColNum++;
			ws.addCell(new Label(startColNum, startRowNum, "���򼶱�", wcf_key));
			startColNum++;
			ws.addCell(new Label(startColNum, startRowNum, "��Դ", wcf_key));
			startColNum++;
			ws.addCell(new Label(startColNum, startRowNum, "״̬", wcf_key));
			startColNum++;
			ws.addCell(new Label(startColNum, startRowNum, "Ԥ�ƹ���ʱ��", wcf_key));
			startColNum++;
			ws.addCell(new Label(startColNum, startRowNum, "�r��", wcf_key));
			startColNum++;
			ws.addCell(new Label(startColNum, startRowNum, "��ע", wcf_key));
			startColNum++;
			ws.addCell(new Label(startColNum, startRowNum, "������Ա", wcf_key));
			startColNum++;
			ws.addCell(new Label(startColNum, startRowNum, "���r�g", wcf_key));
			startColNum++;

			// ��������1����������Ϊ0
			startRowNum++;
			startColNum = 0;
			// ��Ӽ�¼
			List<Customer> customerList = customerService.selectCustomerAll(customer);

			for (Customer ar : customerList) {
				ws.addCell(new Label(startColNum, startRowNum, String.valueOf(ar.getCustomerName()), wcf_key));
				startColNum++;
				ws.addCell(new Label(startColNum, startRowNum, String.valueOf(ar.getPhone()), wcf_key));
				startColNum++;
				if (ar.getCarSystem()!= null) {
					ws.addCell(new Label(startColNum, startRowNum, String.valueOf(ar.getCarSystem()), wcf_key));
				}else {
					ws.addCell(new Label(startColNum, startRowNum, String.valueOf(ar.getCarSystem()), wcf_key));
				}
				startColNum++;
				if (ar.getCarType()!= null) {
					ws.addCell(new Label(startColNum, startRowNum, String.valueOf(ar.getCarType()), wcf_key));
				}else {
					ws.addCell(new Label(startColNum, startRowNum, "", wcf_key));
				}
				startColNum++;
				if (ar.getIntentionLevel()!= null) {
					ws.addCell(new Label(startColNum, startRowNum, String.valueOf(ar.getIntentionLevel()), wcf_key));
				}else {
					ws.addCell(new Label(startColNum, startRowNum, "", wcf_key));
				}
				startColNum++;
				if (ar.getUserSource()!= null) {
					ws.addCell(new Label(startColNum, startRowNum, String.valueOf(ar.getUserSource()), wcf_key));
				}else {
					ws.addCell(new Label(startColNum, startRowNum, "", wcf_key));
				}
				startColNum++;
				if (ar.getState()!= null) {
					ws.addCell(new Label(startColNum, startRowNum, String.valueOf(ar.getState()), wcf_key));
				}else {
					ws.addCell(new Label(startColNum, startRowNum, "", wcf_key));
				}
				startColNum++;
				if (ar.getBuyDate()!= null) {
					ws.addCell(new Label(startColNum, startRowNum, String.valueOf(ar.getBuyDate()), wcf_key));
				}else {
					ws.addCell(new Label(startColNum, startRowNum, "", wcf_key));
				}
				startColNum++;
				if (ar.getPrice()!= null) {
					ws.addCell(new Label(startColNum, startRowNum, String.valueOf(ar.getPrice()), wcf_key));
				}else {
					ws.addCell(new Label(startColNum, startRowNum, "", wcf_key));
				}
				startColNum++;
				if (ar.getRemark()!= null) {
					ws.addCell(new Label(startColNum, startRowNum, String.valueOf(ar.getRemark()), wcf_key));
				}else {
					ws.addCell(new Label(startColNum, startRowNum, "", wcf_key));
				}
				startColNum++;
				ws.addCell(new Label(startColNum, startRowNum, String.valueOf(ar.getSalesManName()), wcf_key));
				startColNum++;
				ws.addCell(new Label(startColNum, startRowNum, String.valueOf(ar.getUpdateDate()), wcf_key));
				startColNum++;
				startRowNum++;
				startColNum = 0;
			}
			wb.write();
			// ����Excel������
			wb.close();
		} catch (

		Exception e) {
			e.printStackTrace();
		}
	}

}
