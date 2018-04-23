package ren.maojiang.peso.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import ren.maojiang.peso.common.Pagination;
import ren.maojiang.peso.model.Config;

import java.util.List;
import java.util.Map;

/**
 * Created by Leo on 17/3/12.
 */
@Repository
public interface ConfigMapper {
    List<Config> getConfigList(@Param("page") Pagination<Config> page, @Param("map") Map<String, Object> map);

    void saveConfig(Config config);

    Config getConfig(@Param("map") Map<String,Object> map);

    int countConfig(@Param(value="map") Map<String,Object> params);

    List<Config> getAllConfig(@Param(value="map") Map<String, Object> map);

    void deleteConfig(Long id);
}
