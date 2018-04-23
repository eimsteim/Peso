package ren.maojiang.peso.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ren.maojiang.peso.common.Pagination;
import ren.maojiang.peso.mapper.ConfigMapper;
import ren.maojiang.peso.model.Config;
import ren.maojiang.peso.service.ConfigService;

import java.util.List;
import java.util.Map;

/**
 * Created by zhangchi on 2016/10/23.
 */
@Service
public class ConfigServiceImpl implements ConfigService {

    @Autowired
    private ConfigMapper configMapper;

    @Override
    public void loadConfigList(Pagination<Config> page, Map<String,Object> params) {

        if (page.getPageSize()>0){
            Integer total = configMapper.countConfig(params);
            if (total==0){
                return;
            }
            page.setTotal(total);
        }
        List<Config> list = configMapper.getConfigList(page,params);
        page.setRows(list);

    }

    @Override
    public void save(Config config) {
        configMapper.saveConfig(config);
    }

    @Override
    public Config getConfig(Map<String,Object> map) {
        return configMapper.getConfig(map);
    }

    public List<Config> getAllConfig(Map<String,Object> map) {
        return configMapper.getAllConfig(map);
    }

    @Override
    public void delete(Long id) {
        configMapper.deleteConfig(id);
    }
}
