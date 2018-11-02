package com.qfedu.commons;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ValidateImageUtil {
    private static int width = 120;
    private static int height = 30;
    private static Random random = new Random();
    private static List<String> code = null;

    //生成随机颜色
    public static Color getColor(){

        int R = random.nextInt(256);
        int G = random.nextInt(256);
        int B = random.nextInt(256);
        Color color = new Color(R, G, B);
        return color;
    }

    //随机生成规则
    public  static void createCode(){
        //每次生成前进行清空操作，以防止拼接
        code = new ArrayList<>();
        String a="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        for(int i=0;i<4;i++){
            int index = (int) (Math.random() * 62);
            char c = a.charAt(index);
            code.add(c+"");
        }

    }
    //得到生成的验证码字符串
    public static String getCode(){
        StringBuffer sb = new StringBuffer();
        for(int i=0;i<code.size();i++){
            sb.append(code.get(i));
        }
        return sb.toString();
    }
    //绘制验证码
    public static BufferedImage drawValidate(){
        //创建一个带缓冲的对象
        BufferedImage img = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        //创建画笔
        Graphics graphics = img.createGraphics();
        //描绘边框
        graphics.setColor(Color.WHITE);
        graphics.drawRect(0,0, width, height);
        graphics.setColor(Color.white);
        graphics.fillRect(1,1,width-2,height-2);

        //设置字体
        graphics.setFont(new Font("黑体",Font.ITALIC|Font.BOLD,25));
        //填充文字,为每个字设置不同的颜色
        for(int i=0;i<code.size();i++){
            graphics.setColor(getColor());
            graphics.drawString(code.get(i),20+i*20,18);
        }
        //画 干扰线  循环控制条数
         for(int i=0;i<10;i++){
            graphics.setColor(getColor());
            graphics.drawLine(random.nextInt(width),random.nextInt(height),random.nextInt(width),random.nextInt(height));
         }
        return img;

    }
   //输出
    public static void outImg(RenderedImage renderedImage , String format, OutputStream outputStream) throws IOException {
        ImageIO.write(renderedImage,format,outputStream);
    }
}
