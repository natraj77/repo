package com.polyglot.utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.polyglot.domain.AppPolyglotLead;

public class ExcelBuilder extends AbstractXlsView {

	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {/*
		@SuppressWarnings("unchecked")
		List<AppPolyglotLead> leads = (ArrayList<AppPolyglotLead>) model.get("leads");

		// create style for header cells
		CellStyle style = workbook.createCellStyle();
		Font font = workbook.createFont();
		font.setFontName("Arial");
		style.setFillForegroundColor(HSSFColor.GREY_50_PERCENT.index);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setColor(HSSFColor.WHITE.index);
		style.setFont(font);

		HSSFWorkbook downloadable = (HSSFWorkbook) workbook;
		if (leads != null && leads.size() > 0) {
			HSSFSheet sheet = downloadable
					.createSheet("Lead Information");

			sheet.setDefaultColumnWidth(30);
			// create header row
			HSSFRow header = sheet.createRow(0);
			Field[] fields = AppPolyglotLead.class.getDeclaredFields();

			for (int i = 0; i < fields.length; i++) {
				if (fields[i] != null && fields[i].getName() != null
						&& StringUtils.isNotEmpty(fields[i].getName())) {
					header.createCell(i).setCellValue(fields[i].getName());
					header.getCell(i).setCellStyle(style);
				}
			}
			int rowCount = 1;
			for (AppPolyglotLead lead : leads) {
				HSSFRow aRow = sheet.createRow(rowCount++);
				aRow.createCell(0).setCellValue(lead.getId());
				aRow.createCell(1).setCellValue(lead.getAppPolyglotBranch() != null ? lead.getAppPolyglotBranch().getName() : "");
				aRow.createCell(2).setCellValue(lead.getFirstName());
				aRow.createCell(3).setCellValue(lead.getLastName());
				aRow.createCell(4).setCellValue(lead.getCourse());
				aRow.createCell(5).setCellValue(lead.getMobile());
				aRow.createCell(6).setCellValue(lead.getEmail());
				aRow.createCell(7).setCellValue(lead.getMode());
				aRow.createCell(8).setCellValue(lead.getSchedule());
				aRow.createCell(9).setCellValue(lead.getPreferredTime());
				aRow.createCell(10).setCellValue(lead.getSource());
				
				aRow.createCell(11).setCellValue(lead.getRefferedBy());
				aRow.createCell(12).setCellValue(lead.getBatchId());
				aRow.createCell(13).setCellValue(lead.getLeadStatus());
			}
		}

	*/}
}