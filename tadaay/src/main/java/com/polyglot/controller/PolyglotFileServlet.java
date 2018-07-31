package com.polyglot.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/appContent/*")
public class PolyglotFileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String filePath = URLDecoder.decode(request.getPathInfo().substring(1), "UTF-8");
		String fileName = URLDecoder.decode(request.getPathInfo().substring(2), "UTF-8");
		File file = new File(filePath);
		response.setHeader("Content-Type", getServletContext().getMimeType(fileName));
		response.setHeader("Content-Length", String.valueOf(file.length()));
		response.setHeader("Content-Disposition", "inline; filename=\"" + file.getName() + "\"");
		Files.copy(file.toPath(), response.getOutputStream());
		response.flushBuffer();
	}

}
