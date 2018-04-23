package ren.maojiang.peso.client.listener;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jodd.http.HttpRequest;
import jodd.http.HttpResponse;
import jodd.io.FileUtil;
import jodd.util.MimeTypes;
import jodd.util.StringPool;
import jodd.util.StringUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import ren.maojiang.peso.client.model.Config;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * Created by zhangchi on 2016/10/22.
 */
public class ConfigListener implements ServletContextListener {

    private static Gson gson = new Gson();

    private String PESO_SERVER_HOST;
    private static final String ACTION_GET_CONFIG_LIST = "/config/list";
    private static final String ACTION_GET_ALL_CONFIG = "/config/get/all";
    private static final String ACTION_DOWNLOAD_CONFIG = "/config/download/";

    /**
     * 配置文件全路径
     */
    private String pesoConfigLocation;
    /**
     * 配置文件根目录名
     */
    private String pesoConfigPath;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        System.err.println("maojiang ConfigListener Startup! begin");
        pesoConfigLocation = servletContextEvent.getServletContext().getInitParameter("pesoConfigLocation");
        if (StringUtil.isNotEmpty(pesoConfigLocation)){
            pesoConfigPath = pesoConfigLocation.substring(0, pesoConfigLocation.lastIndexOf(File.separator));
        }

        //读取global.properties
        Properties global = new Properties();
        try {
            global.load(new FileInputStream(new File(pesoConfigLocation)));
        } catch (IOException e) {
            e.printStackTrace();
        }
        //获取配置中心服务器的地址
        PESO_SERVER_HOST = global.getProperty("peso.server.host");

        //扫描peso/pools目录下所有的properties
        File poolsDir = new File(pesoConfigPath + File.separator + "pools");
        File[] pools = poolsDir.listFiles(new PesoFilenameFileter("properties"));
        //遍历，获取每个pool，下载其对应的配置文件
        Properties prop = new Properties();
        try {
            for (File pool : pools) {
                prop.load(new FileInputStream(pool));

                //从对应pool的.properties中获取配置组名称
                String group = prop.getProperty("group");
                String env = prop.getProperty("env");
                //开始获取配置列表
                //TODO status判断
                HttpResponse response = HttpRequest
                        .post(PESO_SERVER_HOST + File.separator + ACTION_GET_ALL_CONFIG)
                        .timeout(5000)
                        .form(
                            "groupName", group,
                            "env", env
                        ).send();

                String result = response
                        .contentType(MimeTypes.MIME_APPLICATION_JSON, StringPool.UTF_8)
                        .bodyText();

                List<Config> configList = null;
                if(StringUtils.isNotEmpty(result)){
                    configList = gson.fromJson(result, new TypeToken<List<Config>>(){}.getType());
                }

                //创建/清空配置组目录
                File poolDist = new File(pesoConfigPath + File.separator + "dist" + File.separator + group);
                if (!poolDist.exists() || !poolDist.isDirectory()) {
                    poolDist.mkdirs();
                } else {
                    FileUtil.cleanDir(poolDist);
                }


                //开始下载配置
                if(CollectionUtils.isNotEmpty(configList)){
                    for (Config config : configList){
                        //开始循环下载配置
                        download(poolDist, group, env, config.getTitle());
                    }
                }

                //清空，为下一次Load做准备
                prop.clear();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("maojiang ConfigListener Startup! end");
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        System.err.println("ConfigListener Destroyed!");
    }

    /**
     * 下载配置文件
     */
    private void download(File poolDist, String group, String env, String title) throws IOException {

        String url = PESO_SERVER_HOST + ACTION_DOWNLOAD_CONFIG;
//                        + group + File.separator
//                        + env + File.separator + title;

//        URL httpurl = new URL(url);
//        HttpURLConnection conn = (HttpURLConnection)httpurl.openConnection();
//        //防止屏蔽程序抓取而返回403错误
//        conn.setRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 5.0; Windows NT; DigExt)");
        //得到输入流
//        InputStream in = conn.getInputStream();

        Map<String,Object> params = new HashMap<>();
        params.put("groupName", group);
        params.put("env", env);
        params.put("title", title);

        HttpResponse response = HttpRequest.post(url)
                                        .form(params)
                                        .send();
        if(response.statusCode() == 200
                && response.bodyBytes() != null) {
            InputStream in = new ByteArrayInputStream(response.bodyBytes());

            //构建输出流
            File targetFile = new File(poolDist + File.separator + title);
            if(!targetFile.exists()) {
                targetFile.createNewFile();
            }

            FileOutputStream out = new FileOutputStream(targetFile);


            byte[] buffer = new byte[1024];
            int len = 0;
            while((len = in.read(buffer)) != -1) {
                out.write(buffer, 0, len);
            }

            if (out != null) out.close();
            if (in != null) in.close();
        } else {
            System.out.println("properties not found in server:" + title);
        }

    }

    class PesoFilenameFileter implements FilenameFilter {

        private String type;

        public PesoFilenameFileter(String type) {
            this.type = type;
        }

        @Override
        public boolean accept(File dir, String name) {

            File file = new File(name);
            String filename = file.getName();

            return filename.indexOf(type)!=-1;
        }
    }
}
