package com.chris.java.authman.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @Description: 日期工具类
 * .
 * @Date 2020/2/4 12:59
 **/
public class DateUtil {
    public static Date getDateAdd(int days){
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c = Calendar.getInstance();
        c.add(Calendar.DAY_OF_MONTH, -days);
        return c.getTime();
    }

    public static String getToday(){
        Date d = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(d);
    }

    public static String getStringDay(Date d){
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(d);
    }

    public static String getStringDateTime(Date d){
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return df.format(d);
    }

    public static List<String> getDaysBetwwen(int days){
        List<String> dayss = new ArrayList<>();
        Calendar start = Calendar.getInstance();
        start.setTime(getDateAdd(days));
        Long startTIme = start.getTimeInMillis();
        Calendar end = Calendar.getInstance();
        end.setTime(new Date());
        Long endTime = end.getTimeInMillis();
        Long oneDay = 1000 * 60 * 60 * 24l;
        Long time = startTIme;
        while (time <= endTime) {
            Date d = new Date(time);
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            dayss.add(df.format(d));
            time += oneDay;
        }
        return dayss;
    }

    /*public static void main(String[] args) {
        System.out.println(getDaysBetwwen(7));
    }*/
}
