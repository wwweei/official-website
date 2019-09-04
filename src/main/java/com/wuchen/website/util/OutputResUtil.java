package com.wuchen.website.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.util.Map;

/**
 * @author 一世无辰
 *
 */
public class OutputResUtil {

	/**
	 * @author 一世无辰
	 * @param httpUrl  跳转jsp的http请求
	 * 获取到需要的jsp代码
	 */
	public synchronized void getJspToHtml(String httpUrl, String fileName) {
		fileName = fileName + ".html";
		
		InputStream in = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
		
		OutputStream os = null;
		OutputStreamWriter osw = null;
		BufferedWriter bw = null;
		try {
			URL url = new URL(httpUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			 connection.setRequestProperty("Content-Type", "text/plain; charset=utf-8");
			 connection.connect();
			 in = connection.getInputStream();
			 isr = new InputStreamReader(in, "utf-8");
			 br = new BufferedReader(isr);
			 
			 File html = new File(getPath() + fileName);
			 if (html.exists()) {
				 html.delete();
			 }
			 html.createNewFile();
			 os = new FileOutputStream(html);
			 osw = new OutputStreamWriter(os, "utf-8");
			 bw = new BufferedWriter(osw);
			 
			 
			 String currentLine;
			 while ((currentLine = br.readLine()) != null) {
				 bw.write(currentLine + "\n");
			 }
			 
			 bw.flush();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				isr.close();
				in.close();
				
				bw.close();
				osw.close();
				os.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	/**
	 * @author 一世无辰
	 * @return 当前项目绝对路径
	 * @throws UnsupportedEncodingException
	 * 2019年6月29日下午8:28:28
	 */
	public String getPath() throws UnsupportedEncodingException {
		String path = getClass().getResource("").getPath();
		path = path.substring(0, path.lastIndexOf("WEB-INF"));
		path = URLDecoder.decode(path, "utf-8");
		path += "pages"+File.separator+"official-website"+File.separator;
		return path;
	}
	
}
