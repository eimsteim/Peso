package ren.maojiang.peso.model;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by zhangchi on 2016/10/21.
 */
public class ConfigGroup implements Serializable{

    /**
     * 主键
     */
    private Long id;
    /**
     * 配置组名称
     */
    private String groupName;
    private Long createUser;
    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public Long getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Long createUser) {
        this.createUser = createUser;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
