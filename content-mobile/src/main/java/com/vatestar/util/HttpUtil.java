package com.vatestar.util;

import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
//import sun.misc.BASE64Encoder;

import org.springframework.web.multipart.MultipartFile;

import com.vatestar.cm.controller.ImgCompositeController;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * HttpUtil
 */
public class HttpUtil {
    protected static final Logger logger = LoggerFactory.getLogger(HttpUtil.class);

    private static final String DEFAULT_CHARSET = "UTF-8";
    private static final int READ_TIMEOUT = 3 * 1000;
    private static final int CONNECTION_TIMEOUT = 10 * 1000;
    private static RequestConfig requestConfig;

    static {
        RequestConfig.Builder configBuilder = RequestConfig.custom();
        //设置连接超时
        configBuilder.setConnectTimeout(CONNECTION_TIMEOUT);
        //设置读取超时
        configBuilder.setSocketTimeout(READ_TIMEOUT);
        //设置从连接池获取连接实例的超时
        configBuilder.setConnectionRequestTimeout(CONNECTION_TIMEOUT);
        requestConfig = configBuilder.build();
    }


    public static HttpSendResult doGet(String url) {
        return doGet(url, null);
    }


    public static HttpSendResult doGet(String url, Map<String, String> headers) {
        HttpSendResult sendResult = new HttpSendResult();
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet get = new HttpGet(url);
        CloseableHttpResponse httpResponse = null;
        try {
            //set request header
            if (headers != null) {
                for (Map.Entry<String, String> entry : headers.entrySet()) {
                    get.addHeader(entry.getKey(), entry.getValue());
                }
            }
            //do get
            httpResponse = httpClient.execute(get);
            int responseCode = httpResponse.getStatusLine().getStatusCode();
            String response = EntityUtils.toString(httpResponse.getEntity(), DEFAULT_CHARSET);
            sendResult.setStatusCode(responseCode);
            sendResult.setResponse(response);
        } catch (Exception e) {
            sendResult.setException(e);
        } finally {
            if (httpResponse != null) {
                try {
                    EntityUtils.consume(httpResponse.getEntity());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return sendResult;
    }


    public static HttpSendResult doPost(String url, Map<String, String> params) {
        return doPost(url, null, params);
    }


    public static HttpSendResult doPost(String url, Map<String, String> headers, Map<String, String> params) {
        HttpSendResult sendResult = new HttpSendResult();
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost post = new HttpPost(url);
        CloseableHttpResponse httpResponse = null;
        try {
            post.setConfig(requestConfig);
            //set request header
            if (headers != null) {
                for (Map.Entry<String, String> entry : headers.entrySet()) {
                    post.addHeader(entry.getKey(), entry.getValue());
                }
            }
            //set form data
            List<NameValuePair> pairList = new ArrayList<>(params.size());
            for (Map.Entry<String, String> entry : params.entrySet()) {
                NameValuePair pair = new BasicNameValuePair(entry.getKey(), entry.getValue());
                pairList.add(pair);
            }
            post.setEntity(new UrlEncodedFormEntity(pairList, Charset.forName("UTF-8")));
            //do post
            httpResponse = httpClient.execute(post);
            int responseCode = httpResponse.getStatusLine().getStatusCode();
            String response = EntityUtils.toString(httpResponse.getEntity(), DEFAULT_CHARSET);
            sendResult.setStatusCode(responseCode);
            sendResult.setResponse(response);
        } catch (IOException e) {
            sendResult.setException(e);
        } finally {
            if (httpResponse != null) {
                try {
                    EntityUtils.consume(httpResponse.getEntity());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return sendResult;
    }


    public static HttpSendResult doPostJson(String url, String jsonData) {
        return doPostJson(url, null, jsonData);
    }


    public static HttpSendResult doPostJson(String url, Map<String, String> headers, String jsonData) {
        HttpSendResult sendResult = new HttpSendResult();
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost post = new HttpPost(url);
        CloseableHttpResponse httpResponse = null;
        try {
            post.setConfig(requestConfig);
            //set request header
            if (headers != null) {
                for (Map.Entry<String, String> entry : headers.entrySet()) {
                    post.addHeader(entry.getKey(), entry.getValue());
                }
            }
            //set request body
            StringEntity reqEntity = new StringEntity(jsonData, DEFAULT_CHARSET);//解决中文乱码问题
            reqEntity.setContentEncoding(DEFAULT_CHARSET);
            reqEntity.setContentType(MediaType.APPLICATION_JSON_VALUE);
            post.setEntity(reqEntity);
            //do post
            httpResponse = httpClient.execute(post);
            int responseCode = httpResponse.getStatusLine().getStatusCode();
            String response = EntityUtils.toString(httpResponse.getEntity(), DEFAULT_CHARSET);
            sendResult.setStatusCode(responseCode);
            sendResult.setResponse(response);
        } catch (IOException e) {
            sendResult.setException(e);
        } finally {
            if (httpResponse != null) {
                try {
                    EntityUtils.consume(httpResponse.getEntity());
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return sendResult;
    }
    
 public static String fileUploadImage(MultipartFile file,String uploadDir) throws Exception {
    	
  		InputStream stream = file.getInputStream();
  		
  		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String date=sdf.format(new Date());
		long times=new Date().getTime();
		
		String sourceImageName= file.getOriginalFilename();
		String newImgName=date+"-"+times+sourceImageName.subSequence(sourceImageName.indexOf("."), sourceImageName.length());
  		
  		
  		String fileNameFull = uploadDir+File.separator+ImgCompositeController.IMG_STORE_ADDRESS+File.separator +newImgName;//file.getOriginalFilename()

  		File filePath = new File(uploadDir+File.separator+ImgCompositeController.IMG_STORE_ADDRESS);
  		if (!filePath.exists()) {
  			filePath.mkdirs();
  		}
  		
  		if (!new File(fileNameFull).exists()) {
  			new File(fileNameFull).delete();
  		}
  		
  		
  		OutputStream bos = new FileOutputStream(fileNameFull);
  		int bytesRead = 0;
  		byte[] buffer = new byte[8192];
  		while ((bytesRead = stream.read(buffer, 0, 8192)) != -1) {
  			bos.write(buffer, 0, bytesRead);
  		}
  		bos.close();
  		stream.close();
  		return ImgCompositeController.IMG_STORE_ADDRESS+File.separator +newImgName;//file.getOriginalFilename()
  	}


//    public static String makeBaseAuth(String user, String password) {
//        String auth = user + ':' + password;
//        String hash = new BASE64Encoder().encode(auth.getBytes());
//        return "Basic " + hash;
//    }

}
