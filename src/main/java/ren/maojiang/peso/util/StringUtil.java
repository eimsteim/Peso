package ren.maojiang.peso.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by admin on 2017/2/22.
 */
public class StringUtil {
    /**
     * 大写转下划线
     * @param param
     * @return
     */
    public static String upperCharToUnderLine(String param) {
        Pattern p = Pattern.compile("[A-Z]");
        if(param==null ||param.equals("")){
            return "";
        }
        StringBuilder builder=new StringBuilder(param);
        Matcher mc=p.matcher(param);
        int i=0;
        while (mc.find()) {
            builder.replace(mc.start()+i, mc.end()+i, "_"+mc.group().toLowerCase());
            i++;
        }

        if('_' == builder.charAt(0)){
            builder.deleteCharAt(0);
        }
        return builder.toString();
    }

    /**
     * 清空所有HTML字符串中的标签之间的空白字符
     * @return
     */
    public static String clearSpaceChar(String str){
        return str.replaceAll(">\\s+([^\\s<]*)\\s+<", ">$1<");
    }
}
