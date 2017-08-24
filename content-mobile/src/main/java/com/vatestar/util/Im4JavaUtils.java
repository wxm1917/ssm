package com.vatestar.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;

import javax.imageio.ImageIO;

import org.im4java.core.CompositeCmd;
import org.im4java.core.ConvertCmd;
import org.im4java.core.IM4JavaException;
import org.im4java.core.IMOperation;
import org.im4java.core.IdentifyCmd;
import org.im4java.process.ArrayListOutputConsumer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 缩略图处理工具类.
 * 
 * @version 1.0版本
 */
public class Im4JavaUtils {

	/**
	 * slf4j Logger for Im4JavaUtils.
	 */
	private static final Logger logger = LoggerFactory.getLogger(Im4JavaUtils.class);

	/**
	 * 乘号
	 */
	public static final String PRODUCT_SIGN = "x";

	/**
	 * 文件格式转换
	 */
	public static void changeFileType(String sourcePath, String newPath, String newFormatName) throws Exception {
		File file = new File(sourcePath);
		if (null != file && file.exists() && file.canRead()) {
			try {
				BufferedImage image = ImageIO.read(file);
				ImageIO.write(image, newFormatName, new File(newPath));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 创建图片缩略图
	 * <p/>
	 * .
	 * 
	 * @param path
	 *            图片路径
	 * @param newfile
	 *            缩略图路径
	 * @param width
	 *            the width
	 * @param hight
	 *            the hight
	 * @throws Exception
	 *             the exception
	 */
	public static void thumbnail(String path, String newfile, int width, int hight) throws Exception {
		logger.debug("构建缩略图：{}==>{}", path, newfile);
		IMOperation op = new IMOperation();
		ConvertCmd cmd = new ConvertCmd(true);
		// ConvertCmd cmd = new ConvertCmd(false);
		try {
			op.addImage();
			op.resize(width, hight);
			op.addImage();
			// 压缩
			cmd.run(op, path, newfile);
			// cmd.run(op);
			logger.debug("生成缩略图：{}==>{}", path, newfile);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 图片加水印
	 * 
	 * @param picPath
	 * @param waterPicPath
	 * @param newFile
	 * @param dissolve
	 *            透明度0-100
	 * @param aspect
	 *            方位
	 * @param x
	 * @param y
	 */
	public static void addWaterMark(String picPath, String waterPicPath, String newFile, int dissolve, String aspect,
			int x, int y) throws Exception {
		logger.debug("图片加水印：{}==>{}", picPath, newFile);
		IMOperation op = new IMOperation();
		op.gravity(aspect);
		op.geometry(null, null, x, y);
		op.dissolve(dissolve);
		op.addImage(waterPicPath);
		op.addImage(picPath);
		op.addImage(newFile);
		CompositeCmd cmd = new CompositeCmd(true);
		try {
			cmd.run(op);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * * 获得图片文件大小[小技巧来获得图片大小] * * @param filePath * 文件路径 *
	 * 
	 * @return 文件大小
	 */
	public static int getSize(String imagePath) {
		int size = 0;
		FileInputStream inputStream = null;
		try {
			inputStream = new FileInputStream(imagePath);
			size = inputStream.available();
			inputStream.close();
			inputStream = null;
		} catch (FileNotFoundException e) {
			size = 0;
			logger.debug("文件未找到!");
		} catch (IOException e) {
			size = 0;
			logger.debug("读取文件大小错误!");
		} finally {
			// 可能异常为关闭输入流,所以需要关闭输入流
			if (null != inputStream) {
				try {
					inputStream.close();
				} catch (IOException e) {
					logger.debug("关闭文件读入流异常");
				}
				inputStream = null;
			}
		}
		return size;
	}

	/**
	 * 获得图片的宽度和高度
	 * 
	 * @param filePath
	 *            文件路径
	 * @return 图片宽度和高度
	 */
	public static int[] getWidthAndHeigh(String imagePath) {
		int[] result = new int[2];
		int width = 0;
		int heigh = 0;
		try {
			IMOperation op = new IMOperation();
			op.format("%w"); // 设置获取宽度参数
			op.addImage(1);
			IdentifyCmd identifyCmd = new IdentifyCmd(true);
			ArrayListOutputConsumer output = new ArrayListOutputConsumer();
			identifyCmd.setOutputConsumer(output);
			identifyCmd.run(op, imagePath);
			ArrayList<String> cmdOutput = output.getOutput();
			assert cmdOutput.size() == 1;
			width = Integer.parseInt(cmdOutput.get(0));

			op = new IMOperation();
			op.format("%h"); // 设置获取高度参数
			op.addImage(1);
			identifyCmd = new IdentifyCmd(true);
			output = new ArrayListOutputConsumer();
			identifyCmd.setOutputConsumer(output);
			identifyCmd.run(op, imagePath);
			cmdOutput = output.getOutput();
			assert cmdOutput.size() == 1;
			heigh = Integer.parseInt(cmdOutput.get(0));

		} catch (Exception e) {
			width = 0;
			heigh = 0;
			logger.debug("运行指令出错!");
		}
		result[0] = width;
		result[1] = heigh;

		return result;
	}

	/**
	 * 获得图片的宽度
	 * 
	 * @param filePath
	 *            文件路径
	 * @return 图片宽度
	 */
	public static int getWidth(String imagePath) {
		int width = 0;
		try {
			IMOperation op = new IMOperation();
			op.format("%w"); // 设置获取宽度参数
			op.addImage(1);
			IdentifyCmd identifyCmd = new IdentifyCmd(true);
			ArrayListOutputConsumer output = new ArrayListOutputConsumer();
			identifyCmd.setOutputConsumer(output);
			identifyCmd.run(op, imagePath);
			ArrayList<String> cmdOutput = output.getOutput();
			assert cmdOutput.size() == 1;
			width = Integer.parseInt(cmdOutput.get(0));
		} catch (Exception e) {
			width = 0;
			logger.debug("运行指令出错!");
		}
		return width;
	}

	/**
	 * 获得图片的高度
	 * 
	 * @param imagePath
	 *            文件路径
	 * @return 图片高度
	 */
	public static int getHeight(String imagePath) {
		int heigh = 0;
		try {
			IMOperation op = new IMOperation();
			op.format("%h"); // 设置获取高度参数
			op.addImage(1);
			IdentifyCmd identifyCmd = new IdentifyCmd(true);
			ArrayListOutputConsumer output = new ArrayListOutputConsumer();
			identifyCmd.setOutputConsumer(output);
			identifyCmd.run(op, imagePath);
			ArrayList<String> cmdOutput = output.getOutput();
			assert cmdOutput.size() == 1;
			heigh = Integer.parseInt(cmdOutput.get(0));
		} catch (Exception e) {
			heigh = 0;
			logger.debug("运行指令出错!" + e.toString());
		}
		return heigh;
	}

	/**
	 * 图片信息
	 * 
	 * @param imagePath
	 * @return
	 */
	public static String getImageInfo(String imagePath) {
		String line = null;
		try {
			IMOperation op = new IMOperation();
			op.format("width:%w,height:%h,path:%d%f,size:%b%[EXIF:DateTimeOriginal]");
			op.addImage(1);
			IdentifyCmd identifyCmd = new IdentifyCmd(true);
			ArrayListOutputConsumer output = new ArrayListOutputConsumer();
			identifyCmd.setOutputConsumer(output);
			identifyCmd.run(op, imagePath);
			ArrayList<String> cmdOutput = output.getOutput();
			assert cmdOutput.size() == 1;
			line = cmdOutput.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return line;
	}

	/**
	 * 根据尺寸缩放图片[等比例缩放:参数height为null,按宽度缩放比例缩放;参数width为null,按高度缩放比例缩放]
	 * 
	 * @param imagePath
	 *            源图片路径
	 * @param newPath
	 *            处理后图片路径
	 * @param width
	 *            缩放后的图片宽度
	 * @param height
	 *            缩放后的图片高度
	 * @return 返回true说明缩放成功,否则失败
	 */
	public static boolean zoomImage(String imagePath, String newPath, Integer width, Integer height) {

		boolean flag = false;
		try {
			IMOperation op = new IMOperation();
			op.addImage(imagePath);
			if (width == null)
				op.resize(null, height);// 根据高度缩放图片
			else if (height == null)
				op.resize(width);// 根据宽度缩放图片
			else
				op.resize(width, height);

			op.addImage(newPath);
			ConvertCmd convert = new ConvertCmd(true);
			convert.run(op);
			flag = true;
		} catch (IOException e) {
			logger.debug("文件读取错误!");
			flag = false;
		} catch (InterruptedException e) {
			flag = false;
		} catch (IM4JavaException e) {
			flag = false;
		} finally {

		}
		return flag;
	}

	/**
	 * 图片旋转
	 * 
	 * @param imagePath
	 *            源图片路径
	 * @param newPath
	 *            处理后图片路径
	 * @param degree
	 *            旋转角度
	 */
	public static boolean rotate(String imagePath, String newPath, double degree) {
		boolean flag = false;
		try {
			// 1.将角度转换到0-360度之间
			degree = degree % 360;
			if (degree <= 0) {
				degree = 360 + degree;
			}
			IMOperation op = new IMOperation();
			op.addImage(imagePath);
			op.rotate(degree);
			op.addImage(newPath);
			ConvertCmd cmd = new ConvertCmd(true);
			cmd.run(op);
			flag = true;
		} catch (Exception e) {
			flag = false;
			logger.debug("图片旋转失败!");
		}
		return flag;
	}

	/**
	 * 裁剪图片
	 * 
	 * @param imagePath
	 *            源图片路径
	 * @param newPath
	 *            处理后图片路径
	 * @param x
	 *            起始X坐标
	 * @param y
	 *            起始Y坐标
	 * @param width
	 *            裁剪宽度
	 * @param height
	 *            裁剪高度
	 * @return 返回true说明裁剪成功,否则失败
	 */
	public static boolean cutImage(String imagePath, String newPath, int x, int y, int width, int height) {
		boolean flag = false;
		try {
			IMOperation op = new IMOperation();
			op.addImage(imagePath);
			/** width：裁剪的宽度 * height：裁剪的高度 * x：裁剪的横坐标 * y：裁剪纵坐标 */
			op.crop(width, height, x, y);
			op.addImage(newPath);
			ConvertCmd convert = new ConvertCmd(true);
			convert.run(op);
			flag = true;
		} catch (IOException e) {
			logger.debug("文件读取错误!");
			flag = false;
		} catch (InterruptedException e) {
			flag = false;
		} catch (IM4JavaException e) {
			flag = false;
		} finally {

		}
		return flag;
	}

	public static void main(String[] args) throws Exception {
		addWaterMark("/Users/dyl/123.jpg", "/Users/dyl/a100.jpg", "/Users/dyl/rs.jpg", 80, "southeast", 0, 5);
	}

}
