alter table items add  `time_left` decimal(4,00) NOT NULL default -1 after `mana_left`;
alter table custom_etcitem add  `time` int(4) NOT NULL default '-1'  after `duration`, CHANGE `duration` `duration` int(3) NOT NULL default '0';
alter table custom_armor add  `time` int(4) NOT NULL default '-1'  after `duration`, CHANGE `duration` `duration` int(3) NOT NULL default '0';
alter table custom_weapon add  `time` int(4) NOT NULL default '-1'  after `duration`, CHANGE `duration` `duration` int(3) NOT NULL default '0';