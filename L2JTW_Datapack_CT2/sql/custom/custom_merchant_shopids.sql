-- ---------------------------------------------------
-- Table structure for table `custom_merchant_shopids`
-- ---------------------------------------------------
CREATE TABLE IF NOT EXISTS `custom_merchant_shopids` (
  `shop_id` decimal(9,0) NOT NULL default '0',
  `npc_id` varchar(9) default NULL,
  PRIMARY KEY (`shop_id`)
);