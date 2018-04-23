package ren.maojiang.peso.client.model;

/**
 * Created by zhangchi on 2016/10/21.
 */
public class Config {
    /**
     * 主键
     */
    private Long id;
    /**
     * 配置名称
     */
    private String title;

    /**
     * 配置内容
     */
    private String content;
    /**
     * 版本号
     */
    private int ver;
    /**
     * 配置组物理路径
     */
    private String groupName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getVer() {
        return ver;
    }

    public void setVer(int ver) {
        this.ver = ver;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
}
