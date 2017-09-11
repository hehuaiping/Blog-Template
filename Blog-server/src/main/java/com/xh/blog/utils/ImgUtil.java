package com.xh.blog.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class ImgUtil {
	
	private static final String IMG_URL = "https://api.dujin.org/bing/1920.php";
	
	public static void main(String[] args) throws IOException {
		URL url = new URL(IMG_URL);
		
		HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
		//设置网络超时时间
		urlConnection.setConnectTimeout(3000);
		//设置应用程序从网络中读取数据
		urlConnection.setDoInput(true);
		
		//获取响应代码
		int responseCode = urlConnection.getResponseCode();
		//判断是否是成功状态
		if(200 == responseCode) {
			//获取输入流
			InputStream inputStream = urlConnection.getInputStream();
			FileOutputStream os = new FileOutputStream(new File(""));
			int len = 0;
			byte[] by = new byte[1024];
			while((len = inputStream.read(by)) != -1 ) {
				os.write(by, 0, len);
			}
		}
	}
}
