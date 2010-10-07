DROP TABLE IF EXISTS `npc_elementals`;
CREATE TABLE IF NOT EXISTS `npc_elementals` (
  `npc_id` decimal(11,0) NOT NULL default '0',
  `elemAtkType` tinyint(1) NOT NULL default -1,
  `elemAtkValue` int(3) NOT NULL default 0,
  `fireDefValue` int(3) NOT NULL default 0,
  `waterDefValue` int(3) NOT NULL default 0,
  `earthDefValue` int(3) NOT NULL default 0,
  `windDefValue` int(3) NOT NULL default 0,
  `holyDefValue` int(3) NOT NULL default 0,
  `darkDefValue` int(3) NOT NULL default 0,
  PRIMARY KEY (`npc_id`)
);

INSERT INTO `npc_elementals` VALUES
(22257,1,170,9,29,29,29,29,29),
(22258,1,170,9,29,29,29,29,29),
(22259,1,170,9,29,29,29,29,29),
(22260,1,170,9,29,29,29,29,29),
(22264,1,170,30,50,50,50,50,50),
(22265,1,170,30,50,50,50,50,50),
(22266,1,170,30,50,50,50,50,50),
(22320,5,170,88,88,88,88,68,88),
(22321,5,170,88,88,88,88,68,88),
(22324,5,170,80,80,80,80,60,80),
(22325,5,170,80,80,80,80,60,80),
(22327,5,170,80,80,80,80,60,80),
(22328,5,170,80,80,80,80,60,80),
(22329,5,170,80,80,80,80,60,80),
(22617,0,0,129,129,129,129,129,129),
(22618,0,0,129,129,129,129,129,129),
(22619,0,0,129,129,129,129,129,129),
(22620,0,0,129,129,129,129,129,129),
(22621,0,0,129,129,129,129,129,129),
(22622,0,0,129,129,129,129,129,129),
(22623,0,0,129,129,129,129,129,129),
(22624,0,0,129,129,129,129,129,129),
(22625,0,0,129,129,129,129,129,129),
(22626,0,0,129,129,129,129,129,129),
(22627,0,0,129,129,129,129,129,129),
(22628,0,0,129,129,129,129,129,129),
(22629,0,0,129,129,129,129,129,129),
(22630,0,0,129,129,129,129,129,129),
(22631,0,0,129,129,129,129,129,129),
(22632,0,0,129,129,129,129,129,129),
(22633,0,0,129,129,129,129,129,129),
(22634,0,0,129,129,129,129,129,129),
(22635,0,0,129,129,129,129,129,129),
(22636,0,0,129,129,129,129,129,129),
(22660,1,170,87,67,87,87,87,87),
(22661,1,170,87,67,87,87,87,87),
(22662,1,170,87,67,87,87,87,87),
(22663,1,170,87,67,87,87,87,87),
(22664,1,170,87,67,87,87,87,87),
(22665,1,170,87,67,87,87,87,87),
(22673,1,170,87,67,87,87,87,87),
(22681,1,170,117,97,117,117,117,117),
(22682,1,170,117,97,117,117,117,117),
(22683,1,170,117,97,117,117,117,117),
(22691,5,170,129,129,129,129,109,129),
(22692,5,170,129,129,129,129,109,129),
(22693,5,170,129,129,129,129,109,129),
(22694,5,170,129,129,129,129,109,129),
(22695,5,170,129,129,129,129,109,129),
(22696,5,170,129,129,129,129,109,129),
(22697,5,170,129,129,129,129,109,129),
(22698,5,170,129,129,129,129,109,129),
(22699,5,170,129,129,129,129,109,129),
(22700,5,170,129,129,129,129,109,129),
(22701,5,170,129,129,129,129,109,129),
(22702,5,170,129,129,129,129,109,129),
(22703,3,170,129,129,129,109,129,129),
(22704,3,170,129,129,129,109,129,129),
(22705,3,170,129,129,129,109,129,129),
(22746,3,200,216,216,216,196,216,216),
(22747,3,200,216,216,216,196,216,216),
(22748,3,200,216,216,216,196,216,216),
(22749,3,200,216,216,216,196,216,216),
(22750,3,200,216,216,216,196,216,216),
(22751,3,200,216,216,216,196,216,216),
(22752,3,200,216,216,216,196,216,216),
(22753,3,200,216,216,216,196,216,216),
(22754,3,200,216,216,216,196,216,216),
(22755,3,200,216,216,216,196,216,216),
(22756,3,200,216,216,216,196,216,216),
(22757,3,200,216,216,216,196,216,216),
(22758,3,200,216,216,216,196,216,216),
(22759,3,200,216,216,216,196,216,216),
(22760,3,200,216,216,216,196,216,216),
(22761,3,200,216,216,216,196,216,216),
(22762,3,200,216,216,216,196,216,216),
(22763,3,200,216,216,216,196,216,216),
(22764,3,200,216,216,216,196,216,216),
(22765,3,200,216,216,216,196,216,216),
(22768,3,170,129,129,129,109,129,129),
(22769,3,170,139,139,139,119,139,139),
(22770,3,170,139,139,139,119,139,139),
(22771,3,170,139,139,139,119,139,139),
(22772,3,170,139,139,139,119,139,139),
(22773,3,170,129,129,129,109,129,129),
(22774,3,170,139,139,139,119,139,139),
(22776,0,170,177,157,177,177,177,177),
(22781,0,170,177,157,177,177,177,177),
(22783,0,170,177,157,177,177,177,177),
(22785,0,170,177,157,177,177,177,177),
(22786,0,170,177,157,177,177,177,177),
(22787,0,170,177,157,177,177,177,177),
(22788,0,170,177,157,177,177,177,177),
(22789,0,0,167,167,167,167,167,167),
(22790,0,0,167,167,167,167,167,167),
(22791,0,0,167,167,167,167,167,167),
(22792,0,0,167,167,167,167,167,167),
(22793,0,0,167,167,167,167,167,167),
(22794,0,0,147,147,147,147,147,147),
(22795,0,0,167,167,167,167,167,167),
(22796,0,0,167,167,167,167,167,167),
(22797,0,0,167,167,167,167,167,167),
(22798,0,0,167,167,167,167,167,167),
(22799,0,0,167,167,167,167,167,167),
(22800,0,0,167,167,167,167,167,167);