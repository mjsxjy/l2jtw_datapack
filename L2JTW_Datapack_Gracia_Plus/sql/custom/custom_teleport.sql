CREATE TABLE IF NOT EXISTS `custom_teleport` (
  `Description` varchar(75) default NULL,
  `id` decimal(11,0) NOT NULL default '0',
  `loc_x` decimal(9,0) default NULL,
  `loc_y` decimal(9,0) default NULL,
  `loc_z` decimal(9,0) default NULL,
  `price` decimal(6,0) default NULL,
  `fornoble` int(1) NOT NULL default '0',
  `itemId` decimal(11,0) NOT NULL default '57',
  PRIMARY KEY  (`id`)
);