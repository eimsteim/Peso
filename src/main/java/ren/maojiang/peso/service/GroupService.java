package ren.maojiang.peso.service;

import ren.maojiang.peso.model.ConfigGroup;

import java.util.List;
import java.util.Map;

/**
 * Created by Leo on 17/3/31.
 */
public interface GroupService {

    /**
     * 获取所有的配置组
     * @return
     */
    public List<ConfigGroup> getAllGroup(Map<String,String> map);

    /**
     * 根据配置组编号获取配置组
     * @param groupName
     * @return
     */
    ConfigGroup getGroupByName(String groupName);
}
