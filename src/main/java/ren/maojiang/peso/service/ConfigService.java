package ren.maojiang.peso.service;


import ren.maojiang.peso.common.Pagination;
import ren.maojiang.peso.model.Config;

import java.util.List;
import java.util.Map;

/**
 * Created by zhangchi on 2016/10/23.
 */
public interface ConfigService {

    /**
     * 查找某个配置组下的所有配置文件
     * @param map
     * @return
     */
    void loadConfigList(Pagination<Config> page, Map<String,Object> map);

    void save(Config config);

    Config getConfig(Map<String,Object> map);

    List<Config> getAllConfig(Map<String,Object> map);

    void delete(Long id);
}
