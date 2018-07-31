package com.polyglot.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

public class PolyglotFileUtils {

	private static final Logger logger = Logger.getLogger(PolyglotFileUtils.class);
	private static MessageDigest md;

	public static File getFile(MultipartFile file) throws IOException {
		logger.debug("original file name is:"+file.getOriginalFilename());
		File convFile = new File(file.getOriginalFilename());
		convFile.createNewFile();
		FileOutputStream fos = new FileOutputStream(convFile);
		fos.write(file.getBytes());
		fos.close();
		return convFile;
	}
	
	public static String cryptWithMD5(String pass) {
		try {
			md = MessageDigest.getInstance("MD5");
			byte[] passBytes = pass.getBytes();
			md.reset();
			byte[] digested = md.digest(passBytes);
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < digested.length; i++) {
				sb.append(Integer.toHexString(0xff & digested[i]));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException ex) {
			logger.error("Error generating MD5 encryption");
		}
		return null;
	}
	
	/**
	 * Check if encryption is requeired or not.
	 * @param s
	 * @return
	 */
	public static boolean isValidMD5(String s) {
	    return s.matches("[a-fA-F0-9]{32}");
	}
	
	/**
	 * 
	 * @param collection
	 * @return
	 */
	public static boolean isEmpty(Collection<?> collection){
		if(null == collection || collection.isEmpty()){
			return true;
		}
		return false;
	}
	
	/**
	 * 
	 * @param map
	 * @return
	 */
	public static boolean isEmpty(Map<?, ?> map){
		if(null == map || map.isEmpty()){
			return true;
		}
		return false;
	}
	
	/**
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str){
		if(null == str || str.trim().isEmpty()){
			return true;
		}
		return false;
	}	

	
	public static <T> Predicate<T> distinctByKey(Function<? super T, Object> keyExtractor) {
		Map<Object, Boolean> map = new ConcurrentHashMap<>();
		return t -> map.putIfAbsent(keyExtractor.apply(t), Boolean.TRUE) == null;
	}
	
	public static String convertTimeStampToString(Timestamp dateObj){
		logger.debug("Inside of convertTimeStampToString");
		String formattedDate = null;
		if(null != dateObj){
			Date date = new Date();
			date.setTime(dateObj.getTime());
			formattedDate = new SimpleDateFormat("yyyy-MM-dd").format(date);
		}
		logger.debug("Exit of convertTimeStampToString");
		return formattedDate;
	}
	
	public static String convertTimeStampToString(Timestamp dateObj, String formatType){
		logger.debug("Inside of convertTimeStampToString");
		String formattedDate = null;
		SimpleDateFormat formatter = null;
		if(null != dateObj){
			formatter = new SimpleDateFormat(formatType);
			Date date = new Date();
			date.setTime(dateObj.getTime());
			formattedDate = formatter.format(date);
		}
		logger.debug("Exit of convertTimeStampToString");
		return formattedDate;
	}
}
