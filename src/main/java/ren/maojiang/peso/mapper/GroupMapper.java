package ren.maojiang.peso.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import ren.maojiang.peso.model.ConfigGroup;

import java.util.List;
import java.util.Map;

/**
 * Created by Leo on 17/3/12.
 */
@Repository
public interface GroupMapper {
    List<ConfigGroup> getAllGroup(@Param("map") Map<String, String> map);

    ConfigGroup getGroupByName(String groupName);
}
