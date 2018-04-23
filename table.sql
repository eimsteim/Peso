CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `group_name` varchar(50) DEFAULT NULL COMMENT '配置组（按项目分）',
  `env` varchar(50) DEFAULT NULL COMMENT '配置环境（开发、测试、生产）',
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `config_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `group_name` varchar(50) DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
