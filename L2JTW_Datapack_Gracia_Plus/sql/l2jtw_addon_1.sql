/************ Made in Taiwan ************/

/************ �R���۩w��NPC ************/
-- DELETE FROM `spawnlist` WHERE `id` > 820000 AND `id` < 880000;


/************ �ץ�32007�[����-�����|�� ************/
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (32007);
INSERT INTO `spawnlist` (location,count,npc_templateid,locx,locy,locz,randomx,randomy,heading,respawn_delay,loc_id,periodOfDay) VALUES 
('',1,32007,140967,-123600,-1905,0,0,11829,60,0,0);
UPDATE `npc` SET `rhand` = '7560' WHERE `id` IN (32007);
REPLACE INTO `merchant_shopids` VALUES (3200700,32007);
DELETE FROM `merchant_buylists` WHERE shop_id IN (3200700);
INSERT INTO `merchant_buylists` (`item_id`,`price`,`shop_id`,`order`) VALUES
(7807,-1,3200700,0),
(7808,-1,3200700,1),
(7809,-1,3200700,2),
(6520,-1,3200700,3),
(6523,-1,3200700,4),
(6526,-1,3200700,5),
(8506,-1,3200700,6),
(8509,-1,3200700,7),
(8512,-1,3200700,8),
(8484,-1,3200700,9),
(8485,-1,3200700,10),
(8486,-1,3200700,11),
(6529,-1,3200700,12),
(6530,-1,3200700,13),
(6531,-1,3200700,14),
(6532,-1,3200700,15),
(6533,-1,3200700,16),
(6534,-1,3200700,17),
(7561,-1,3200700,18),
(8193,-1,3200700,19),
(8194,-1,3200700,20),
(8195,-1,3200700,21),
(8196,-1,3200700,22),
(8197,-1,3200700,23),
(8198,-1,3200700,24),
(8199,-1,3200700,25),
(8200,-1,3200700,26),
(8202,-1,3200700,27);


/************ �W�[�Y�������[�ޯ�(���ִ_��/���֪�^/�j�Y/�Ϥ�) ************/
-- UPDATE `armor` SET `skill` = '3263-1;' WHERE `item_id` IN (10621,10625,10629);
-- UPDATE `armor` SET `skill` = '3264-1;' WHERE `item_id` IN (10620,10624,10628,14753,14756,14759,14762);
-- UPDATE `armor` SET `skill` = '3265-1;' WHERE `item_id` IN (10623,10627,10631,14754,14757,14760,14763);
-- UPDATE `armor` SET `skill` = '3266-1;' WHERE `item_id` IN (10622,10626,10630,14755,14758,14761,14764);
-- UPDATE `armor` SET `skill` = '21005-3;' WHERE `item_id` IN (20016);
-- UPDATE `armor` SET `skill` = '21006-1;21007-1;' WHERE `item_id` IN (20018);
-- UPDATE `armor` SET `skill` = '21004-1;' WHERE `item_id` IN (20019);

-- �ץ� §�A������
-- UPDATE `armor` SET `armor_type` = 'light' WHERE `item_id` IN (6408);

/************ �W�[/�ץ�/�R��NPC ************/
UPDATE `npc` SET `type` = 'L2VillageMaster' WHERE `id` IN (32191); -- �ץ��~�R�Y  �v�v��NPC����
UPDATE `npc` SET `type` = 'L2Adventurer' WHERE `id` IN (32074); -- �ץ��j�|�B���|����NPC����
UPDATE `npc` SET `type` = 'L2Npc', `collision_radius` = '9', `collision_height` = '16.5', `rhand` = '0' WHERE `id` IN (35417,35418); -- �ץ��a���u���H
-- UPDATE `spawnlist` SET `npc_templateid` = '35440' WHERE `id` = 33771; -- �ץ�NPC ID:������(�ھڦa�u���H)
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (30880,30881,30882,30883,30884,30885,30886,30887,30888,30889); -- �R�����s�b��NPC
UPDATE `droplist` SET `mobId` = '21070' WHERE `mobId` IN (21071); -- �ʦL�j�Ѩ�

-- �[�J���L�R�޲z��
REPLACE INTO `spawnlist` (location,count,npc_templateid,locx,locy,locz,randomx,randomy,heading,respawn_delay,loc_id,periodOfDay) VALUES 
('', 1, 32478, 17735, 169802, -3495, 0, 0, 19465, 60, 0, 0); -- ��ù������

-- �ץ�NPC��m
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (30134,31605,31675,31679,31677,30767); -- �R�������T��m��NPC
INSERT INTO `spawnlist` (location,count,npc_templateid,locx,locy,locz,randomx,randomy,heading,respawn_delay,loc_id,periodOfDay) VALUES 
('oren09_npc2018_010', 1, 30134, 9689, 15550, -4574, 0, 0, 5892, 60, 0, 0),     -- �Ǵ��K(�·t���F����)
('oren16_npc2218_016', 1, 31605, 85692, 16400, -2803, 0, 0, 38000, 60, 0, 0),   -- �����p(�H����)
('innadril09_npc2324_23', 1, 31092, 114486, 217413, -3631, 0, 0, 0, 60, 0, 0),  -- �]�I���a�U�ӤH(���W����������)
('aden17_npc2317_01', 1, 31675, 111186, -13261, -1702, 0, 0, 13828, 60, 0, 0),  -- ���J�S �� �w��J(��Ҧu�ƶ�����)
('aden17_npc2317_02', 1, 31679, 111532, -17238, -1702, 0, 0, 49586, 60, 0, 0),  -- �״��S�� �� ���(���ĵ�ƶ�����)
('aden17_npc2317_03', 1, 31677, 111532, -13266, -1704, 0, 0, 14508, 60, 0, 0),  -- ��Ҧu�ƶ���
('aden17_npc2317_03', 1, 31677, 111178, -17234, -1702, 0, 0, 46468, 60, 0, 0),  -- ��Ҧu�ƶ���
('schuttgart', 1, 30767, 85792, -142809, -1341, 0, 0, 10508, 60, 0, 0);         -- ���޲z��(�ץ[�S����)

-- �[�J�|����NPC
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (35601,35602,35603,35605,35623,35624,35628,35638,35639,35640,35641,35642); -- �R�������T��m��NPC
INSERT INTO `spawnlist` (location,count,npc_templateid,locx,locy,locz,randomx,randomy,heading,respawn_delay,loc_id,periodOfDay) VALUES 
-- ('', 1, 35644, 116178, -181602, -1365, 0, 0, 0, 60, 0, 0),      -- ����޲z��(�G�H����)
-- ('', 1, 35645, -44159, -112229, -239, 0, 0, 39768, 60, 0, 0),   -- ����޲z��(�b�~�H����)
-- ('', 1, 32321, 147271, 28647, -2268, 0, 0, 53514, 60, 0, 0),    -- �D��򤶰�(�ȤB����)
-- ('', 1, 32071, 84432, -144032, -1538, 0, 0, 8764, 60, 0, 0),    -- �Y�F(�ץ[�S����)
('', 1, 31691, 86123, -145764, -1292, 0, 0, 0, 60, 0, 0),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('', 1, 31691, 86123, -145628, -1295, 0, 0, 0, 60, 0, 0),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('', 1, 31691, 86123, -145492, -1292, 0, 0, 0, 60, 0, 0),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('', 1, 31691, 86123, -145356, -1292, 0, 0, 0, 60, 0, 0),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('', 1, 31691, 86123, -145220, -1292, 0, 0, 0, 60, 0, 0),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('', 1, 31691, 86315, -145764, -1292, 0, 0, 0, 60, 0, 0),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('', 1, 31691, 86315, -145628, -1292, 0, 0, 0, 60, 0, 0),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('', 1, 31691, 86315, -145492, -1295, 0, 0, 0, 60, 0, 0),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('', 1, 31691, 86315, -145356, -1292, 0, 0, 0, 60, 0, 0),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('', 1, 31691, 86315, -145220, -1292, 0, 0, 0, 60, 0, 0),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
-- ('', 1, 32109, 23666, -7144, -1134, 0, 0, 46433, 60, 0, 0),     -- �u�Y�t��
('', 1, 35601, 141152, -124272, -1864, 0, 0, 10000, 60, 0, 0),  -- �u���H(�i�m�u�ھڦa)
('', 1, 35602, 140704, -124020, -1904, 0, 0, 34000, 60, 0, 0),  -- �u���H(�i�m�u�ھڦa)
('', 1, 35602, 140732, -123796, -1904, 0, 0, 2000, 60, 0, 0),   -- �u���H(�i�m�u�ھڦa)
('', 1, 35603, 152924, -126604, -2304, 0, 0, 33000, 60, 0, 0),  -- �J���޲z��(�i�m�u�ھڦa)
-- ('', 1, 35604, 143944, -119196, -2136, 0, 0, 1000, 60, 0, 0),   -- �ǥO(�i�m�u�ھڦa)
('', 1, 35605, 140824, -124844, -1864, 0, 0, 10000, 60, 0, 0),  -- �w��S ����(�i�m�u�ھڦa)
('', 1, 35623, 59884, -94204, -1344, 0, 0, 27000, 60, 0, 0),    -- �����u���H(���~�A���ھڦa)
('', 1, 35624, 59920, -94336, -1344, 0, 0, 60000, 60, 0, 0),    -- �����u���H(���~�A���ھڦa)
-- ('', 1, 35625, 55184, -93040, -1360, 0, 0, 35000, 60, 0, 0),    -- �~���u���H(���~�A���ھڦa)
-- ('', 1, 35626, 55400, -93008, -1360, 0, 0, 30000, 60, 0, 0),    -- �~���u���H(���~�A���ھڦa)
-- ('', 1, 35627, 53508, -93776, -1584, 0, 0, 36000, 60, 0, 0),    -- �ǥO(���~�A���ھڦa)
('', 1, 35628, 60880, -94320, -1344, 0, 0, 27000, 60, 0, 0),    -- ����� �A���޲z��(���~�A���ھڦa)
('', 1, 35638, 56736, -26400, 568, 0, 0, 49000, 60, 0, 0),      -- �ڭ۴� ���s�޲z��
('', 1, 35639, 58128, -32000, 296, 0, 0, 0, 60, 0, 0),          -- �ǥd�w �ǥO
('', 1, 35640, 58024, -25744, 592, 0, 0, 49000, 60, 0, 0),      -- �Z�wù ����
('', 1, 35641, 58080, -29552, 568, 0, 0, 49000, 60, 0, 0),      -- �n��u���H
('', 1, 35641, 58137, -29223, 568, 0, 0, 16500, 60, 0, 0),      -- �n��u���H
('', 1, 35642, 58024, -26456, 592, 0, 0, 49000, 60, 0, 0),      -- �n��u���H
('', 1, 35642, 58074, -26325, 597, 0, 0, 15732, 60, 0, 0),      -- �n��u���H
('', 1, 32778, 102471, -124260, -2774, 0, 0, 47093, 60, 0, 0),  -- �ħL�Ԥh �N�g�Ȥu�|
('', 1, 32777, 102305, -124365, -2759, 0, 0, 63881, 60, 0, 0),  -- �W���M�h �N�g�Ȥu�|
('', 1, 32761, 102537, -124429, -2792, 0, 0, 30357, 60, 0, 0),  -- �Ͱ���
('', 1, 32781, 102393, -124493, -2787, 0, 0, 17538, 60, 0, 0);  -- �N�g��

-- �[�J�a�U�v�޳����J���޲z��
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (32377); -- �R���a�U�v�޳����ƪ��J���޲z��
UPDATE `npc` SET `type` = 'L2Teleporter' WHERE `id` IN (32503); -- �J���޲z�� �_�p�𪺴���
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (32491,32503,32513,32514,32515,32516,32377);
INSERT INTO `spawnlist` (location,count,npc_templateid,locx,locy,locz,randomx,randomy,heading,respawn_delay,loc_id,periodOfDay) VALUES 
('', 1, 32491, -82166, -49176, -10341, 0, 0, 31175, 60, 0, 0),  -- �a�U�v�޳��U��
('', 1, 32503, -70661, -71066, -1419, 0, 0, 49151, 60, 0, 0),   -- �J���޲z�� �_�p�𪺴���
('', 1, 32513, -84640, -45360, -10728, 0, 0, 56156, 60, 0, 0),  -- ��     �J���޲z��
('', 1, 32514, -77408, -50656, -10728, 0, 0, 29664, 60, 0, 0),  -- �𨽯� �J���޲z��
('', 1, 32515, -81904, -53904, -10728, 0, 0, 17044, 60, 0, 0),  -- �Q��   �J���޲z��
('', 1, 32516, -86359, -50593, -10728, 0, 0, 3704, 60, 0, 0),   -- �d�B�� �J���޲z��
('', 1, 32377, -79117, -45433, -10731, 0, 0, 40959, 60, 0, 0);  -- �w��   �J���޲z��

-- �[�J���ʨ�_�p�𪺴���/�U���Ū��a�U�v�޳��~��
REPLACE INTO `teleport` VALUES
('Fantasy Isle -> Underground Coliseum', '12060', '-82271', '-49196', '-10352', '0', '0', '57'),
('Underground Coliseum -> Underground Coliseum LV40', '3249140', '-84451', '-45452', '-10728', '0', '0', '57'),
('Underground Coliseum -> Underground Coliseum LV50', '3249150', '-86154', '-50429', '-10728', '0', '0', '57'),
('Underground Coliseum -> Underground Coliseum LV60', '3249160', '-82009', '-53652', '-10728', '0', '0', '57'),
('Underground Coliseum -> Underground Coliseum LV70', '3249170', '-77586', '-50503', '-10728', '0', '0', '57'),
('Underground Coliseum -> Underground Coliseum LV00', '3249100', '-79309', '-45561', '-10728', '0', '0', '57');


/************ �ץ�BOSS ************/
REPLACE INTO `grandboss_data` VALUES
(29001, -21610, 181594, -5734, 0, 0, 152622, 334, 0),          -- ���Ƥk��
(29006, 17726, 108915, -6480, 0, 0, 413252, 1897, 0),          -- �֤�
(29014, 55024, 17368, -5412, 10126, 0, 413252, 1897, 0),       -- ������
(29019, 181323, 114850, -7618, 32542, 0, 13090000, 39960, 0),  -- �w��紵
(29020, 116067, 17484, 10110, 41740, 0, 3698520, 39960, 0),    -- �ڷ�
(29022, 55312, 219168, -3223, 0, 0, 569941, 199800, 0),        -- ����
(29028, 212852, -114842, -1632, 833, 0, 16660000, 39960, 0),   -- �کԥd��
(29065, -123348, -248881, -15537, 44732, 0, 1532678, 4255, 0), -- �ɺ���
(29099, 153569, 142075, -12732, 60025, 0, 1448567, 3718, 0);   -- �ں���
UPDATE `npc` SET `aggro` = 500 WHERE `id` IN (29020,29022,29065);
UPDATE `npc` SET `aggro` = 800 WHERE `id` IN (29019,29028);
UPDATE `npc` SET `hp` = '13090000', `mp` = '39960' WHERE `id` IN (29019);
UPDATE `npc` SET `hp` = '3698520', `mp` = '39960' WHERE `id` IN (29020);
UPDATE `npc` SET `hp` = '16660000', `mp` = '39960' WHERE `id` IN (29028);
UPDATE `npc` SET `hp` = '1532678', `mp` = '4255', `type` = 'L2GrandBoss', `level` = '87' WHERE `id` IN (29065);
UPDATE `npc` SET `atkspd` = '540', `matkspd` = '253', `walkspd` = '80', `runspd` = '120' WHERE `id` IN (29099);
UPDATE `npc` SET `collision_radius` = '38.00', `collision_height` = '77.00' WHERE `id` IN (29108);
DELETE FROM `npcskills` Where `skillid` IN (5118);
REPLACE INTO `droplist` VALUES
(29099,6578,1,10,2,500000),
(29099,9458,1,1,1,300000),
(29099,9467,1,1,1,300000),
(29099,10170,1,1,1,1000000),
(29099,57,180000,220000,0,1000000);
REPLACE INTO `npcskills` VALUES
(29020,4127,1),
(29020,4128,1),
(29020,4129,1),
(29020,4130,1),
(29020,4131,1),
(29020,4256,1),
(29021,4133,1),
(29022,4216,1),
(29022,4217,1),
(29022,4218,1),
(29022,4219,1),
(29022,4220,1),
(29022,4221,1),
(29022,4222,1),
(29022,4223,1),
(29022,4224,1),
(29022,4227,1),
(29022,4242,1),
(29022,4258,1),
(29028,4679,1),
(29028,4681,1),
(29028,4682,1),
(29028,4683,1),
(29028,4684,1),
(29028,4685,1),
(29028,4688,1),
(29028,4689,1),
(29028,4690,1),
(29099,4298,1),
(29099,4422,5),
(29099,4789,1),
(29100,4305,1),
(25532,733,1),
(25532,734,1),
(25532,4418,5),
(25534,4419,5);


/************ �ץ��ܵY���F ************/
-- REPLACE INTO `grandboss_data` VALUES (29045, 0, 0, 0, 0, 0, 0, 0, 0);
-- REPLACE INTO `npc` VALUES ('18328', '18328', 'Hall Alarm Device', '0', '', '0', 'NPC.grave_keeper_key', '8.00', '21.00', '80', 'male', 'L2Monster', '80', '1264000', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '0', '333', '0', '0', '0', '0', '0', '0', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('18329', '18329', 'Hall Keeper Captain', '0', '', '0', 'Monster.death_lord', '21.00', '40.00', '80', 'male', 'L2Monster', '80', '23582', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '78', '0', '0', '0', '88', '132', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('18330', '18330', 'Hall Keeper Wizard', '0', '', '0', 'Monster.vale_master', '12.00', '40.00', '80', 'male', 'L2Monster', '80', '18203', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '326', '0', '0', '0', '88', '132', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('18331', '18331', 'Hall Keeper Guard', '0', '', '0', 'Monster.death_knight', '12.00', '29.00', '80', 'male', 'L2Monster', '80', '18655', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '142', '0', '0', '0', '88', '132', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('18332', '18332', 'Hall Keeper Patrol', '0', '', '0', 'Monster.headless_knight', '21.00', '31.00', '80', 'male', 'L2Monster', '80', '18434', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '70', '0', '0', '0', '88', '132', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('18333', '18333', 'Hall Keeper Suicidal Soldier', '0', '', '0', 'Monster3.self_blaster', '20.00', '23.00', '80', 'male', 'L2Monster', '80', '18203', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '0', '0', '0', '0', '88', '132', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('18334', '18334', 'Dark Choir Captain', '0', '', '0', 'Monster2.erinyes_cmd', '21.00', '50.00', '85', 'male', 'L2Monster', '80', '24069', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '0', '333', '0', '0', '0', '0', '0', '0', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('18335', '18335', 'Dark Choir Prima Donna', '0', '', '0', 'Monster3.portrait_spirit', '11.00', '30.00', '80', 'male', 'L2Monster', '80', '18655', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '0', '0', '0', '0', '88', '132', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('18336', '18336', 'Dark Choir Lancer', '0', '', '0', 'Monster.death_blader', '15.00', '45.00', '80', 'male', 'L2Monster', '80', '18655', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '1472', '0', '0', '0', '88', '132', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('18337', '18337', 'Dark Choir Archer', '0', '', '0', 'Monster.skeleton_archer_20_bi', '13.00', '33.00', '80', 'male', 'L2Monster', '80', '18655', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '279', '0', '0', '0', '88', '132', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('18338', '18338', 'Dark Choir Witch Doctor', '0', '', '0', 'Monster3.portrait_spirit_winged', '11.00', '30.00', '80', 'male', 'L2Monster', '80', '13991', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '0', '0', '0', '0', '88', '132', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('18339', '18339', 'Dark Choir Player', '0', '', '0', 'Monster.skeleton', '11.00', '25.00', '80', 'male', 'L2Monster', '80', '18203', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '0', '333', '148', '103', '0', '0', '88', '132', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('29045', '29045', 'Frintezza', '0', '', '0', 'Monster3.frintessa', '10.00', '42.00', '90', 'male', 'L2GrandBoss', '0', '23480000', '22197', '830.62', '3.09', '40', '43', '30', '21', '20', '10', '0', '0', '9182', '6214', '7133', '4191', '253', '0', '333', '0', '0', '0', '0', '1', '1', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('29046', '29046', 'Scarlet van Halisha', '0', '', '0', 'Monster3.follower_of_frintessa', '29.00', '90.00', '85', 'male', 'L2GrandBoss', '50', '23480000', '22393', '823.48', '2.65', '60', '57', '73', '76', '70', '80', '0', '0', '10699', '5036', '5212', '4191', '278', '6000', '3819', '8204', '0', '0', '0', '55', '132', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('29047', '29047', 'Scarlet van Halisha', '0', '', '0', 'Monster3.follower_of_frintessa_tran', '29.00', '110.00', '90', 'male', 'L2GrandBoss', '60', '23480000', '22393', '830.62', '3.09', '70', '67', '73', '79', '70', '80', '496960259', '40375148', '23813', '7000', '12680', '6238', '409', '6000', '3819', '8222', '0', '0', '0', '92', '187', '0', '14',1);
-- REPLACE INTO `npc` VALUES ('29048', '29048', 'Evil Spirit', '0', '', '0', 'Monster3.Evilate', '20.00', '56.00', '87', 'male', 'L2Monster', '70', '350000', '9999', '414.12', '3.09', '40', '43', '30', '21', '20', '10', '30', '2', '9000', '2350', '7133', '2045', '253', '6000', '333', '0', '0', '0', '0', '0', '0', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('29049', '29049', 'Evil Spirit', '0', '', '0', 'Monster3.Evilate', '20.00', '56.00', '87', 'male', 'L2Monster', '70', '350000', '9999', '414.12', '3.09', '40', '43', '30', '21', '20', '10', '30', '2', '9000', '2350', '7133', '2045', '253', '6000', '333', '0', '0', '0', '0', '0', '0', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('29050', '29050', 'Breath of Halisha', '0', '', '0', 'Monster3.portrait_spirit', '10.00', '20.00', '85', 'male', 'L2Monster', '40', '350000', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '30', '2', '9000', '2350', '7133', '2045', '253', '6000', '333', '0', '0', '0', '0', '55', '66', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('29051', '29051', 'Breath of Halisha', '0', '', '0', 'Monster3.portrait_spirit_winged', '10.00', '20.00', '85', 'male', 'L2Monster', '40', '350000', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '30', '2', '9000', '2350', '7133', '2045', '253', '6000', '333', '0', '0', '0', '0', '55', '66', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('29052', '29052', '', '0', '', '0', 'Monster3.Organ_Dummy', '1.00', '1.00', '99', 'male', 'L2Npc', '40', '400000', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '0', '0', '9000', '5000', '6000', '6000', '300', '0', '333', '0', '0', '0', '0', '88', '132', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('29053', '29053', '', '0', '', '0', 'Monster3.Follower_Dummy', '1.00', '1.00', '99', 'male', 'L2Npc', '40', '400000', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '0', '0', '9000', '5000', '6000', '6000', '300', '0', '333', '0', '0', '0', '0', '88', '132', '0', '0',1);
-- REPLACE INTO `npc` VALUES ('29061', '29061', 'Teleportation Cubic', '0', '', '0', 'NPC.teleport_npc_frin', '40.00', '80.00', '70', 'male', 'L2Teleporter', '40', '2444', '2444', '0.00', '0.00', '10', '10', '10', '10', '10', '10', '0', '0', '500', '500', '500', '500', '278', '0', '333', '0', '0', '0', '0', '88', '132', '0', '0',1);
-- DELETE FROM `npcskills` Where `skillid` IN (5014,5015,5016,5017,5018,5019);
-- REPLACE INTO `npcskills` VALUES
-- (29050,5010,1),
-- (29050,5013,1),
-- (29051,5009,1),
-- (29051,5013,1);
-- DELETE FROM `zone_vertices` WHERE `id` IN (12011);
-- REPLACE INTO `zone_vertices` (`id`,`order`,`x`,`y`) VALUES
-- (12011,0,172229,-74350),
-- (12011,1,176241,-90230);


/************ ��L�ץ� ************/
-- �ץ��ǰe�줣�P���ж��D�Բ�����/�ȯ�
REPLACE INTO `teleport` VALUES
('Disciples Necropolis -> Anakim',449,184467,-13102,-5500,0,0,57),
('Disciples Necropolis -> Lilith',450,184448,-10120,-5500,0,0,57);

-- �ץ��𫰮ɶ�
-- ALTER TABLE `castle` DROP PRIMARY KEY, ADD PRIMARY KEY (`id`);
-- UPDATE `castle` SET `siegeDate` = '978782400000' WHERE `siegeDate` = '0' AND `id` IN (1,2,5,8,9);
-- UPDATE `castle` SET `siegeDate` = '979459200000' WHERE `siegeDate` = '0' AND `id` IN (3,4,6,7);

-- �ץ��_����f���ǰe����
UPDATE `teleport` SET `price` = '5200' WHERE `id` IN (63);
UPDATE `teleport` SET `price` = '7100' WHERE `id` IN (107);

-- �ץ��y���۪��D������
-- UPDATE `etcitem` SET `item_type` = 'none' WHERE `item_id` IN (8764);

-- �ץ�����
-- UPDATE `etcitem` SET `price` = '1550000' WHERE `item_id` = '729';  -- �Z���j�ƨ��b-A��
-- UPDATE `etcitem` SET `price` = '2250000' WHERE `item_id` = '959';  -- �Z���j�ƨ��b-S��
-- UPDATE `etcitem` SET `price` = '2700000' WHERE `item_id` = '6569'; -- ���֪��Z���j�ƨ��b-A��
-- UPDATE `etcitem` SET `price` = '5000000' WHERE `item_id` = '6577'; -- ���֪��Z���j�ƨ��b-S��

-- �ץ����⭫�ͮɡAHP/MP���� (�P�� wolo ����)
Update `npc`, `raidboss_spawnlist` SET `raidboss_spawnlist`.`heading`=0, `raidboss_spawnlist`.`currentHp`=`npc`.`hp`,`raidboss_spawnlist`.`currentMp`=`npc`.`mp` WHERE `npc`.`type`='L2RaidBoss' AND `npc`.`id`=`raidboss_spawnlist`.`boss_id`;

-- �ץ��Z��
-- UPDATE `weapon` SET `onCrit_skill_chance` = '100' WHERE `item_id` in (4694,4789,4795,4804,4807,5604,5646,6308,8104,8105,8125,8128,8811,9254,9282,9287,9321,9347);
-- UPDATE `weapon` SET `onCrit_skill_chance` = '6' WHERE `item_id` in (4781);
-- UPDATE `weapon` SET `onCrit_skill_chance` = '7' WHERE `item_id` in (4775);
-- UPDATE `weapon` SET `onCrit_skill_chance` = '9' WHERE `item_id` in (4760,4766);
-- UPDATE `weapon` SET `onCrit_skill_chance` = '12' WHERE `item_id` in (4805);
-- UPDATE `weapon` SET `onCrit_skill_chance` = '14' WHERE `item_id` in (4796,4801);
-- UPDATE `weapon` SET `onCrit_skill_chance` = '17' WHERE `item_id` in (4790);
-- UPDATE `weapon` SET `onCrit_skill_chance` = '25' WHERE `item_id` in (4859);
-- UPDATE `weapon` SET `onCrit_skill_chance` = '27' WHERE `item_id` in (4856);
-- UPDATE `weapon` SET `onCrit_skill_chance` = '29' WHERE `item_id` in (4852);
-- UPDATE `weapon` SET `onCrit_skill_chance` = '31' WHERE `item_id` in (4847,4849);
-- UPDATE `weapon` SET `onCrit_skill_chance` = '32' WHERE `item_id` in (4843);
-- UPDATE `weapon` SET `onCrit_skill_chance` = '34' WHERE `item_id` in (4835,4838,4840);
-- UPDATE `weapon` SET `onCast_skill_chance` = '50' WHERE `item_id` in (4865,4877,4889,4898);
-- UPDATE `weapon` SET `skill` = '3260-1;3261-1;3262-1;' WHERE `item_id` in (9140,9141);


/************ �[�J�}����Ҫ��D�� ************/
-- �s�Y��
-- DELETE FROM `etcitem` WHERE `item_id` IN (20497,20498); -- ���˪����� (L2J���~�]�w��etcitem)
-- DELETE FROM `etcitem` WHERE `item_id` IN (15436); -- �U�t�]�ܨ��]�� (L2J���~�]�w��etcitem)
-- REPLACE INTO `armor` VALUES
-- (20497,'Mother\'s Wreath - Event Blessing of Love - 24 hours limited period','','hairall','false','none',120,'wood','none',0,-1,1440,0,0,0,0,0,'false','false','true','false','true','0-0','21086-1;'), -- ���˪�����-���� �R������(����24�p��)
-- (20498,'Mother\'s Wreath Blessing of Love - 3 day limited period','','hairall','false','none',120,'wood','none',0,-1,4320,0,0,0,0,0,'false','false','true','false','true','0-0','21086-1;'); -- ���˪�����-���� �R������(����3��)
-- REPLACE INTO `weapon` VALUES (15436,'Halloween Transformation Stick','7 day limited period','rhand','false',1600,1,1,'steel','none',8,10,'sword',8,0.00000,0,0,0,379,0,6,-1,-1,590,0,'false','false','false','false','false',0,0,0,0,0,0,0,0,0,'0-0;');
-- �ץ�NPC
UPDATE `npc` SET `type` = 'L2Npc' WHERE `id` IN (32628,32629); -- �X�Y���ާL�������אּ�@��NPC
UPDATE `npc` SET `type` = 'L2Teleporter' WHERE `id` IN (32540,32542,32602); -- �`�W���u���H/�w�w���A�ͺؤl/�{�ɶǰe�v�������אּ�ǰe
UPDATE `spawnlist` SET `heading` = '16383' WHERE `npc_templateid` = '32609' AND `heading` = '20771'; -- �ץ����Ÿ�����˸m�����V

-- �s�ǰe
REPLACE INTO `teleport` VALUES
('3254001', '3254001', '-212836', '209824', '4288', '0', '0', '57'),   -- �`�W���u���H
('3260201', '3260201', '-245833', '220174', '-12104', '0', '0', '57'), -- �{�ɶǰe�v
('3260202', '3260202', '-251624', '213420', '-12072', '0', '0', '57'), -- �{�ɶǰe�v
('3260203', '3260203', '-249774', '207316', '-11952', '0', '0', '57'); -- �{�ɶǰe�v

-- NPC�令AI����
Delete From `spawnlist` Where `npc_templateid` in (32628,32629); -- �X�Y���ާL

-- ����ץ�
-- UPDATE `armor` SET `armor_type` = 'heavy' WHERE `item_id` IN (9821,10019,10020); -- �۶H�˳�-���}����/��l�ݥ�/���K�H��
-- UPDATE `armor` SET `armor_type` = 'light' WHERE `item_id` IN (9824,10021,10022); -- �۶H�˳�-���}§�A/�������Ũ�m/��������H��
-- UPDATE `armor` SET `armor_type` = 'magic' WHERE `item_id` IN (9827,10023,10024); -- �۶H�˳�-���}���T/���A�G���~��/���A�G������
-- UPDATE `armor` SET `time` = 0 WHERE `item_id` IN (20098); -- §�A-���� 1�p�ɤ۶H
-- UPDATE `armor` SET `time` = 43200 WHERE `item_id` IN (13544,13545); -- ����l����N-�k�ͮ��}��/����l����N-�k�ͮ��}��
-- UPDATE `armor` SET `time` = 43200 WHERE `item_id` IN (20503,20504); -- ���O��l/�]�T�����M�����N ����30�� (L2J���~�]�w��etcitem)
-- UPDATE `armor` SET `duration` = 360 WHERE `item_id` IN (14753,14754,14755,14756,14757,14758,14759,14760,14761,14762,14763,14764); -- �۶H�˳�

-- �Z���ץ�
-- UPDATE `weapon` SET `bodypart` = 'lrhand', `weaponType` = 'bigblunt' WHERE `item_id` IN (9819,13530,13531,13532,13533,13534,13535,13536,13537,13538);  -- �����X�m/�j�|�B�X�m/�f���X�m/�_���X�m/�ڷ�X�m/�ȤB�X�m/�]�Ǳo�ߺX�m/���F�S�X�m/�|�]�X�m/�ץ[�S�X�m
-- UPDATE `weapon` SET `bodypart` = 'lrhand', `weaponType` = 'bigblunt' WHERE `item_id` IN (13539,13560,13561,13562,13563,13564,13565,13566,13567,13568); -- �j�v�E�q���]��/�j�|�B �u�@����/�f�� �u�@����/�_�� �u�@����/�ڷ� �u�@����/�ȤB �u�@����/�]�Ǳo�� �u�@����/���F�S �u�@����/�|�] �u�@����/�ץ[�S �u�@����
-- UPDATE `weapon` SET `bodypart` = 'lrhand', `weaponType` = 'bigblunt' WHERE `item_id` IN (13809,13981); -- �c���]�k�v���]�k��/�Ǫ���(�s���x�԰��L)
-- UPDATE `weapon` SET `weaponType` = 'none' WHERE `item_id` IN (13525); -- ��Ǧ�Ȥh�L�޵P

-- ��L���~�ץ�
-- Delete From `items` Where (`item_id` > 708 and `item_id` < 725); -- �R���M����P�˦W�٪���L���~
-- UPDATE `etcitem` SET `consume_type` = 'normal' WHERE `item_id` IN (731,732,949,950,953,954,957,958,961,962); -- �Z���j�Ƶ������b/����j�Ƶ������b
-- UPDATE `etcitem` SET `consume_type` = 'normal' WHERE `item_id` IN (10117,10118); -- ���P���ʦL�����²ŦL/���P�� ���²ŦL
-- UPDATE `etcitem` SET `consume_type` = 'normal' WHERE `item_id` IN (10414,10607,13382); -- ����洫��/����ʦL���N-�G��/�����֪�§��-���ʥ�
-- UPDATE `etcitem` SET `consume_type` = 'stackable' WHERE `item_id` IN (13420,13421,20025,20026,20027,20028,20033); -- �I��/�J�|/�ۥѶǰe���b/�l�[�J����-����(�`�W���U)/�l�[�J����-��t����/�l�[�J����-����(�`�W�g�c)/�ۥѶǰe�X
-- UPDATE `etcitem` SET `time` = 1440 WHERE `item_id` IN (20320); -- �ͤ�J�|
-- UPDATE `etcitem` SET `time` = 10080 WHERE `item_id` IN (20339,20340,20345,20346,20351,20352); -- �g��ȥj��/SP�j��/�������j��
-- UPDATE `etcitem` SET `time` = 21600 WHERE `item_id` IN (20190); -- ���H�`�˹��~
-- UPDATE `etcitem` SET `time` = 43200 WHERE `item_id` IN (13027,14728,20199); -- �����֪�§��/����-�q�۴���/�ڤ۪����H�`�J�|

-- �W�[���~�ĪG
-- UPDATE `armor` SET `skill` = '3407-1;' WHERE `item_id` = '9900';                               -- �R�����B�٫�
-- UPDATE `etcitem` SET `skill` = '2309-1;', `handler` = 'ItemSkills' WHERE `item_id` = '9144';   -- �޽�§��
-- UPDATE `etcitem` SET `skill` = '2422-1;', `handler` = 'ItemSkills' WHERE `item_id` = '10254';  -- 1���_�U
-- UPDATE `etcitem` SET `skill` = '2423-2;', `handler` = 'ItemSkills' WHERE `item_id` = '10255';  -- 2���_�U
-- UPDATE `etcitem` SET `skill` = '2424-3;', `handler` = 'ItemSkills' WHERE `item_id` = '10256';  -- 3���_�U
-- UPDATE `etcitem` SET `skill` = '2425-4;', `handler` = 'ItemSkills' WHERE `item_id` = '10257';  -- 4���_�U
-- UPDATE `etcitem` SET `skill` = '2426-5;', `handler` = 'ItemSkills' WHERE `item_id` = '10258';  -- 5���_�U
-- UPDATE `etcitem` SET `skill` = '2427-6;', `handler` = 'ItemSkills' WHERE `item_id` = '10259';  -- 6���_�U
-- UPDATE `etcitem` SET `skill` = '2487-1;', `handler` = 'ItemSkills' WHERE `item_id` = '10520';  -- �^�n����-�ܤ�¦�
-- UPDATE `etcitem` SET `skill` = '2670-1;', `handler` = 'ItemSkills' WHERE `item_id` = '13794';  -- �ܨ���-½�u����ܨ����b
-- UPDATE `etcitem` SET `skill` = '2671-1;', `handler` = 'ItemSkills' WHERE `item_id` = '13795';  -- �ܨ���-½�u����ܨ����b
-- UPDATE `etcitem` SET `skill` = '2631-1;', `handler` = 'ItemSkills' WHERE `item_id` = '13800';  -- �C���ܨ����b
-- UPDATE `etcitem` SET `skill` = '2632-1;', `handler` = 'ItemSkills' WHERE `item_id` = '13801';  -- �p���ܨ����b

-- �R���]�k�ѰӤH
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (30840,31262,31413,31414,31415,31416,31417,31421,31422,31423,31424,31425,31426,31426,31429,31430,31431,31666,31667,31670,31951,31973,31980);
DELETE FROM `merchant_buylists` WHERE `shop_id` IN ( SELECT `shop_id` FROM `merchant_shopids` WHERE `npc_id` IN (30840,31262,31413,31414,31415,31416,31417,31421,31422,31423,31424,31425,31426,31427,31429,31430,31431,31666,31667,31670,31951,31973,31980));
DELETE FROM `merchant_shopids` WHERE `npc_id` IN (30840,31262,31413,31414,31415,31416,31417,31421,31422,31423,31424,31425,31426,31427,31429,31430,31431,31666,31667,31670,31951,31973,31980);

-- �R���m��ӤH
-- DELETE FROM `spawnlist` WHERE `npc_templateid` IN (30990,30993,30994) AND `id` NOT IN (45033);

-- �R���䤤�@����¾�޲z��
-- DELETE FROM `spawnlist` WHERE `npc_templateid` IN (31756);
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (31757);

-- �ץ�/��s����128 ��ԥd-�B�P�����q
-- UPDATE `etcitem` SET `skill` = '2150-1;', `handler` = 'SoulShots', `item_type` = 'shot', `crystal_type` = 'd' WHERE `item_id` = 13037;
-- UPDATE `etcitem` SET `skill` = '2153-1;', `handler` = 'SoulShots', `item_type` = 'shot', `crystal_type` = 'a' WHERE `item_id` = 13045;
-- UPDATE `etcitem` SET `skill` = '2153-1;', `handler` = 'SoulShots', `item_type` = 'shot', `crystal_type` = 'a' WHERE `item_id` = 13055;
-- UPDATE `weapon` SET `skill` = '0-0;' WHERE `item_id` = 13042;
UPDATE `npc` SET `collision_radius` = 28, `collision_height` = 20, `level` = 61, `hp` = 3450, `mp` = 1365, `patk` = 991, `pdef` = 415, `matk` = 504, `mdef` = 388, `runspd` = 187 WHERE `id` = 14916;
UPDATE `npc` SET `collision_radius` = 28, `collision_height` = 20, `level` = 70, `hp` = 4025, `mp` = 1592, `patk` = 1156, `pdef` = 484, `matk` = 588, `mdef` = 452, `runspd` = 187 WHERE `id` = 14917;


/************ CT 2.5 �t�l�ϩR�ץ� ************/
-- ���O�אּ�q��,���A����/��/�k/��Ѩ�
-- UPDATE `items` SET `item_id` = 13687 WHERE `item_id` IN (13688,13689,13690); -- ��/�k/��ѨϪ��M�h���O��q�Τ��O
-- UPDATE `items` SET `item_id` = 13890 WHERE `item_id` IN (13889,13891,13892); -- ��/�k/��ѨϪ��t�F���O��q�Τ��O
-- UPDATE `items` SET `item_id` = 14609 WHERE `item_id` IN (14601,14602,14608,14610); -- ��/�k/��ѨϪ��j�N���O��q�Τ��O
DELETE FROM `merchant_buylists` WHERE `item_id` IN (13688,13689,13690,13889,13891,13892,14601,14602,14608,14610); -- �R����/�k/��ѨϪ����O���c��

-- �s�Y��
-- UPDATE `armor` SET `skill` = '21090-1;' WHERE `item_id` = 20601;         -- �^��U
-- UPDATE `armor` SET `skill` = '21092-1;' WHERE `item_id` = 20613;         -- �վ�
-- UPDATE `armor` SET `skill` = '21093-1;' WHERE `item_id` = 20614;         -- �վ�
-- UPDATE `armor` SET `skill` = '21094-1;' WHERE `item_id` = 20615;         -- �վ�
-- UPDATE `armor` SET `skill` = '21092-1;21111-1;' WHERE `item_id` = 20616; -- �վ�
-- UPDATE `armor` SET `skill` = '21093-1;21112-1;' WHERE `item_id` = 20617; -- �վ�
-- UPDATE `armor` SET `skill` = '21094-1;21113-1;' WHERE `item_id` = 20618; -- �վ�
-- UPDATE `armor` SET `skill` = '21095-1;' WHERE `item_id` = 20626;         -- �^��U
-- UPDATE `armor` SET `skill` = '21096-1;' WHERE `item_id` = 20633;         -- ��ʴU
-- UPDATE `armor` SET `skill` = '21098-1;' WHERE `item_id` = 20667;         -- �k�Z���U
-- UPDATE `armor` SET `skill` = '21099-1;' WHERE `item_id` = 20669;         -- �Ѫ�U
-- UPDATE `armor` SET `skill` = '21100-1;' WHERE `item_id` = 20671;         -- �k���v��
-- UPDATE `armor` SET `skill` = '21101-1;' WHERE `item_id` = 20673;         -- �_�_�ߺ��U
-- UPDATE `armor` SET `skill` = '21103-1;' WHERE `item_id` = 20675;         -- �ιοߺ��U
-- UPDATE `armor` SET `skill` = '21102-1;' WHERE `item_id` = 20677;         -- ���ߺ��U
-- UPDATE `armor` SET `skill` = '21104-1;' WHERE `item_id` = 20679;         -- �u���H�U
-- UPDATE `armor` SET `skill` = '21120-1;' WHERE `item_id` = 20711;         -- �ǧJ�n�ʭ���-����
-- UPDATE `armor` SET `skill` = '21120-1;' WHERE `item_id` = 20723;         -- �����ǧJ�n�ʭ���
-- UPDATE `armor` SET `skill` = '21120-1;21136-1;' WHERE `item_id` = 20724; -- �����ǧJ�n�ʭ���
-- UPDATE `armor` SET `skill` = '21137-1;' WHERE `item_id` = 20743;         -- �{ģ����ǩǤH����
-- UPDATE `armor` SET `skill` = '21138-1;' WHERE `item_id` = 20744;         -- �{ģ�����n�y�s����
-- UPDATE `armor` SET `skill` = '21139-1;' WHERE `item_id` = 20745;         -- �{ģ��������F����
-- UPDATE `armor` SET `skill` = '21140-1;' WHERE `item_id` = 20746;         -- �{ģ�������e������
-- UPDATE `armor` SET `skill` = '21141-1;' WHERE `item_id` = 20747;         -- �{ģ��X235��P����

-- �s���N
-- UPDATE `armor` SET `bodypart` = 'lbracelet', `skill` = '8358-1;3267-1;' WHERE `item_id` = 15351;                           -- �ʦL�Ѱ����N-����
-- UPDATE `armor` SET `bodypart` = 'lbracelet' WHERE `item_id` IN (20658,20659);                                              -- ����ʦL���N-�R�ʩ��B��
-- UPDATE `armor` SET `skill` = '8464-1;3267-1;' WHERE `item_id` = 17004;                                                     -- ����ʦL���N-�G���_�_
-- UPDATE `armor` SET `bodypart` = 'lbracelet', `skill` = '21191-1;23171-1;23173-1;3267-1;' WHERE `item_id` = 20941;          -- ��ĳ���ʦL���N-����ӻ�
-- UPDATE `armor` SET `bodypart` = 'hairall' WHERE `item_id` IN (20942,20944);                                                -- ���W����/���W�ڴU�l

-- �䥦
-- UPDATE `etcitem` SET `skill` = '2869-1;', `handler` = 'ItemSkills' WHERE `item_id` = 14724;                                -- ����-�N�N���l����b
-- UPDATE `etcitem` SET `skill` = '2870-1;', `handler` = 'ItemSkills' WHERE `item_id` = 14725;                                -- ����-�W�����l����b
-- UPDATE `etcitem` SET `skill` = '2880-1;', `handler` = 'ItemSkills' WHERE `item_id` = 14726;                                -- ����-�~�{�N�N���l����b
-- UPDATE `etcitem` SET `skill` = '2881-1;', `handler` = 'ItemSkills' WHERE `item_id` = 14727;                                -- ����-�~�{�W�����l����b
-- UPDATE `etcitem` SET `consume_type` = 'stackable' WHERE `item_id` = 20597;                                                 -- �֤k�����F��
-- UPDATE `etcitem` SET `skill` = '22105-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20707; -- �a��w�l����b
-- UPDATE `etcitem` SET `skill` = '22106-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20708; -- ���������l����b
-- UPDATE `etcitem` SET `skill` = '22107-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20709; -- ���w�}�l����b
-- UPDATE `etcitem` SET `skill` = '22110-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20728; -- �N���ѿO�l���
-- UPDATE `etcitem` SET `skill` = '22111-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20729; -- �w�y�ѿO�l���
-- UPDATE `etcitem` SET `skill` = '22112-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20730; -- ��֤ѿO�l���
-- UPDATE `etcitem` SET `skill` = '22113-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20731; -- ���w�ѿO�l���
-- UPDATE `etcitem` SET `consume_type` = 'stackable' WHERE `item_id` IN (20904,20905,20906,20907);                            -- �������/������
-- UPDATE `etcitem` SET `sellable` = 'true', `dropable` = 'true' WHERE `item_id` IN (20904,20905,20906,20907);                -- �������/������
-- UPDATE `etcitem` SET `destroyable` = 'true', `tradeable` = 'true' WHERE `item_id` IN (20904,20905,20906,20907);            -- �������/������

-- �s�S��Z��
-- UPDATE `weapon` SET `skill` = '8357-1;' WHERE `item_id` = 15310;          -- ����ĸt�C
-- UPDATE `weapon` SET `skill` = '21089-1;' WHERE `item_id` = 20600;         -- �ۻ��
-- UPDATE `weapon` SET `skill` = '21169-1;23154-1;' WHERE `item_id` = 20867; -- ���Q�ܨ��]��


/************ CT 2.6 �������ץ� ************/
-- �s�j���-���q17.18

-- �s�ͩR��-85.86��

-- �s����(�T�Y�s/��ծu�w���y/��ù�w�Q�����y/�Q�G�X�@�y)

-- �s�Y��(�Ѩ�/�B��/�u�\�Y�T/�T��/����/�Ȩ�/���Z/�Y�y/�Q�t/����/�s��U/���y�z���Y/�ʼ@����-�B��/����/�i��)
-- REPLACE INTO `armor` VALUES
-- (17033,'Circlet of Freeze - For Events','30 day limited period','none','false','none',10,'wood','none',0,-1,43200,0,0,0,0,0,'false','false','false','false','false','0-0','8497-1;');

-- �s���~(�ܦ�/�ըش�/�ѩR)

-- �sBOSS���~(����������)

-- �s���˭}�Z��(���ªZ�����ܦ⪩+���ǪZ������O)
-- REPLACE INTO `weapon` VALUES
-- (15676,'15676','','rhand','true',1520,1,1,'fine_steel','s84',396,10,'sword',8,0.00000,0,0,0,379,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,15687,'0-0;'),
-- (15677,'15677','','rhand','true',1520,1,1,'fine_steel','s84',346,5,'dagger',12,-3.00000,0,0,0,433,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
-- (15678,'15678','','rhand','true',1740,1,1,'fine_steel','s84',396,20,'blunt',4,4.00000,0,0,0,379,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
-- (15679,'15679','','lrhand','true',1740,1,1,'fine_steel','s84',482,20,'bigblunt',4,4.00000,0,0,0,325,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
-- (15680,'15680','','lrhand','true',1740,1,1,'fine_steel','s84',482,10,'bigsword',8,0.00000,0,0,0,325,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,15688,'0-0;'),
-- (15681,'15681','','lrhand','true',1550,1,1,'fine_steel','s84',482,5,'dualfist',4,4.00000,0,0,0,325,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
-- (15682,'15682','','lrhand','true',2010,1,1,'fine_steel','s84',396,10,'pole',8,-3.00000,0,0,0,325,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3599-1;'),
-- (15683,'15683','','rhand','true',1080,1,1,'fine_steel','s84',317,20,'blunt',4,4.00000,0,0,0,379,0,244,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
-- (15684,'15684','','lrhand','true',1080,1,1,'fine_steel','s84',386,20,'bigblunt',4,4.00000,0,0,0,325,0,268,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
-- (15685,'15685','','rhand','true',1520,1,1,'fine_steel','s84',317,10,'sword',8,0.00000,0,0,0,379,0,244,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
-- (15686,'15686','','lrhand','true',1520,1,1,'fine_steel','s84',724,5,'bow',12,-3.00000,0,0,0,293,12,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,15689,'0-0;'),
-- (15687,'15687','','rhand','true',1280,1,1,'fine_steel','s84',359,40,'rapier',10,-1.00000,0,0,0,406,0,183,-1,-1,0,0,'true','true','true','true','true',3426,1,0,0,0,0,0,0,15676,'0-0;'),
-- (15688,'15688','','lrhand','true',1800,1,1,'fine_steel','s84',429,15,'ancient',8,2.00000,0,0,0,350,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,15680,'0-0;'),
-- (15689,'15689','','rhand','true',1580,1,1,'fine_steel','s84',444,10,'crossbow',10,-1.00000,0,0,0,303,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,15686,'0-0;');

-- �S�O�����˭}�Z���W�[��ۮĪG
-- UPDATE `weapon` SET `skill` = '8297-1;' WHERE `item_id` = 15676;
-- UPDATE `weapon` SET `skill` = '8297-1;' WHERE `item_id` = 15677;
-- UPDATE `weapon` SET `skill` = '3568-1;' WHERE `item_id` = 15678;
-- UPDATE `weapon` SET `skill` = '3568-1;' WHERE `item_id` = 15679;
-- UPDATE `weapon` SET `skill` = '8297-1;' WHERE `item_id` = 15680;
-- UPDATE `weapon` SET `skill` = '8289-1;' WHERE `item_id` = 15681;
-- UPDATE `weapon` SET `skill` = '3599-1;8297-1;' WHERE `item_id` = 15682;
-- UPDATE `weapon` SET `skill` = '3047-3;' WHERE `item_id` = 15683;
-- UPDATE `weapon` SET `skill` = '3575-2;' WHERE `item_id` = 15684;
-- UPDATE `weapon` SET `skill` = '3047-3;' WHERE `item_id` = 15685;
-- UPDATE `weapon` SET `skill` = '8298-1;' WHERE `item_id` = 15686;
-- UPDATE `weapon` SET `skill` = '8297-1;' WHERE `item_id` = 15687;
-- UPDATE `weapon` SET `skill` = '8297-1;' WHERE `item_id` = 15688;
-- UPDATE `weapon` SET `skill` = '8296-1;' WHERE `item_id` = 15689;

-- �s����(�ܦ�/�ըش�/�ѩR)

-- �s�޵P(�ܦ�/�ըش�/�ѩR)

-- �s���㪺�M�ˮĪG

-- �s�Z��(S84�W��/S84�S��)

/************ Add by pmq *********/
-- �a���D��
-- UPDATE `etcitem` SET `handler` = 'PaganKeys' WHERE `item_id` = '9685';  -- �·t�������_��
-- UPDATE `etcitem` SET `handler` = 'PaganKeys' WHERE `item_id` = '9686';  -- �}�a�������_��
-- UPDATE `etcitem` SET `handler` = 'PaganKeys' WHERE `item_id` = '9687';  -- �大�����_��

-- ����}�a�� �F��������
REPLACE INTO `minions` VALUES (22363, 22364, 4, 4);
REPLACE INTO `minions` VALUES (22370, 22371, 4, 4);

-- �W�[ SteelCitade 1/F 2/F
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (22363,22365,22367,22368,22369,22370,22372);
INSERT INTO `spawnlist` (location,count,npc_templateid,locx,locy,locz,randomx,randomy,heading,respawn_delay,loc_id,periodOfDay) VALUES 
('', 1, 22363, 16290, 282328, -9709, 0, 0, 15719, 120, 0, 0),
('', 1, 22363, 16287, 281847, -9709, 0, 0, 50191, 120, 0, 0),
('', 1, 22368, 18755, 280971, -9710, 0, 0, 381, 120, 0, 0),
('', 1, 22367, 19884, 280967, -9710, 0, 0, 31385, 120, 0, 0),
('', 1, 22365, 18389, 280744, -9710, 0, 0, 434, 120, 0, 0),
('', 1, 22367, 19681, 280509, -9710, 0, 0, 32912, 120, 0, 0),
('', 1, 22365, 17709, 280523, -9710, 0, 0, 1265, 120, 0, 0),
('', 1, 22369, 18277, 280519, -9710, 0, 0, 65380, 120, 0, 0),
('', 1, 22369, 18924, 280523, -9710, 0, 0, 32100, 120, 0, 0),
('', 1, 22367, 19258, 279942, -9710, 0, 0, 65089, 120, 0, 0),
('', 1, 22367, 13470, 282570, -9710, 0, 0, 16162, 120, 0, 0),
('', 1, 22367, 18273, 279953, -9710, 0, 0, 406, 120, 0, 0),
('', 1, 22365, 18362, 279668, -9710, 0, 0, 525, 120, 0, 0),
('', 1, 22369, 18689, 279678, -9710, 0, 0, 448, 120, 0, 0),
('', 1, 22365, 19120, 279672, -9710, 0, 0, 65149, 120, 0, 0),
('', 1, 22369, 18902, 279414, -9710, 0, 0, 89, 120, 0, 0),
('', 1, 22369, 13701, 282933, -9710, 0, 0, 17019, 120, 0, 0),
('', 1, 22368, 19703, 279685, -9710, 0, 0, 31728, 120, 0, 0),
('', 1, 22368, 19799, 279411, -9710, 0, 0, 31886, 120, 0, 0),
('', 1, 22365, 19857, 278725, -9710, 0, 0, 32607, 120, 0, 0),
('', 1, 22368, 19805, 278942, -9710, 0, 0, 34993, 120, 0, 0),
('', 1, 22368, 19493, 278723, -9710, 0, 0, 34230, 120, 0, 0),
('', 1, 22365, 19120, 278733, -9710, 0, 0, 33455, 120, 0, 0),
('', 1, 22369, 18817, 278731, -9710, 0, 0, 32941, 120, 0, 0),
('', 1, 22367, 19753, 278498, -9710, 0, 0, 32246, 120, 0, 0),
('', 1, 22369, 19232, 278732, -9710, 0, 0, 896, 120, 0, 0),
('', 1, 22365, 19244, 278045, -9709, 0, 0, 64735, 120, 0, 0),
('', 1, 22369, 19190, 277515, -9710, 0, 0, 49267, 120, 0, 0),
('', 1, 22365, 18543, 277340, -9710, 0, 0, 32767, 120, 0, 0),
('', 1, 22369, 18757, 277083, -9710, 0, 0, 64442, 120, 0, 0),
('', 1, 22367, 18377, 276792, -9710, 0, 0, 62597, 120, 0, 0),
('', 1, 22368, 19526, 276891, -9709, 0, 0, 0, 120, 0, 0),
('', 1, 22365, 19880, 276892, -9710, 0, 0, 29, 120, 0, 0),
('', 1, 22367, 19518, 276690, -9710, 0, 0, 37501, 120, 0, 0),
('', 1, 22365, 15419, 283358, -9710, 0, 0, 48804, 120, 0, 0),
('', 1, 22367, 15199, 283193, -9710, 0, 0, 48866, 120, 0, 0),
('', 1, 22368, 14958, 282490, -9710, 0, 0, 49264, 120, 0, 0),
('', 1, 22368, 14380, 283653, -9710, 0, 0, 32372, 120, 0, 0),
('', 1, 22365, 14379, 282802, -9710, 0, 0, 49139, 120, 0, 0),
('', 1, 22367, 14170, 282812, -9710, 0, 0, 15109, 120, 0, 0),
('', 1, 22369, 14170, 283242, -9710, 0, 0, 15986, 120, 0, 0),
('', 1, 22368, 13946, 283012, -9710, 0, 0, 15955, 120, 0, 0),
('', 1, 22365, 13932, 282531, -9710, 0, 0, 49238, 120, 0, 0),
('', 1, 22368, 13459, 283155, -9710, 0, 0, 16749, 120, 0, 0),
('', 1, 22365, 13475, 283672, -9710, 0, 0, 16061, 120, 0, 0),
('', 1, 22369, 13248, 283522, -9709, 0, 0, 49310, 120, 0, 0),
('', 1, 22367, 13249, 283068, -9709, 0, 0, 49381, 120, 0, 0),
('', 1, 22369, 13235, 282705, -9710, 0, 0, 49151, 120, 0, 0),
('', 1, 22365, 13000, 282703, -9710, 0, 0, 16726, 120, 0, 0),
('', 1, 22368, 12772, 283174, -9710, 0, 0, 53514, 120, 0, 0),
('', 1, 22367, 13003, 283655, -9710, 0, 0, 46111, 120, 0, 0),
('', 1, 22365, 12734, 283802, -9710, 0, 0, 50338, 120, 0, 0),
('', 1, 22368, 12748, 281470, -9710, 0, 0, 16123, 120, 0, 0),
('', 1, 22367, 13648, 281478, -9710, 0, 0, 32478, 120, 0, 0),
('', 1, 22368, 14285, 281484, -9710, 0, 0, 999, 120, 0, 0),
('', 1, 22369, 14018, 281701, -9710, 0, 0, 30640, 120, 0, 0),
('', 1, 22365, 13469, 281697, -9710, 0, 0, 32998, 120, 0, 0),
('', 1, 22368, 14739, 281691, -9710, 0, 0, 49151, 120, 0, 0),
('', 1, 22367, 14955, 281437, -9710, 0, 0, 49151, 120, 0, 0),
('', 1, 22369, 15190, 281139, -9713, 0, 0, 47583, 120, 0, 0),
('', 1, 22365, 15213, 281654, -9710, 0, 0, 49151, 120, 0, 0),
('', 1, 22365, 15195, 280519, -9710, 0, 0, 15148, 120, 0, 0),
('', 1, 22368, 14831, 280310, -9710, 0, 0, 63609, 120, 0, 0),
('', 1, 22369, 14731, 280993, -9710, 0, 0, 16706, 120, 0, 0),
('', 1, 22365, 13584, 281252, -9710, 0, 0, 34128, 120, 0, 0),
('', 1, 22369, 13822, 281028, -9710, 0, 0, 0, 120, 0, 0),
('', 1, 22369, 13173, 281029, -9710, 0, 0, 32824, 120, 0, 0),
('', 1, 22368, 12750, 281018, -9713, 0, 0, 64923, 120, 0, 0),
('', 1, 22365, 12969, 280740, -9710, 0, 0, 64856, 120, 0, 0),
('', 1, 22367, 13616, 280744, -9710, 0, 0, 65045, 120, 0, 0),
('', 1, 22365, 14322, 280744, -9710, 0, 0, 31587, 120, 0, 0),
('', 1, 22369, 14174, 280528, -9710, 0, 0, 33019, 120, 0, 0),
('', 1, 22368, 13699, 280524, -9710, 0, 0, 62180, 120, 0, 0),
('', 1, 22369, 13905, 280305, -9710, 0, 0, 32614, 120, 0, 0),
('', 1, 22367, 13182, 280316, -9710, 0, 0, 32393, 120, 0, 0),
('', 1, 22368, 12720, 280289, -9710, 0, 0, 34630, 120, 0, 0),
('', 1, 22368, 12963, 279970, -9713, 0, 0, 32854, 120, 0, 0),
('', 1, 22369, 13002, 279682, -9710, 0, 0, 32767, 120, 0, 0),
('', 1, 22365, 14423, 279946, -9710, 0, 0, 65290, 120, 0, 0),
('', 1, 22368, 14089, 279699, -9710, 0, 0, 33316, 120, 0, 0),
('', 1, 22367, 13554, 279691, -9710, 0, 0, 32835, 120, 0, 0),
('', 1, 22369, 13893, 279438, -9710, 0, 0, 32344, 120, 0, 0),
('', 1, 22365, 13375, 279445, -9710, 0, 0, 32677, 120, 0, 0),
('', 1, 22367, 12881, 279449, -9710, 0, 0, 32516, 120, 0, 0),
('', 1, 22368, 13459, 279196, -9710, 0, 0, 360, 120, 0, 0),
('', 1, 22369, 13754, 278971, -9710, 0, 0, 553, 120, 0, 0),
('', 1, 22367, 13310, 278975, -9710, 0, 0, 32658, 120, 0, 0),
('', 1, 22365, 12920, 278977, -9710, 0, 0, 32635, 120, 0, 0),
('', 1, 22369, 13727, 278723, -9709, 0, 0, 65259, 120, 0, 0),
('', 1, 22369, 13164, 278733, -9710, 0, 0, 32426, 120, 0, 0),
('', 1, 22368, 13152, 278517, -9713, 0, 0, 33241, 120, 0, 0),
('', 1, 22367, 13144, 278274, -9709, 0, 0, 65349, 120, 0, 0),
('', 1, 22368, 13647, 278278, -9710, 0, 0, 32914, 120, 0, 0),
('', 1, 22369, 12852, 278056, -9710, 0, 0, 65082, 120, 0, 0),
('', 1, 22368, 12839, 277811, -9710, 0, 0, 63532, 120, 0, 0),
('', 1, 22369, 13862, 278060, -9710, 0, 0, 65031, 120, 0, 0),
('', 1, 22365, 13381, 278064, -9713, 0, 0, 32681, 120, 0, 0),
('', 1, 22367, 13971, 277821, -9710, 0, 0, 31622, 120, 0, 0),
('', 1, 22368, 13381, 277819, -9710, 0, 0, 33388, 120, 0, 0),
('', 1, 22369, 13716, 277594, -9710, 0, 0, 31113, 120, 0, 0),
('', 1, 22367, 14399, 277473, -9710, 0, 0, 32691, 120, 0, 0),
('', 1, 22367, 12896, 277352, -9710, 0, 0, 521, 120, 0, 0),
('', 1, 22365, 13096, 277598, -9710, 0, 0, 64117, 120, 0, 0),
('', 1, 22365, 13535, 277350, -9710, 0, 0, 32853, 120, 0, 0),
('', 1, 22368, 13979, 277111, -9710, 0, 0, 25154, 120, 0, 0),
('', 1, 22365, 13549, 276847, -9710, 0, 0, 49648, 120, 0, 0),
('', 1, 22369, 12969, 276905, -9710, 0, 0, 65173, 120, 0, 0),
('', 1, 22367, 13879, 276872, -9710, 0, 0, 32938, 120, 0, 0),
('', 1, 22365, 14355, 276794, -9710, 0, 0, 32465, 120, 0, 0),
('', 1, 22370, 19751, 277009, -7558, 0, 0, 49582, 120, 0, 0),
('', 1, 22370, 19751, 278028, -7558, 0, 0, 49681, 120, 0, 0),
('', 1, 22370, 19747, 279082, -7558, 0, 0, 49151, 120, 0, 0),
('', 1, 22370, 19752, 280123, -7558, 0, 0, 48646, 120, 0, 0),
('', 1, 22370, 19288, 280127, -7558, 0, 0, 16800, 120, 0, 0),
('', 1, 22370, 19284, 279089, -7558, 0, 0, 15983, 120, 0, 0),
('', 1, 22370, 19285, 278024, -7558, 0, 0, 17441, 120, 0, 0),
('', 1, 22370, 19288, 276979, -7558, 0, 0, 15260, 120, 0, 0),
('', 1, 22370, 18812, 276976, -7558, 0, 0, 49795, 120, 0, 0),
('', 1, 22370, 18812, 278022, -7558, 0, 0, 49391, 120, 0, 0),
('', 1, 22370, 18807, 279088, -7558, 0, 0, 49289, 120, 0, 0),
('', 1, 22370, 18809, 280128, -7558, 0, 0, 48425, 120, 0, 0),
('', 1, 22370, 18343, 280125, -7558, 0, 0, 16584, 120, 0, 0),
('', 1, 22370, 18354, 279084, -7558, 0, 0, 14193, 120, 0, 0),
('', 1, 22370, 18349, 278023, -7558, 0, 0, 16383, 120, 0, 0),
('', 1, 22370, 18346, 276961, -7558, 0, 0, 16383, 120, 0, 0),
('', 1, 22370, 16552, 276721, -7556, 0, 0, 1780, 120, 0, 0),
('', 1, 22370, 16554, 277284, -7556, 0, 0, 65142, 120, 0, 0),
('', 1, 22370, 16556, 277847, -7556, 0, 0, 65170, 120, 0, 0),
('', 1, 22372, 15988, 277852, -7556, 0, 0, 512, 120, 0, 0),
('', 1, 22372, 15990, 277285, -7556, 0, 0, 578, 120, 0, 0),
('', 1, 22372, 15993, 276724, -7556, 0, 0, 64654, 120, 0, 0),
('', 1, 22370, 14843, 277368, -7558, 0, 0, 49580, 120, 0, 0),
('', 1, 22372, 14841, 277060, -7558, 0, 0, 16383, 120, 0, 0),
('', 1, 22372, 14843, 277704, -7558, 0, 0, 16183, 120, 0, 0),
('', 1, 22370, 13222, 276596, -7558, 0, 0, 32841, 120, 0, 0),
('', 1, 22370, 13369, 277449, -7556, 0, 0, 49795, 120, 0, 0),
('', 1, 22370, 13745, 277448, -7556, 0, 0, 49712, 120, 0, 0),
('', 1, 22372, 13747, 277728, -7558, 0, 0, 48585, 120, 0, 0),
('', 1, 22372, 13360, 277720, -7558, 0, 0, 47854, 120, 0, 0),
('', 1, 22370, 13742, 279238, -7556, 0, 0, 15657, 120, 0, 0),
('', 1, 22370, 13367, 279241, -7556, 0, 0, 15131, 120, 0, 0),
('', 1, 22372, 13375, 279471, -7558, 0, 0, 17184, 120, 0, 0),
('', 1, 22372, 13750, 279480, -7558, 0, 0, 15640, 120, 0, 0),
('', 1, 22370, 13371, 280419, -7556, 0, 0, 13536, 120, 0, 0),
('', 1, 22372, 13369, 280658, -7558, 0, 0, 16383, 120, 0, 0),
('', 1, 22370, 13746, 280420, -7556, 0, 0, 16779, 120, 0, 0),
('', 1, 22372, 13742, 280662, -7558, 0, 0, 16383, 120, 0, 0),
('', 1, 32302, 13293, 282023, -7555, 0, 0, 38182, 120, 0, 0);

-- �Ǫ��⮳�Z��
UPDATE `npc` SET`rhand`= 127 where id = 22485;
UPDATE `npc` SET`rhand`= 127 where id = 22486;
UPDATE `npc` SET`rhand`= 72 where id = 22487;
UPDATE `npc` SET`rhand`= 201 where id = 25616;
UPDATE `npc` SET`rhand`= 72 where id = 29130;
UPDATE `npc` SET`rhand`= 201 where id = 29131;
UPDATE `npc` SET`rhand`= 68 where id = 22488;
UPDATE `npc` SET`rhand`= 68 where id = 22489;
UPDATE `npc` SET`rhand`= 93 where id = 22490;
UPDATE `npc` SET`rhand`= 221 where id = 25617;
UPDATE `npc` SET`rhand`= 16 where id = 29133;
UPDATE `npc` SET`rhand`= 159 where id = 29134;
UPDATE `npc` SET`rhand`= 946, `lhand`= 945 where id = 22495;
UPDATE `npc` SET`rhand`= 124 where id = 29138;
UPDATE `npc` SET`rhand`= 148 where id = 22500;
UPDATE `npc` SET`rhand`= 148 where id = 22501;
UPDATE `npc` SET`rhand`= 148 where id = 22502;
UPDATE `npc` SET`rhand`= 8221 where id = 25621;
UPDATE `npc` SET`rhand`= 8221 where id = 29144;
UPDATE `npc` SET`rhand`= 6717 where id = 29145;
UPDATE `npc` SET`rhand`= 6718 where id = 29146;
UPDATE `npc` SET`rhand`= 78 where id = 25622;
UPDATE `npc` SET`rhand`= 1472 where id = 22364;
UPDATE `npc` SET`rhand`= 6722 where id = 22449;
UPDATE `npc` SET`rhand`= 13983 where id = 25648;
UPDATE `npc` SET`rhand`= 78 where id = 22368;

-- �ק�a�����q�Ǫ�
UPDATE `npc` SET `type`='L2Monster', `level`=83, `hp`=3835, `mp`=1777, `exp`=0, `sp`=0, `walkspd`=0, `runspd`=0 where id='18484';  -- �`�����
UPDATE `npc` SET `level`=81, `hp`=338766, `mp`=1708, `exp`=2629657, `sp`=267913 where id='22326';         -- �`�����u�@�� ���Y�ǧJ
UPDATE `npc` SET `level`=81, `hp`=111546, `mp`=1846, `exp`=0, `sp`=0 where id='18466';                    -- �~��ĵ�ö���
UPDATE `npc` SET `level`=86, `hp`=194672, `mp`=1881, `exp`=944308, `sp`=93684 where id='22448';           -- �p�ڹF�� �ϧܭx�����x
UPDATE `npc` SET `level`=86, `hp`=4439, `mp`=1881, `exp`=16123, `sp`=1680 where id='22451';               -- ������U�x
UPDATE `npc` SET `level`=81, `hp`=197755, `mp`=1708, `exp`=449479, `sp`=47956 where id='22341';           -- �͹F�h
UPDATE `npc` SET `level`=81, `hp`=3461, `mp`=1708, `exp`=12425, `sp`=1325 where id='22342';               -- �F�����������
UPDATE `npc` SET `level`=81, `hp`=3461, `mp`=1708, `exp`=9997, `sp`=1066 where id='22343';                -- �F�������B�D��

REPLACE INTO `minions` VALUES (22448, 22451, 2, 2); -- �p�ڹF�� �ϧܭx�����x
REPLACE INTO `minions` VALUES (22449, 22450, 8, 8); -- ���ڤh�d�� ���ݱM�a

-- �R���a��NPC�ରAI�X�{
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (32297,32354,32345,18463,18464,32355,32362,32363,32364,22341,22448,32314);

-- �ܤ��j�a�u���H
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (18467);
INSERT INTO `spawnlist` (location,count,npc_templateid,locx,locy,locz,randomx,randomy,heading,respawn_delay,loc_id,periodOfDay) VALUES 
('', 1, 18467, 21, 234997, -3272, 0, 0, 32767, 300, 0, 0),
('', 1, 18467, 1, 234887, -3272, 0, 0, 32189, 300, 0, 0),
('', 1, 18467, 0, 235109, -3272, 0, 0, 33989, 300, 0, 0);

-- Seed OF Destruction
UPDATE `npc` SET `type`='L2Monster' where id='18696';  --
UPDATE `npc` SET `type`='L2Monster' where id='18776';  --
UPDATE `npc` SET `type`='L2Monster' where id='18777';  --
UPDATE `npc` SET `type`='L2Monster' where id='18778';  --
UPDATE `npc` SET `type`='L2Monster' where id='29167';  --

-- Seed OF Destruction
-- REPLACE INTO `npcaidata` VALUES
-- (22536,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22537,70,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'mage'),
-- (22538,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22539,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22540,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22541,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22542,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22543,70,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'mage'),
-- (22544,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22545,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22546,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22547,90,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'healer'),
-- (22548,40,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,15,'archer'),
-- (22549,40,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,15,'archer'),
-- (22550,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22551,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22552,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22593,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22596,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (22597,25,NULL,NULL,NULL,NULL,NULL,NULL,50,25,20,20,NULL,'SeedOfDestruction',100,NULL,NULL,NULL,'balanced'),
-- (29162,50,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,'Tiat',900,NULL,NULL,NULL,'balanced'),
-- (29163,50,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,'Tiat',900,NULL,NULL,NULL,'balanced'),
-- (29175,50,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,'Tiat',900,NULL,NULL,NULL,'balanced');

-- ��ԥd-�c�]����
-- UPDATE `npc` SET `type`='L2Monster', `hp`=100, `exp`=0, `sp`=0, `walkspd`=0, `runspd`=0 where id='32495';  -- �_�c
-- UPDATE `npc` SET `type`='L2Monster', `hp`=100, `exp`=1521, `sp`=126, `walkspd`=0, `runspd`=0 where id='18622';  -- ���ı�
-- UPDATE `npc` SET `hp`=4814, `exp`=9631, `sp`=819, `aggro`=400 where id='18623';  -- ��몺�}��
-- UPDATE `npc` SET `hp`=4225, `exp`=5655, `sp`=453, `aggro`=400 where id='18624';  -- ���̪����
-- UPDATE `npc` SET `hp`=4344, `exp`=6255, `sp`=522, `aggro`=400 where id='18625';  -- ���̪����
-- UPDATE `npc` SET `hp`=4530, `exp`=6886, `sp`=597, `aggro`=400 where id='18626';  -- ���̪����
-- UPDATE `npc` SET `hp`=4530, `exp`=6886, `sp`=597, `aggro`=400 where id='18627';  -- ���̪����
-- UPDATE `npc` SET `hp`=89279, `exp`=189547, `sp`=16686 where id='18629';  -- �d�i�h
-- UPDATE `npc` SET `hp`=89279, `exp`=189547, `sp`=16686 where id='18630';  -- ���
-- UPDATE `npc` SET `hp`=89279, `exp`=189547, `sp`=16686 where id='18631';  -- �˧J�u
-- UPDATE `npc` SET `hp`=89279, `exp`=194641, `sp`=17856 where id='18632';  -- ��|�ک�
-- UPDATE `npc` SET `hp`=176244, `exp`=953463, `sp`=69240 where id='18633';  -- �p����

REPLACE INTO npcskills VALUES
-- �s���x �B�L
-- Dragon Steed Troop Infantry
(22541,4299,1),
(22541,4412,15),
(22541,5274,9),
(22541,5827,6),
(22541,5832,1),
-- �s���x �B�L
-- Dragon Steed Troop Infantry
(22597,4299,1),
(22597,4412,15),
(22597,5274,9),
(22597,5827,6),
(22597,5832,1),
-- �s���x �B�L
-- Dragon Steed Troop Infantry
(22589,4299,1),
(22589,4412,15),
(22589,5274,9),
(22589,5827,6),
(22589,5832,1),
-- �s���x �B�L
-- Dragon Steed Troop Infantry
(22575,4299,1),
(22575,4412,15),
(22575,5274,9),
(22575,5827,6),
(22575,5832,1),
-- �·t���q
-- Priest of Darkness
(22551,4295,1),
(22551,5828,6),
(22551,5839,1),
-- �s���x �]�k�v
-- Dragon Steed Troop Magician
(22543,5829,6),
(22543,5827,6),
(22543,5312,9),
(22543,4299,1),
(22543,5833,1),
-- �s���x �]�k�v
-- Dragon Steed Troop Magician
(22577,5829,6),
(22577,5827,6),
(22577,5312,9),
(22577,4299,1),
(22577,5833,1),
-- �s���x �]�k�v
-- Dragon Steed Troop Magician
(22584,5829,6),
(22584,5827,6),
(22584,5312,9),
(22584,4299,1),
(22584,5833,1),
-- �s���x �]�k�v
-- Dragon Steed Troop Magician
(22592,5829,6),
(22592,5827,6),
(22592,5312,9),
(22592,4299,1),
(22592,5833,1),
-- �����s�~
-- Mutation Drake
(22552,5274,9),
(22552,4299,1),
-- �s���x �кj�L
-- Dragon Steed Troop Javelin Thrower
(22549,4299,1),
(22549,4412,10),
(22549,4413,10),
(22549,5837,1),
(22549,5838,1),
-- �s���x �кj�L
-- Dragon Steed Troop Javelin Thrower
(22548,4299,1),
(22548,4412,10),
(22548,4413,10),
(22548,5837,1),
(22548,5838,1),
-- �s���x �кj�L
-- Dragon Steed Troop Javelin Thrower
(22581,4299,1),
(22581,4412,10),
(22581,4413,10),
(22581,5837,1),
(22581,5838,1),
-- �s���x �кj�L
-- Dragon Steed Troop Javelin Thrower
(22582,4299,1),
(22582,4412,10),
(22582,4413,10),
(22582,5837,1),
(22582,5838,1),
-- �s���x �x�Ϊ�
-- Dragon Steed Troop Commander
(22538,4299,1),
(22538,5830,1),
(22538,5831,1),
(22538,5827,6),
(22538,4408,10),
(22538,4410,13),
(22538,4413,15),
(22538,4441,5),
(22538,4071,5),
-- �s���x �x�Ϊ�
-- Dragon Steed Troop Commander
(22572,4299,1),
(22572,5830,1),
(22572,5831,1),
(22572,5827,6),
(22572,4408,10),
(22572,4410,13),
(22572,4413,15),
(22572,4441,5),
(22572,4071,5),
-- �s���x �x�Ϊ�
-- Dragon Steed Troop Commander
(22586,4299,1),
(22586,5830,1),
(22586,5831,1),
(22586,5827,6),
(22586,4408,10),
(22586,4410,13),
(22586,4413,15),
(22586,4441,5),
(22586,4071,5),
-- �s���x �x�Ϊ�
-- Dragon Steed Troop Commander
(22594,4299,1),
(22594,5830,1),
(22594,5831,1),
(22594,5827,6),
(22594,4408,10),
(22594,4410,13),
(22594,4413,15),
(22594,4441,5),
(22594,4071,5),
-- �˽ö���
-- Royal Guard Captain
(22536,4299,1),
(22536,4410,13),
(22536,5826,3),
(22536,5274,9),
(22536,5362,9),
-- �˽ö���
-- Royal Guard Captain
(22570,4299,1),
(22570,4410,13),
(22570,5826,3),
(22570,5274,9),
(22570,5362,9),
-- ������ �����S�˽ö�
-- Soldiers of Bravery (Tiats Bodyguards)
(29162,4299,1),
(29162,4410,13),
(29162,5259,12),
(29162,5309,9),
(29162,5826,3),
-- ������ �����S�˽ö�
-- Soldiers of Bravery (Tiats Bodyguards)
(22569,4299,1),
(22569,4410,13),
(22569,5259,12),
(22569,5309,9),
(22569,5826,3),
-- �s���x �j�]�k�v
-- Dragon Steed Troop Grand Magician
(22537,4299,1),
(22537,4412,13),
(22537,5328,9),
(22537,5826,3),
(22537,5829,6),
-- �s���x �j�]�k�v
-- Dragon Steed Troop Grand Magician
(22571,4299,1),
(22571,4412,13),
(22571,5328,9),
(22571,5826,3),
(22571,5829,6),
-- �s���x �v���v
-- Dragon Steed Troop Healer
(22547,4299,1),
(22547,4608,2),
(22547,5835,1),
(22547,5836,1),
-- �s���x �v���v
-- Dragon Steed Troop Healer
(22580,4299,1),
(22580,4608,2),
(22580,5835,1),
(22580,5836,1),
-- �g�Ԥh
-- Warrior of Light
(22546,4299,1),
(22546,4211,12),
(22546,5274,9),
-- �g�Ԥh
-- Warrior of Light
(22579,4299,1),
(22579,4211,12),
(22579,5274,9),
-- ���s���ڤH
-- Wife of the Dragon of Darkness
(22545,4299,1),
(22545,4412,17),
(22545,5827,6),
(22545,5828,6),
(22545,5328,9),
-- �Q�ìV�����C�J�Ԥh
-- Contaminated Morek Warrior
(22703,4410,15),
(22703,4411,15),
(22703,4413,17),
(22703,4444,4),
(22703,5620,9),
-- �Q�ìV���ڦR�Ԥh
-- Contaminated Batur Warrior
(22704,4410,17),
(22704,4411,15),
(22704,4412,15),
(22704,4413,17),
(22704,5620,9),
-- �Q�ìV���ڦR�����x
-- Contaminated Batur Commander
(22705,4410,17),
(22705,4412,15),
(22705,4413,17),
(22705,5620,9),
-- �Ͼ|�d���U���F
-- Turka Followers Ghost
(22706,4408,16),
(22706,4412,15),
(22706,4413,17),
(22706,4414,1),
(22706,5620,9),
-- �������g�H�{
-- Fanatic of Infinity
(22509,5909,1),
(22509,5884,1),
(22509,5886,1),
(22509,5889,1),
(22509,5465,1),
-- �G�Ѫ��ǥO
-- Rotten Messenger
(22510,5909,1),
(22510,5878,1),
(22510,5879,1),
(22510,5894,1),
-- �������g�H��
-- Zealot of Infinity
(22511,5910,1),
(22511,5897,1),
(22511,5904,1),
-- ������ξ�
-- Body Severer
(22512,5909,1),
(22512,5884,1),
(22512,5898,1),
(22512,5895,1),
-- ���馬�ξ�
-- Body Harvester
(22513,5909,1),
(22513,5882,1),
(22513,5883,1),
(22513,5889,1),
-- �F������
-- Soul Exploiter
(22514,5910,1),
(22514,5892,1),
(22514,5905,1),
(22514,5903,1),
-- �F�����
-- Soul Devourer
(22515,5909,1),
(22515,5888,1),
(22515,5899,1),
(22515,5937,1),
-- ��u �Jù�}�w�� �F��}�a��
-- Yehan Klodekus (Soul Destroyer)
(25665,5933,1),
(25665,5936,1),
-- ��u �J�����w�� �·t���޾ɪ�
-- Yehan Klanikus (Guide of Darkness)
(25666,5932,1),
(25666,5935,1),
-- ù�樺�~�H �Q�c�F������
-- Ragna Orc (Spirit Infested)
(22691,4416,32),
(22691,4333,6),	
(22691,4312,1),
-- ù�樺�~�H�Ԥh �Q�c�F������
-- Ragna Orc Warrior (Spirit Infested)
(22692,4416,32),
(22692,4333,6),
(22692,4312,1),
-- ù�樺�~�H�^�� �Q�c�F������
-- Ragna Orc Hero (Spirit Infested)
(22693,4416,32),
(22693,4333,6),
(22693,4312,1),
-- ù�樺�~�H�q�O�x �Q�c�F������
-- Ragna Orc Commander (Spirit Infested)
(22694,4416,32),
(22694,4333,6),
-- ù�樺�~�H�v���v �Q�c�F������
-- Ragna Orc Healer (Spirit Infested)
(22695,4416,32),
(22695,4333,6),
-- ù�樺�~�H�G�N�h �Q�c�F������
-- Ragna Orc Shaman (Spirit Infested)
(22696,4416,32),
(22696,4333,6),
-- ù�樺�~�H�w���� �Q�c�F������
-- Ragna Orc Seer (Spirit Infested)
(22697,4416,32),
(22697,4333,6),
-- ù�樺�~�H�g�� �Q�c�F������
-- Ragna Orc Archer (Spirit Infested)
(22698,4416,32),
(22698,4333,6),
(22698,4313,1),
-- ù�樺�~�H������ �Q�c�F������
-- Ragna Orc Sniper (Spirit Infested)
(22699,4416,32),
(22699,4333,6),
-- �����d���u�@��
(22700,4417,14),
(22700,4333,6),
(22700,4410,13),
(22700,4413,17),
(22700,4444,5),
(22700,5620,2),
-- �����d���]��
-- Varangkas Dre Vanul
(22701,4417,14),
(22701,4333,6),
-- �����d��������
-- Varangkas Destroyer
(22702,4417,14),
(22702,4333,6);

-- Seed of Destruction show movie
-- REPLACE INTO `zone_vertices` VALUES
-- (25253,0,-251280,211765),
-- (25253,1,-250599,211765),
-- (25253,2,-250599,211571),
-- (25253,3,-251280,211571);

-- land zone before enter in SoD
-- REPLACE INTO `zone_vertices` VALUES
-- (25254,0,-249138,250114),
-- (25254,1,-246840,252076),
-- (25254,2,-246730,251982),
-- (25254,3,-248699,249660);

-- �|�赲�ɩǪ���� Update 23-08-2010
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=86802,  `sp`=9470,  `hp`=3461, `mp`=1708 where id='22708';  -- �c�ڪ��I���Ԥh
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=86975,  `sp`=9490,  `hp`=3461, `mp`=1708 where id='22709';  -- �c�ڪ��I���v¡��
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=55431,  `sp`=6053,  `hp`=3461, `mp`=1708 where id='22710';  -- �c�ڪ��I���޾ɪ�
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=76351,  `sp`=8361,  `hp`=3461, `mp`=1708 where id='22711';  -- �c�ڪ��I���}�a��
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=56907,  `sp`=6223,  `hp`=3461, `mp`=1708 where id='22712';  -- �c�ڪ��I���t����
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=71490,  `sp`=7803,  `hp`=3461, `mp`=1708 where id='22713';  -- �c�ڪ��I���G�N�h
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=54103,  `sp`=5901,  `hp`=3461, `mp`=1708 where id='22714';  -- �c�ڪ��I���}�b��
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=86802,  `sp`=9470,  `hp`=3461, `mp`=1708 where id='22715';  -- �c�ڪ��I���h�L
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=86802,  `sp`=9470,  `hp`=3461, `mp`=1708 where id='22716';  -- �c�ڪ��I���h�L
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=94735,  `sp`=10335, `hp`=3461, `mp`=1708 where id='22717';  -- �c�ڪ��I���Ϯ{
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=102165, `sp`=11188, `hp`=3461, `mp`=1708 where id='22718';  -- �c�ڪ��I����U�L

-- �s�����ɩǪ���� Update 23-08-2010
UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=173525, `sp`=19428, `hp`=65802, `mp`=1743 where id='22719';  -- ��L���I���Ԥh
UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=165990, `sp`=18584, `hp`=65802, `mp`=1743 where id='22720';  -- ��L���I���v¡��
UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=91554,  `sp`=10250, `hp`=32946, `mp`=1743 where id='22721';  -- ��L���I���޾ɪ�
UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=165520, `sp`=18532, `hp`=65802, `mp`=1743 where id='22722';  -- ��L���I���}�a��
UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=93237,  `sp`=10439, `hp`=32946, `mp`=1743 where id='22723';  -- ��L���I���t����
UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=166465, `sp`=18638, `hp`=65802, `mp`=1743 where id='22724';  -- ��L���I���G�N�h
UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=162858, `sp`=18234, `hp`=65802, `mp`=1743 where id='22725';  -- ��L���I���}�b��
UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=165520, `sp`=18532, `hp`=65802, `mp`=1743 where id='22726';  -- ��L���I���h�L
UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=165520, `sp`=18532, `hp`=65802, `mp`=1743 where id='22727';  -- ��L���I���h�L
UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=165520, `sp`=18532, `hp`=65802, `mp`=1743 where id='22728';  -- ��L���I���Ϯ{
UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=310252, `sp`=33057, `hp`=65802, `mp`=1743 where id='22729';  -- ��L���I����U�L

-- �𤧵��ɩǪ���� Update 23-08-2010
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=357615, `sp`=38610, `hp`=112020, `mp`=1812 where id='22730';  -- ���F���I���Ԥh
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=337518, `sp`=36440, `hp`=112020, `mp`=1812 where id='22731';  -- ���F���I���v¡��
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=338470, `sp`=36543, `hp`=112020, `mp`=1812 where id='22732';  -- ���F���I���޾ɪ�
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=356663, `sp`=38507, `hp`=112020, `mp`=1812 where id='22733';  -- ���F���I���}�a��
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=166805, `sp`=18009, `hp`=56054,  `mp`=1812 where id='22734';  -- ���F���I���t����
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=338470, `sp`=36543, `hp`=112020, `mp`=1812 where id='22735';  -- ���F���I���G�N�h
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=159361, `sp`=17205, `hp`=56054,  `mp`=1812 where id='22736';  -- ���F���I���}�b��
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=336554, `sp`=36336, `hp`=112020, `mp`=1812 where id='22737';  -- ���F���I���h�L
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=336554, `sp`=36336, `hp`=112020, `mp`=1812 where id='22738';  -- ���F���I���h�L
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=618577, `sp`=63492, `hp`=112020, `mp`=1812 where id='22739';  -- ���F���I���Ϯ{
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=650929, `sp`=66985, `hp`=112020, `mp`=1812 where id='22740';  -- ���F���I����U�L

-- ���ɭ���Ǫ���� Update 23-08-2010
UPDATE `npc` SET `type`='L2RaidBoss', `level`=81, `exp`=3327990,  `sp`=394141,  `hp`=436294, `mp`=18120 where id='25690';  -- �Ȯ��_�`�� �ڹҪ��I�k��  �i�l��
UPDATE `npc` SET `type`='L2RaidBoss', `level`=81, `exp`=3327990,  `sp`=394141,  `hp`=436294, `mp`=18120 where id='25691';  -- �Ȯ��_�`�� �ڹҪ��I�k��  �i�l��
UPDATE `npc` SET `type`='L2RaidBoss', `level`=81, `exp`=3327990,  `sp`=394141,  `hp`=436294, `mp`=18120 where id='25692';  -- �Ȯ��_�`�� �ڹҪ��I�k��  �i�l��
UPDATE `npc` SET `type`='L2RaidBoss', `level`=81, `exp`=3327990,  `sp`=394141,  `hp`=436294, `mp`=18120 where id='25693';  -- �Ȯ��_�`�� �ڹҪ��I�k��  �i�l��
UPDATE `npc` SET `type`='L2RaidBoss', `level`=82, `exp`=37775745, `sp`=1117041, `hp`=436294, `mp`=18120 where id='25694';  -- �Ȯ��_�`��(Lv82) �ڹҪ��I�k��  �i�l��
UPDATE `npc` SET `type`='L2RaidBoss', `level`=84, `exp`=42720365, `sp`=1206690, `hp`=449514, `mp`=19170 where id='25695';  -- �Ȯ��_�`��(Lv84) �ڹҪ��I�k��  �i�l��

-- ���˪��s�Ǫ���� Update 23-08-2010
UPDATE `npc` SET `type`='L2Monster', `level`=71, `exp`=21105, `sp`=2186, `hp`=2856, `mp`=1574 where id='18635';  -- �ڷ�d�ɰǿմ��V�m�L
UPDATE `npc` SET `type`='L2Monster', `level`=71, `exp`=18501, `sp`=1904, `hp`=2856, `mp`=1574 where id='18636';  -- �ڷ�d�ɰǿմ��B�L
UPDATE `npc` SET `type`='L2Monster', `level`=72, `exp`=11090, `sp`=1200, `hp`=2856, `mp`=1574 where id='18637';  -- �񪪪��ܦ�
UPDATE `npc` SET `type`='L2Monster', `level`=72, `exp`=25065, `sp`=2642, `hp`=2974, `mp`=1607 where id='18638';  -- �ڷ�d�ɰǿմ����d�L
UPDATE `npc` SET `type`='L2Monster', `level`=72, `exp`=24846, `sp`=2618, `hp`=2974, `mp`=1607 where id='18639';  -- �ڷ�d�ɰǿմ����y��
UPDATE `npc` SET `type`='L2Monster', `level`=72, `exp`=24583, `sp`=2580, `hp`=2974, `mp`=1607 where id='18640';  -- �ڷ�d�ɰǿմ��G�N�h
UPDATE `npc` SET `type`='L2Monster', `level`=72, `exp`=25424, `sp`=2681, `hp`=2974, `mp`=1607 where id='18641';  -- �ڷ�d�ɰǿմ����q
UPDATE `npc` SET `type`='L2Monster', `level`=72, `exp`=25564, `sp`=2696, `hp`=2974, `mp`=1607 where id='18642';  -- �ڷ�d�ɰǿմ��Ԥh
UPDATE `npc` SET `type`='L2Monster', `level`=72, `exp`=11090, `sp`=1200, `hp`=2856, `mp`=1574 where id='18643';  -- �񪪪��ܦ�
UPDATE `npc` SET `type`='L2Monster', `level`=72, `exp`=33107, `sp`=3490, `hp`=2974, `mp`=1607 where id='18644';  -- �ڷ�d�ɰǿմ��F�C
UPDATE `npc` SET `type`='L2Monster', `level`=73, `exp`=23321, `sp`=2452, `hp`=2974, `mp`=1607 where id='18645';  -- �ڷ�d�ɰǿմ��]�ɤh
UPDATE `npc` SET `type`='L2Monster', `level`=73, `exp`=25564, `sp`=2696, `hp`=2974, `mp`=1607 where id='18646';  -- �ڷ�d�ɰǿմ��U�h
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=23952, `sp`=2522, `hp`=2974, `mp`=1607 where id='18647';  -- �񪪪��ܩԥ�
UPDATE `npc` SET `type`='L2Monster', `level`=73, `exp`=18178, `sp`=1988, `hp`=2974, `mp`=1607 where id='18648';  -- �ڷ�d�ɰǿմ����q��
UPDATE `npc` SET `type`='L2Monster', `level`=73, `exp`=25065, `sp`=2642, `hp`=2974, `mp`=1607 where id='18649';  -- �ڷ�d�ɰǿմ��j�]�ɤh
UPDATE `npc` SET `type`='L2Monster', `level`=73, `exp`=27045, `sp`=2858, `hp`=2974, `mp`=1607 where id='18650';  -- �ڷ�d�ɰǿմ��x�x
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=15760, `sp`=1724, `hp`=2974, `mp`=1607 where id='18651';  -- �񪪪��ܦϪ���
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=32231, `sp`=3394, `hp`=2974, `mp`=1607 where id='18652';  -- �ڷ�d�ɰǿմ��j���q��
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=26151, `sp`=2761, `hp`=2974, `mp`=1607 where id='18653';  -- �ڷ�d��U�˽ö�
UPDATE `npc` SET `type`='L2Monster', `level`=72, `exp`=31469, `sp`=3310, `hp`=2974, `mp`=1607 where id='18654';  -- �ڷ�d�x�Ϊ�
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=16812, `sp`=1840, `hp`=2974, `mp`=1607 where id='18655';  -- �ڷ�d���u�˽ö�
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=24846, `sp`=2618, `hp`=2974, `mp`=1607 where id='18656';  -- �ڷ�d���u�]�ɤh
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=16952, `sp`=1855, `hp`=2974, `mp`=1607 where id='18657';  -- �w���̪��˽çL
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=16339, `sp`=1788, `hp`=2974, `mp`=1607 where id='18658';  -- �w���̪����{
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=32073, `sp`=3370, `hp`=2974, `mp`=1607 where id='18659';  -- �ڷ�d�w����

-- ��t��ԥd(����)�Ǫ���� Update 23-08-2010
UPDATE `npc` SET `type`='L2Monster', `level`=79, `exp`=0, `sp`=0, `hp`=8710, `mp`=1641 where id='25656';  -- �d�ǭ}�� �g�H�{(Lv79)
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=2730278, `sp`=394141, `hp`=423463, `mp`=1708 where id='25653';  -- �d�ǭ}�� ���X��(Lv81) �I���x
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=0, `sp`=0, `hp`=8760, `mp`=1708 where id='25657';  -- �d�ǭ}�� �g�H�{(Lv81)
UPDATE `npc` SET `type`='L2Monster', `level`=83, `exp`=2911026, `sp`=402310, `hp`=431974, `mp`=1777 where id='25654';  -- �d�ǭ}�� ���X��(Lv83) �I���x
UPDATE `npc` SET `type`='L2Monster', `level`=83, `exp`=0, `sp`=0, `hp`=8789, `mp`=1777 where id='25658';  -- �d�ǭ}�� �g�H�{(Lv83)
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=3100451, `sp`=410692, `hp`=440657, `mp`=1846 where id='25655';  -- �d�ǭ}�� ���X��(Lv85) �I���x

-- ��t��ԥd(�n��)�Ǫ���� Update 23-08-2010
UPDATE `npc` SET `type`='L2Monster', `level`=75, `exp`=0, `sp`=0, `hp`=8551, `mp`=1507 where id='25662';  -- �d�ǭ}�� �l�q��(Lv75)
UPDATE `npc` SET `type`='L2Monster', `level`=77, `exp`=2588731, `sp`=332450, `hp`=406426, `mp`=1574 where id='25659';  -- �d�ǭ}�� �e�ɪ�(Lv77) �I���x
UPDATE `npc` SET `type`='L2Monster', `level`=78, `exp`=0, `sp`=0, `hp`=8678, `mp`=1607 where id='25663';  -- �d�ǭ}�� �l�q��(Lv78)
UPDATE `npc` SET `type`='L2Monster', `level`=80, `exp`=2706502, `sp`=353878, `hp`=419270, `mp`=1674 where id='25660';  -- �d�ǭ}�� �e�ɪ�(Lv80) �I���x
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=0, `sp`=0, `hp`=8760, `mp`=1708 where id='25664';  -- �d�ǭ}�� �l�q��(Lv81) 
UPDATE `npc` SET `type`='L2Monster', `level`=83, `exp`=2853103, `sp`=373311, `hp`=431974, `mp`=1777 where id='25661';  -- �d�ǭ}�� �e�ɪ�(Lv83) �I���x

-- �a�U�v�޳��Ǫ���� Update 23-08-2010
UPDATE `npc` SET `type`='L2Monster', `level`=45, `exp`=3834,  `sp`=266,  `hp`=1183, `mp`=610  where id='22443';  -- �_���󪺨Ϫ�(Lv45)
UPDATE `npc` SET `type`='L2Monster', `level`=55, `exp`=5728,  `sp`=462,  `hp`=1673, `mp`=889  where id='22444';  -- �_���󪺨Ϫ�(Lv55)
UPDATE `npc` SET `type`='L2Monster', `level`=65, `exp`=7797,  `sp`=724,  `hp`=2193, `mp`=1188 where id='22445';  -- �_���󪺨Ϫ�(Lv65)
UPDATE `npc` SET `type`='L2Monster', `level`=75, `exp`=9659,  `sp`=1018, `hp`=2676, `mp`=1507 where id='22446';  -- �_���󪺨Ϫ�(Lv75)
UPDATE `npc` SET `type`='L2Monster', `level`=80, `exp`=10183, `sp`=1143, `hp`=3290, `mp`=1674 where id='22447';  -- �_���󪺨Ϫ�(Lv80)

-- �W�[�a�U���e�ҩǪ���� Update 23-08-2010
UPDATE `npc` SET `type`='L2Monster', `level`=72, `exp`=2192267, `sp`=353878, `hp`=192008, `mp`=1410 where id='25572';  -- ���k�̫����w �L�h���}��
UPDATE `npc` SET `type`='L2Monster', `level`=71, `exp`=0, `sp`=0, `hp`=8318, `mp`=1377 where id='25574';  -- �����w��ĵ��
UPDATE `npc` SET `type`='L2Monster', `level`=71, `exp`=0, `sp`=0, `hp`=8318, `mp`=1377 where id='25573';  -- �����w���l�H��
REPLACE INTO `minions` VALUES (25572, 25574, 1, 1);
REPLACE INTO `minions` VALUES (25572, 25573, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=73, `exp`=2234730, `sp`=360602, `hp`=194342, `mp`=1442 where id='25575';  -- �z���̮��K �L�h���}��
UPDATE `npc` SET `type`='L2Monster', `level`=72, `exp`=0, `sp`=0, `hp`=8383, `mp`=1410 where id='25577';  -- ���K��������
UPDATE `npc` SET `type`='L2Monster', `level`=72, `exp`=0, `sp`=0, `hp`=8383, `mp`=1410 where id='25576';  -- ���K���i��
REPLACE INTO `minions` VALUES (25575, 25577, 1, 1);
REPLACE INTO `minions` VALUES (25575, 25576, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=73, `exp`=2234730, `sp`=360602, `hp`=388684, `mp`=1442 where id='25578';  -- �v�J�p �L�h���}��

UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=2280800, `sp`=367102, `hp`=196619, `mp`=1475 where id='25579';  -- ����`�� �L�h���}��
UPDATE `npc` SET `type`='L2Monster', `level`=73, `exp`=0, `sp`=0, `hp`=8444, `mp`=1442 where id='25581';  -- ����`�������
UPDATE `npc` SET `type`='L2Monster', `level`=73, `exp`=0, `sp`=0, `hp`=8444, `mp`=1442 where id='25580';  -- ����`�����u�@�L
REPLACE INTO `minions` VALUES (25579, 25581, 1, 1);
REPLACE INTO `minions` VALUES (25579, 25580, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=75, `exp`=2329613, `sp`=373311, `hp`=198851, `mp`=1507 where id='25582';  -- �[���O�w �L�h���}��
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=0, `sp`=0, `hp`=8500, `mp`=1475 where id='25584';  -- �[���O�w�����H
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=0, `sp`=0, `hp`=8500, `mp`=1475 where id='25583';  -- �[���O�w���k��
REPLACE INTO `minions` VALUES (25582, 25584, 1, 1);
REPLACE INTO `minions` VALUES (25582, 25583, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=76, `exp`=2383518, `sp`=369370, `hp`=201046, `mp`=1540 where id='25585';  -- ���H�} �L�h���}��
UPDATE `npc` SET `type`='L2Monster', `level`=75, `exp`=0, `sp`=0, `hp`=8551, `mp`=1507 where id='25586';  -- ���H�}���f
UPDATE `npc` SET `type`='L2Monster', `level`=75, `exp`=0, `sp`=0, `hp`=8551, `mp`=1507 where id='25587';  -- ���H�}����
REPLACE INTO `minions` VALUES (25585, 25586, 1, 1);
REPLACE INTO `minions` VALUES (25585, 25587, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=77, `exp`=2441393, `sp`=374864, `hp`=406426, `mp`=1574 where id='25588';  -- �L�k������Q�h �L�h���}��

UPDATE `npc` SET `type`='L2Monster', `level`=78, `exp`=2504377, `sp`=380180, `hp`=205362, `mp`=1607 where id='25589';  -- �Q��v���ڨ��F �L�h���}��
UPDATE `npc` SET `type`='L2Monster', `level`=77, `exp`=0, `sp`=0, `hp`=8641, `mp`=1574 where id='25591';  -- �ڨ��F���ͤk
UPDATE `npc` SET `type`='L2Monster', `level`=77, `exp`=0, `sp`=0, `hp`=8641, `mp`=1574 where id='25590';  -- �ڨ��F���ͱq
REPLACE INTO `minions` VALUES (25589, 25591, 1, 1);
REPLACE INTO `minions` VALUES (25589, 25590, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=80, `exp`=2643172, `sp`=390090, `hp`=209635, `mp`=1674 where id='25593';  -- �����̳ͺ��� �L�h���}��
UPDATE `npc` SET `type`='L2Monster', `level`=79, `exp`=0, `sp`=0, `hp`=8710, `mp`=1641 where id='25594';  -- �ͺ��檺�l�H��
UPDATE `npc` SET `type`='L2Monster', `level`=79, `exp`=0, `sp`=0, `hp`=8710, `mp`=1641 where id='25595';  -- �ͺ��檺���U
REPLACE INTO `minions` VALUES (25593, 25594, 1, 1);
REPLACE INTO `minions` VALUES (25593, 25595, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=79, `exp`=2571288, `sp`=385228, `hp`=415001, `mp`=1641 where id='25592';  -- �j�N�x�d�Զ� �L�h���}��

-- �W�[�����a�ʩǪ���� Update 23-08-2010
UPDATE `npc` SET `type`='L2Monster', `level`=75, `exp`=2329613, `sp`=373311, `hp`=198851, `mp`=1507 where id='25546';  -- �I�H���ԥ��w �L�h���o��
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=0, `sp`=0, `hp`=8500, `mp`=1475 where id='25547';  -- �ԥ��w���P��
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=0, `sp`=0, `hp`=8500, `mp`=1475 where id='25548';  -- �ԥ��w���v¡��
REPLACE INTO `minions` VALUES (25546, 25547, 1, 1);
REPLACE INTO `minions` VALUES (25546, 25548, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=75, `exp`=2329613, `sp`=373311, `hp`=198851, `mp`=1507 where id='25549';  -- �B�ۥǮ���� �L�h���o��
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=0, `sp`=0, `hp`=8500, `mp`=1475 where id='25550';  -- ����Ȫ��j�̤l
UPDATE `npc` SET `type`='L2Monster', `level`=74, `exp`=0, `sp`=0, `hp`=8500, `mp`=1475 where id='25551';  -- ����Ȫ��]�L
REPLACE INTO `minions` VALUES (25549, 25550, 1, 1);
REPLACE INTO `minions` VALUES (25549, 25551, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=76, `exp`=2383518, `sp`=369370, `hp`=402092, `mp`=1540 where id='25552';  -- �F���y�H�d���} �L�h���o��

UPDATE `npc` SET `type`='L2Monster', `level`=77, `exp`=2441393, `sp`=374864, `hp`=406426, `mp`=1574 where id='25553';  -- ���ۮ������� �L�h���o��

UPDATE `npc` SET `type`='L2Monster', `level`=78, `exp`=2504377, `sp`=380180, `hp`=205362, `mp`=1607 where id='25554';  -- ���}�����|������ �L�h���o��
UPDATE `npc` SET `type`='L2Monster', `level`=77, `exp`=0, `sp`=0, `hp`=8641, `mp`=1574 where id='25555';  -- ���|�����ڪ��k��
UPDATE `npc` SET `type`='L2Monster', `level`=77, `exp`=0, `sp`=0, `hp`=8641, `mp`=1574 where id='25556';  -- ���|�����ڪ�����
REPLACE INTO `minions` VALUES (25554, 25555, 1, 1);
REPLACE INTO `minions` VALUES (25554, 25556, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=79, `exp`=2571288, `sp`=385228, `hp`=207500, `mp`=1641 where id='25557';  -- �˪L�����̳ͳͿմ� �L�h���o��
UPDATE `npc` SET `type`='L2Monster', `level`=78, `exp`=0, `sp`=0, `hp`=8678, `mp`=1607 where id='25558';  -- �ͳͿմ�������
UPDATE `npc` SET `type`='L2Monster', `level`=78, `exp`=0, `sp`=0, `hp`=8678, `mp`=1607 where id='25559';  -- �ͳͿմ�����
REPLACE INTO `minions` VALUES (25557, 25558, 1, 1);
REPLACE INTO `minions` VALUES (25557, 25559, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=79, `exp`=2571288, `sp`=385228, `hp`=207500, `mp`=1641 where id='25560';  -- �ɨ��C�h�����d�w �L�h���o��
UPDATE `npc` SET `type`='L2Monster', `level`=78, `exp`=0, `sp`=0, `hp`=8678, `mp`=1607 where id='25561';  -- �����d�w����
UPDATE `npc` SET `type`='L2Monster', `level`=78, `exp`=0, `sp`=0, `hp`=8678, `mp`=1607 where id='25562';  -- �����d�w�����ߥ�
REPLACE INTO `minions` VALUES (25560, 25561, 1, 1);
REPLACE INTO `minions` VALUES (25560, 25562, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=2730278, `sp`=394141, `hp`=211731, `mp`=1708 where id='25563';  -- �������`�����C �L�h���o��
UPDATE `npc` SET `type`='L2Monster', `level`=80, `exp`=0, `sp`=0, `hp`=8738, `mp`=1674 where id='25564';  -- �`�����C���l�H��
UPDATE `npc` SET `type`='L2Monster', `level`=80, `exp`=0, `sp`=0, `hp`=8738, `mp`=1674 where id='25565';  -- �`�����C�����U
REPLACE INTO `minions` VALUES (25563, 25564, 1, 1);
REPLACE INTO `minions` VALUES (25563, 25565, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=2819564, `sp`=398177, `hp`=213848, `mp`=1743 where id='25566';  -- �ʳ����n�e �L�h���o��
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=0, `sp`=0, `hp`=8760, `mp`=1708 where id='25567';  -- �n�e���ܥ�
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=0, `sp`=0, `hp`=8760, `mp`=1708 where id='25568';  -- �n�e���Ѥ�
REPLACE INTO `minions` VALUES (25566, 25567, 1, 1);
REPLACE INTO `minions` VALUES (25566, 25568, 1, 1);

UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=2819564, `sp`=398177, `hp`=213848, `mp`=1743 where id='25569';  -- �}�a�̥[�� �L�h���o��
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=0, `sp`=0, `hp`=8760, `mp`=1708 where id='25570';  -- �[�������d�L
UPDATE `npc` SET `type`='L2Monster', `level`=81, `exp`=0, `sp`=0, `hp`=8760, `mp`=1708 where id='25571';  -- �[���������L
REPLACE INTO `minions` VALUES (25569, 25570, 1, 1);
REPLACE INTO `minions` VALUES (25569, 25571, 1, 1);

-- �v����V��
UPDATE `npc` SET `type`='L2Monster', `level`=83, `exp`=8453,  `sp`=912,   `hp`=3835, `mp`=1777 where id='22780';  -- �ɺ��[�T�h�L(�}��)
UPDATE `npc` SET `type`='L2Monster', `level`=83, `exp`=8453,  `sp`=912,   `hp`=3835, `mp`=1777 where id='22782';  -- �ɺ��[�T�h�L(�Ԥh)
UPDATE `npc` SET `type`='L2Monster', `level`=83, `exp`=8453,  `sp`=912,   `hp`=3835, `mp`=1777 where id='22784';  -- �ɺ��[�T�h�L(�k�v)
UPDATE `npc` SET `type`='L2Monster', `level`=83, `exp`=17547, `sp`=1759,  `hp`=3835, `mp`=1777 where id='18908';  -- �ɺ��[�T�Ʋz��
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=20751, `sp`=2063,  `hp`=4039, `mp`=1812 where id='22786';  -- �ɺ��[�T�Q�Ҫ�(�}��)
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=20751, `sp`=2063,  `hp`=4039, `mp`=1812 where id='22787';  -- �ɺ��[�T�Q�Ҫ�(�Ԥh)
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=20751, `sp`=2063,  `hp`=4039, `mp`=1812 where id='22788';  -- �ɺ��[�T�Q�Ҫ�(�k�v)
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=4807,  `sp`=512,   `hp`=4039, `mp`=1812 where id='22781';  -- �ɺ��[�T���m�L(�}��)
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=8532,  `sp`=910,   `hp`=4039, `mp`=1812 where id='22783';  -- �ɺ��[�T���m�L(�Ԥh)
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=11192, `sp`=1194,  `hp`=4039, `mp`=1812 where id='22785';  -- �ɺ��[�T���m�L(�k�v)
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=25111, `sp`=2528,  `hp`=4039, `mp`=1812 where id='22778';  -- �ɺ��[�T�V�m�Щx(�}��)
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=25111, `sp`=2528,  `hp`=4039, `mp`=1812 where id='22775';  -- �ɺ��[�T�V�m�Щx(�k�v)
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=25111, `sp`=2528,  `hp`=4039, `mp`=1812 where id='22777';  -- �ɺ��[�T�V�m�Щx(�Ԥh)
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=37863, `sp`=3820,  `hp`=4039, `mp`=1812 where id='22776';  -- �ɺ��[�T�V�m�Щx��
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=24663, `sp`= 2481, `hp`=4039, `mp`=1812 where id='22779';  -- �ɺ��[�T�@�þԤh
-- �h�i���
UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=19616, `sp`=2145, `hp`=3643, `mp`=1743 where id='18862';  -- �Z��h�i�H�u�@�� �ը��Ǵ����H���
UPDATE `npc` SET `type`='L2Monster', `level`=82, `exp`=14826, `sp`=1621, `hp`=3643, `mp`=1743 where id='22768';  -- �Z��h�i�H���u
UPDATE `npc` SET `type`='L2Monster', `level`=83, `exp`=21133, `sp`=2282, `hp`=3835, `mp`=1777 where id='22772';  -- �Z��h�i�H�}�b��
UPDATE `npc` SET `type`='L2Monster', `level`=83, `exp`=19888, `sp`=2147, `hp`=3835, `mp`=1777 where id='22769';  -- �Z��h�i�H�Ԥh
UPDATE `npc` SET `type`='L2Monster', `level`=83, `exp`=20911, `sp`=2258, `hp`=3835, `mp`=1777 where id='22773';  -- �Z��h�i�H�]�k�v
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=34362, `sp`=3499, `hp`=4039, `mp`=1812 where id='22770';  -- �Z��h�i�H�i�h
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=38824, `sp`=3950, `hp`=4039, `mp`=1812 where id='22774';  -- �Z��h�i�H�l��h
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=35295, `sp`=3599, `hp`=4039, `mp`=1812 where id='22771';  -- �Z��h�i�H�g�Ԥh
UPDATE `npc` SET `type`='L2Monster', `level`=84, `exp`=0,     `sp`=0,    `hp`=4039, `mp`=1812 where id='18863';  -- ���q�� �ը��Ǵ� �Z��h�i�H
-- �_�J���� -- �f������
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=579450,  `sp`=58220,  `hp`=55817,  `mp`=1846 where id='22762';  -- �d��گ�
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=579303,  `sp`=58205,  `hp`=55817,  `mp`=1846 where id='22760';  -- �d����
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=579303,  `sp`=58205,  `hp`=55817,  `mp`=1846 where id='22761';  -- �_���گ�
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=1209443, `sp`=121549, `hp`=111546, `mp`=1846 where id='22765';  -- ��U�d��گ� �_�J����
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=1209443, `sp`=121549, `hp`=111546, `mp`=1846 where id='22763';  -- ��U�d���� �_�J����
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=1206702, `sp`=121260, `hp`=111546, `mp`=1846 where id='22764';  -- ��U�_���گ� �_�J����
-- �񴵶��� -- �f������
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=585939,  `sp`=58904,  `hp`=55817,  `mp`=1846 where id='22749';  -- �S�p��
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=579303,  `sp`=58205,  `hp`=55817,  `mp`=1846 where id='22746';  -- �ڮ�s�S
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=579303,  `sp`=58205,  `hp`=55817,  `mp`=1846 where id='22747';  -- ���ԩ_�w
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=579450,  `sp`=58220,  `hp`=55817,  `mp`=1846 where id='22748';  -- �欥�짢
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=1209443, `sp`=121549, `hp`=111546, `mp`=1846 where id='22750';  -- ��U�ڮ�s�S �񴵶���
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=1209443, `sp`=121549, `hp`=111546, `mp`=1846 where id='22751';  -- ��U���Ի��w �񴵶���
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=1206702, `sp`=121260, `hp`=111546, `mp`=1846 where id='22752';  -- ��U�欥�짢 �񴵶���
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=1209443, `sp`=121549, `hp`=111546, `mp`=1846 where id='22753';  -- ��U�S�p�� �񴵶���
-- �p������ -- �f������
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=579303,  `sp`=58205,  `hp`=55817,  `mp`=1846 where id='22755';  -- �J�ԩ_�w
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=579450,  `sp`=58220,  `hp`=55817,  `mp`=1846 where id='22756';  -- ��}��
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=579303,  `sp`=58205,  `hp`=55817,  `mp`=1846 where id='22754';  -- ���S���w
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=1206702, `sp`=121260, `hp`=111546, `mp`=1846 where id='22758';  -- ��U�J�ԩ_�w �p������
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=1209443, `sp`=121549, `hp`=111546, `mp`=1846 where id='22759';  -- ��U��}�� �p������
UPDATE `npc` SET `type`='L2Monster', `level`=85, `exp`=1209443, `sp`=121549, `hp`=111546, `mp`=1846 where id='22757';  -- ��U���S���w �p������
-- �f������ 85�Ŭ��y����
UPDATE `npc` SET `type`='L2RaidBoss', `level`=85, `exp`=3233771, `sp`=403115, `hp`=631293, `mp`=18468 where id='25697';  -- �g�ۤ� �p������
UPDATE `npc` SET `type`='L2RaidBoss', `level`=85, `exp`=3078748, `sp`=399008, `hp`=763865, `mp`=18468 where id='25696';  -- ��J�ԥ� �񴵶���  �i�l��
UPDATE `npc` SET `type`='L2RaidBoss', `level`=85, `exp`=3233771, `sp`=403115, `hp`=631293, `mp`=18468 where id='25698';  -- �h���� �_�J����  �i�l��
-- ���
-- UPDATE `npc` SET `type`='L2Block' where id='18672';  -- ���
-- UPDATE `npc` SET `type`='L2Npc' where id='18676';    -- 
-- REPLACE INTO `etcitem` VALUES (13787,'Bond','','false','potion',180,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','ItemSkills','5849-1;');
-- REPLACE INTO `etcitem` VALUES (13788,'Land Mine','','false','potion',180,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','ItemSkills','5851-1;');

-- new npc for ��Ī
DELETE FROM npcskills             WHERE  npcid IN (12774,12775,12776,12777,12778,12779,13016,13017);
-- DELETE FROM npcaidata             WHERE npc_id IN (12774,12775,12776,12777,12778,12779,13016,13017);
UPDATE npc SET `type`='L2ChronoMonster' WHERE id IN (12774,12775,12776,12777,12778,12779,13016,13017);

UPDATE npc SET level=1,hp=3000,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=12774;  -- ����������Ī
UPDATE npc SET level=1,hp=300 ,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=12775;  -- �u�}����Ī
UPDATE npc SET level=1,hp=300 ,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=12776;  -- ���}����Ī
UPDATE npc SET level=1,hp=300 ,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=12777;  -- ���������j��Ī
UPDATE npc SET level=1,hp=3000,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=12778;  -- �u�}���j��Ī
UPDATE npc SET level=1,hp=3000,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=12779;  -- ���}���j��Ī
UPDATE npc SET level=1,hp=3000,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=13016;  -- �u�}����Ī��
UPDATE npc SET level=1,hp=3000,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=13017;  -- �u�}���j��Ī��

-- new npc for ���
-- UPDATE etcitem SET handler='ItemSkills',skill='9029-1;' WHERE item_id=15366;
-- UPDATE etcitem SET handler='ItemSkills',skill='9030-1;' WHERE item_id=15367;
-- UPDATE etcitem SET handler='ItemSkills',skill='9031-1;' WHERE item_id=15368;
-- UPDATE etcitem SET handler='ItemSkills',skill='9032-1;' WHERE item_id=15369;

-- UPDATE etcitem SET consume_type='stackable' WHERE item_id IN (15366,15367,15368,15369);
-- UPDATE etcitem SET sellable='true',tradeable='true',depositable='true' WHERE item_id IN (15366,15367);

-- NPC
DELETE FROM npcskills             WHERE  npcid IN (13271,13272,13273,13274,13275,13276,13277,13278);
-- DELETE FROM npcAIData             WHERE npc_id IN (13271,13272,13273,13274,13275,13276,13277,13278);
UPDATE npc SET `type`='L2ChronoMonster' WHERE id IN (13271,13272,13273,13274,13275,13276,13277,13278);

UPDATE npc SET level=1,hp=3000,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=13271; -- �����������
UPDATE npc SET level=1,hp=300 ,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=13272; -- ���}�����
UPDATE npc SET level=1,hp=300 ,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=13273; -- �u�}�����
UPDATE npc SET level=1,hp=300 ,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=13274; -- �u�}����ʤ�
UPDATE npc SET level=1,hp=3000,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=13275; -- ���������������
UPDATE npc SET level=1,hp=3000,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=13276; -- ���}���������
UPDATE npc SET level=1,hp=3000,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=13277; -- �u�}���������
UPDATE npc SET level=1,hp=3000,mp=0,hpreg=0,mpreg=0,str=10,con=10,dex=10,`int`=10,wit=10,men=10,patk=0,pdef=15,matk=0,mdef=32,walkspd=1,runspd=1 WHERE id=13278; -- �u�}��������ʤ�

-- �Z��
-- UPDATE weapon SET skill='0-0;' WHERE item_id=5817; -- �J�|�է��� �ѳ������־� (3599-1;)
-- UPDATE weapon SET crystallizable='false' WHERE item_id=8350; -- �J�|�պ��ԥd�� ������־�

-- ����196 �Z���ޯ�
-- REPLACE INTO `etcitem` VALUES (13808,'Elmoreden Holy Water','','false','none',0,'stackable','paper','none',-1,-1,0,0,'false','false','false','false','false','ItemSkills','2633-1;'); -- �㺸���ȤB���t��
-- REPLACE INTO `weapon` VALUES (13809,'Court Magician\'s Magic Staff','','rhand','false',0,0,0,'fine_steel','none',0,0,'sword',0,0.00000,0,0,0,0,0,0,-1,-1,0,0,'false','false','false','false','false',0,0,0,0,0,0,0,0,0,'2634-1;'); -- �c���]�k�v���]�k��

-- �պ��g�x�魺��Ǫ���� 
UPDATE `npc` SET `type`='L2RaidBoss' where id='25528';  -- �̲׸սm�x ��Ȩ��ڴ�
UPDATE `npc` SET `type`='L2Monster', `exp`=0,  `sp`=0 where id='25529';  -- �սm�x�����U �x�骺ĵ�ö�
UPDATE `npc` SET `type`='L2Monster', `exp`=0,  `sp`=0 where id='25530';  -- �սm�x�����U �x�骺ĵ�ö�
REPLACE INTO `minions` VALUES (25528, 25529, 3, 3);
REPLACE INTO `minions` VALUES (25528, 25530, 1, 1);

-- UPDATE etcitem SET handler='PaganKeys', skill='2343-1;' WHERE item_id=9703; -- ��ѨϤ������_��
-- UPDATE etcitem SET handler='PaganKeys', skill='2344-1;' WHERE item_id=9704; -- �����������_��
-- UPDATE etcitem SET handler='PaganKeys', skill='2345-1;' WHERE item_id=9705; -- �[������_��
-- UPDATE etcitem SET handler='PaganKeys', skill='2346-1;' WHERE item_id=9706; -- ����ʩԤ������_��
-- UPDATE etcitem SET handler='PaganKeys', skill='2347-1;' WHERE item_id=9707; -- �_��-�ѤѤ��W
-- UPDATE etcitem SET handler='PaganKeys', skill='2348-1;' WHERE item_id=9708; -- �_��-��Ի�����
-- UPDATE etcitem SET handler='PaganKeys', skill='2349-1;' WHERE item_id=9709; -- �Ⱥ�����|�������_��
-- UPDATE etcitem SET handler='PaganKeys', skill='2350-1;' WHERE item_id=9710; -- �_��-�p�ڪi���w
-- UPDATE etcitem SET handler='PaganKeys', skill='2351-1;' WHERE item_id=9711; -- �w���������_��
-- UPDATE etcitem SET handler='PaganKeys', skill='2352-1;' WHERE item_id=9712; -- �j�Ŭ}�������_��
-- UPDATE etcitem SET handler='ItemSkills',skill='2353-1;' WHERE item_id=9713; -- �պ��g���O

-- UPDATE `npc` SET `type`='L2Monster', `exp`=720,  `sp`=32,  `hp`=720,  `mp`=213, `aggro`=400 where id='18347';  --  �x�骺ĵ�çL
-- UPDATE `npc` SET `type`='L2Monster', `exp`=935,  `sp`=35,  `hp`=720,  `mp`=213, `aggro`=400 where id='18348';  --  �x�骺ĵ�çL
-- UPDATE `npc` SET `type`='L2Monster', `exp`=920,  `sp`=40,  `hp`=720,  `mp`=213, `aggro`=600, `walkspd`=0, `runspd`=0 where id='18349';  --  �x�骺ĵ�çL
-- UPDATE `npc` SET `type`='L2Monster', `exp`=980,  `sp`=40,  `hp`=720,  `mp`=213, `aggro`=400 where id='18350';  --  �x�骺ĵ�çL
-- UPDATE `npc` SET `type`='L2Monster', `exp`=980,  `sp`=40,  `hp`=720,  `mp`=213, `aggro`=400 where id='18351';  --  �x�骺ĵ�çL
-- UPDATE `npc` SET `type`='L2Monster', `exp`=1807, `sp`=68,  `hp`=1387, `mp`=218, `aggro`=400 where id='18352';  --  ��ѨϦu�@��
-- UPDATE `npc` SET `type`='L2Monster', `exp`=2401, `sp`=99,  `hp`=1387, `mp`=218, `aggro`=400 where id='18353';  --  �����u�@��
-- UPDATE `npc` SET `type`='L2Monster', `exp`=1807, `sp`=68,  `hp`=1387, `mp`=218, `aggro`=400 where id='18354';  --  �[��u�@��
-- UPDATE `npc` SET `type`='L2Monster', `exp`=2541, `sp`=99,  `hp`=1387, `mp`=218, `aggro`=400 where id='18355';  --  ����ʩԦu�@��
-- UPDATE `npc` SET `type`='L2Monster', `exp`=2469, `sp`=111, `hp`=1387, `mp`=218, `aggro`=400 where id='18356';  --  �ѤѤ��W�u���H
-- UPDATE `npc` SET `type`='L2Monster', `exp`=2401, `sp`=99,  `hp`=1387, `mp`=218, `aggro`=400 where id='18357';  --  ù�����ʩԦu���H
-- UPDATE `npc` SET `type`='L2Monster', `exp`=1807, `sp`=68,  `hp`=1387, `mp`=218, `aggro`=400 where id='18358';  --  ���K�u�@��
-- UPDATE `npc` SET `type`='L2Monster', `exp`=1807, `sp`=68,  `hp`=1387, `mp`=218, `aggro`=400 where id='18359';  --  �Ⱥ�����|�u�@��
-- UPDATE `npc` SET `type`='L2Monster', `exp`=1807, `sp`=68,  `hp`=1387, `mp`=218, `aggro`=400 where id='18360';  --  �ͯS�`�S�u���H
-- UPDATE `npc` SET `type`='L2Monster', `exp`=2401, `sp`=99,  `hp`=1387, `mp`=218, `aggro`=400 where id='18361';  --  �w���u�@��
-- UPDATE `npc` SET `type`='L2Monster', `exp`=850,  `sp`=35,  `hp`=582,  `mp`=185, `aggro`=400 where id='18362';  --  �x�骺ĵ�çL
-- UPDATE `npc` SET `type`='L2Monster', `exp`=850,  `sp`=35,  `hp`=582,  `mp`=185, `aggro`=400 where id='18363';  --  �x�骺ĵ�çL
-- UPDATE `npc` SET `type`='L2Monster', `exp`=1401, `sp`=72,  `hp`=780,  `mp`=185, `aggro`=400 where id='18444';  --  �x�骺ĵ�çL
-- UPDATE `npc` SET `type`='L2Monster', `exp`=1757, `sp`=80,  `hp`=780,  `mp`=213, `aggro`=400 where id='18483';  --  �x�骺ĵ�çL
-- UPDATE `npc` SET `type`='L2Monster', `exp`=0,    `sp`=0,   `hp`=100,  `mp`=0,   `walkspd`=0, `runspd`=0 where id='18478';  --  �į��|
UPDATE `npc` SET `type`='L2Monster', `hp`=9999999, `exp`=0, `sp`=0, `mp`=1000, `walkspd`=0, `runspd`=0, `aggro`=500 where id='18437';  --  

DELETE FROM npcskills WHERE npcid IN (18437);

-- REPLACE INTO `droplist` VALUES
-- (18478,8154,1,7,2,700000),-- �ͩR�į�
-- (18478,8155,1,7,2,700000);-- �����į�

-- �ק� LV 16071 �����w / 16072 ��U�����w
UPDATE npc SET `level` = '75' WHERE `id` in (16071,16072);

-- etcitem for Vitality CT2.5
-- REPLACE INTO `etcitem` VALUES (20005,'Energy Red Ginseng','','false','herb',0,'normal','paper','none',-1,-1,0,0,'true','true','true','true','true','ItemSkills','22005-1;');
-- REPLACE INTO `etcitem` VALUES (20214,'Chocolate Cookie','','false','potion',5,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','ItemSkills','22028-1;');
-- REPLACE INTO `etcitem` VALUES (13787,'Bond','','false','potion',180,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','ItemSkills','5849-1;');
-- REPLACE INTO `etcitem` VALUES (13788,'Land Mine','','false','potion',180,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','ItemSkills','5851-1;');

-- UPDATE `etcitem` SET `item_type` = 'none' WHERE `item_id` = '13798';  -- �F����q

-- New ectitem 2009-08-26
-- REPLACE INTO `etcitem` VALUES (20602,'Soul Silver Foil - Event','','false','none',0,'stackable','wood','none',-1,-1,0,0,'false','false','true','false','true','ItemSkills','22099-1;');
-- REPLACE INTO `etcitem` VALUES (20603,'Soul Scent - Event','','false','none',0,'stackable','wood','none',-1,-1,0,0,'false','false','true','false','true','ItemSkills','22100-1;');
-- REPLACE INTO `etcitem` VALUES (20623,'Soul Silver Foil - Scent Pack','','false','none',0,'stackable','wood','none',-1,-1,0,0,'false','false','true','false','true','ExtractableItems','0-0;');
-- REPLACE INTO `etcitem` VALUES (20630,'Soul Magic Box','','false','none',0,'stackable','wood','none',-1,-1,0,0,'false','false','true','false','true','ItemSkills','22102-1;');

-- ----------------- --
-- Devastated Castle --
-- ----------------- --

-- Update siege npcs

-- UPDATE npc SET type = 'L2Defender' WHERE id = 35411;
-- UPDATE npc SET type = 'L2Defender' WHERE id = 35412;
-- UPDATE npc SET type = 'L2Defender' Where id = 35413;
-- UPDATE npc SET type = 'L2Defender' WHERE id = 35414;
-- UPDATE npc SET type = 'L2Defender' WHERE id = 35415;
-- UPDATE npc SET type = 'L2Defender' WHERE id = 35416;
-- UPDATE npc SET type = 'L2CastleDoormen', rhand = 0, lhand = 0 WHERE id = 35417;
-- UPDATE npc SET type = 'L2CastleDoormen', rhand = 0, lhand = 0 WHERE id = 35418;
-- UPDATE npc SET type = 'L2WyvernManager' WHERE id = 35419;
-- UPDATE npc SET type = 'L2ClanHallManager' WHERE id = 35421;

-- Delete mobs from normal spawnlist

-- DELETE FROM spawnlist WHERE npc_templateid = 35411;
-- DELETE FROM spawnlist WHERE npc_templateid = 35412;
-- DELETE FROM spawnlist WHERE npc_templateid = 35413;
-- DELETE FROM spawnlist WHERE npc_templateid = 35414;
-- DELETE FROM spawnlist WHERE npc_templateid = 35415;
-- DELETE FROM spawnlist WHERE npc_templateid = 35416;
-- DELETE FROM spawnlist WHERE npc_templateid = 35410;

-- Devastated castle doors

-- REPLACE INTO castle_door VALUES (34, 25170001, 'devastated_castle_outer_001', 178212, -15038, -2135, 178211, -15038, -2294, 178342, -15017, -1976, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (34, 25170002, 'devastated_castle_outer_002', 178468, -15038, -2135, 178339, -15038, -2295, 178469, -15017, -1977, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (34, 25170003, 'devastated_castle_inner_003', 178119, -18220, -2210, 178120, -18225, -2286, 178183, -18211, -1836, 79125, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (34, 25170004, 'devastated_castle_inner_004', 178247, -18220, -2210, 178182, -18225, -2286, 178245, -18211, -1836, 79125, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (34, 25170005, 'devastated_castle_inner_005', 178298, -18573, -2233, 178302, -18611, -2287, 178309, -18573, -1837, 79125, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (34, 25170006, 'devastated_castle_inner_006', 178298, -18650, -2233, 178302, -18648, -2287, 178309, -18610, -1837, 79125, 644, 518, 'false');

-- ---------------------- --
-- Fortress of Resistance --
-- ---------------------- --
-- UPDATE npc SET type = 'L2CastleDoormen' WHERE id = 30596;
-- UPDATE npc SET type = 'L2ClanHallManager' WHERE id = 35383;
-- DELETE FROM spawnlist WHERE npc_templateid = 35368;
-- DELETE FROM spawnlist WHERE npc_templateid = 35369;
-- DELETE FROM spawnlist WHERE npc_templateid = 35370;
-- DELETE FROM spawnlist WHERE npc_templateid = 35371;
-- UPDATE npc SET type = 'L2RaidBoss', title = 'Raid Boss' WHERE id = 35368;
-- UPDATE npc SET type = 'L2Monster', title = 'Raid Figther' WHERE id = 35369;
-- UPDATE npc SET type = 'L2Monster', title = 'Raid Figther' WHERE id = 35370;
-- UPDATE npc SET type = 'L2Monster', title = 'Raid Figther' WHERE id = 35371;

-- -------------------- --
-- Fortress of the Dead --
-- -------------------- --

-- Update siege npcs

-- UPDATE npc SET type = 'L2WyvernManager' WHERE id = 35638;
-- UPDATE npc SET type = 'L2CastleDoormen', rhand = 0, lhand = 0 WHERE id = 35641;
-- UPDATE npc SET type = 'L2CastleDoormen', rhand = 0, lhand = 0 WHERE id = 35642;
-- UPDATE npc SET type = 'L2ClanHallManager' WHERE id = 35640;

-- Fortress of the Dead doors
-- REPLACE INTO castle_door VALUES (64, 21170001, 'Fortress_of_the_Dead_outer_001', 57857, -29480, 707, 57849, -29498, 543, 57969, -29465, 869, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (64, 21170002, 'Fortress_of_the_Dead_outer_002', 58061, -29479, 707, 57954, -29498, 543, 58071, -29465, 869, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (64, 21170003, 'Fortress_of_the_Dead_inner_003', 56977, -27193, 639, 56972, -27259, 550, 56982, -27188, 728, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (64, 21170004, 'Fortress_of_the_Dead_inner_004', 56977, -27318, 639, 56971, -27323, 550, 56981, -27251, 726, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (64, 21170005, 'Fortress_of_the_Dead_inner_005', 57902, -26392, 654, 57893, -26401, 563, 57976, -26382, 743, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (64, 21170006, 'Fortress_of_the_Dead_inner_006', 58024, -26391, 654, 57953, -26400, 563, 58037, -26383, 743, 158250, 644, 518, 'false');

-- ----------------------- --
-- Rainbow Springs Chateau --
-- ----------------------- --

-- Rainbow Springs Chateau Door
-- REPLACE INTO castle_door VALUES (62, 24140001, 'Rainbow_Springs_inner_001', 140728, -124477, -1894, 140725, -124478, -1913, 140754, -124437, -1463, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (62, 24140002, 'Rainbow_Springs_inner_002', 140778, -124402, -1894, 140750, -124440, -1923, 140779, -124399, -1473, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (62, 24140003, 'Rainbow_Springs_inner_003', 141149, -124310, -1894, 141146, -124336, -1921, 141187, -124306, -1471, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (62, 24140004, 'Rainbow_Springs_inner_004', 141224, -124360, -1894, 141184, -124361, -1920, 141225, -124332, -1470, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (62, 24140005, 'Rainbow_Springs_inner_005', 141281, -124738, -1894, 141253, -124777, -1949, 141282, -124735, -1499, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (62, 24140006, 'Rainbow_Springs_inner_006', 141231, -124813, -1894, 141228, -124814, -1947, 141258, -124772, -1497, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (62, 24140007, 'Rainbow_Springs_outer_007', 140702, -123836, -1932, 140700, -123886, -1942, 140715, -123835, -1492, 158250, 644, 518, 'false');
-- REPLACE INTO castle_door VALUES (62, 24140008, 'Rainbow_Springs_outer_008', 140722, -123934, -1932, 140709, -123935, -1941, 140723, -123884, -1491, 158250, 644, 518, 'false');

-- Messenger
-- DELETE FROM `spawnlist` WHERE `npc_templateid` IN (35604);
-- INSERT INTO `spawnlist` (location,count,npc_templateid,locx,locy,locz,randomx,randomy,heading,respawn_delay,loc_id,periodOfDay) VALUES 
-- ('rainbowsprings_messenger', 1, 35604, 143944, -119196, -2136, 0, 0, 1000, 0, 0, 0); 

-- Caretaker
-- REPLACE INTO clanhall_siege_guards VALUES (62, NULL, 35603, 153337, -126441, -2270, 1, 1, 0);

-- Arena 1 npc / monsters
-- REPLACE INTO clanhall_siege_guards VALUES (62, NULL, 35596, 151774, -126861, -2218, 1, 1, 0);
-- REPLACE INTO clanhall_siege_guards VALUES (62, NULL, 35593, 151862, -127080, -2218, 1, 300000, 0);
-- REPLACE INTO clanhall_siege_guards VALUES (62, NULL, 35592, 151262, -127080, -2218, 1, 300000, 0);

-- Arena 2 npc / monsters
-- REPLACE INTO clanhall_siege_guards VALUES (62, NULL, 35597, 153404, -125576, -2218, 1, 1, 0);
-- REPLACE INTO clanhall_siege_guards VALUES (62, NULL, 35593, 153341, -125335, -2218, 1, 300000, 0);
-- REPLACE INTO clanhall_siege_guards VALUES (62, NULL, 35592, 152841, -125335, -2218, 1, 300000, 0);

-- Arena 3 npc / monsters
-- REPLACE INTO clanhall_siege_guards VALUES (62, NULL, 35598, 154132, -127301, -2218, 1, 1, 0);
-- REPLACE INTO clanhall_siege_guards VALUES (62, NULL, 35593, 154192, -127530, -2218, 1, 300000, 0);
-- REPLACE INTO clanhall_siege_guards VALUES (62, NULL, 35592, 153592, -127530, -2218, 1, 300000, 0);

-- Arena 4 npc / monsters
-- REPLACE INTO clanhall_siege_guards VALUES (62, NULL, 35598, 155390, -125489, -2218, 1, 1, 0);
-- REPLACE INTO clanhall_siege_guards VALUES (62, NULL, 35593, 155969, -125752, -2218, 1, 300000, 0);
-- REPLACE INTO clanhall_siege_guards VALUES (62, NULL, 35592, 155369, -125752, -2218, 1, 300000, 0);

-- Update siege npcs
-- UPDATE npc SET type = 'L2Monster' WHERE id = 35592;
-- UPDATE npc SET type = 'L2Monster' WHERE id = 35593;
-- UPDATE npc SET type = 'L2Monster' WHERE id = 35588;
-- UPDATE npc SET type = 'L2Monster' WHERE id = 35589;
-- UPDATE npc SET type = 'L2Monster' WHERE id = 35590;
-- UPDATE npc SET type = 'L2Monster' WHERE id = 35591;
-- UPDATE npc SET type = 'L2Doormen' WHERE id = 35602;
-- UPDATE npc SET type = 'L2Doormen' WHERE id = 35601;
-- UPDATE npc SET type = 'L2ClanHallManager', `mp` = '152120' WHERE id = 35605;

-- Update siege items
-- UPDATE etcitem SET item_type = 'stackable', handler = 'QuestItems' WHERE item_id = 8030;
-- UPDATE etcitem SET item_type = 'stackable', handler = 'QuestItems' WHERE item_id = 8031;
-- UPDATE etcitem SET item_type = 'stackable', handler = 'QuestItems' WHERE item_id = 8032;
-- UPDATE etcitem SET item_type = 'stackable', handler = 'QuestItems' WHERE item_id = 8033;

REPLACE INTO npcskills VALUES
-- Chamber of Delusion
-- Invader Warrior of Nightmare (81)
(22708,4416,1),
(22708,4408,13),
(22708,4414,3),
(22708,5467,1),
(22708,5334,4),
-- Invader Healer of Nightmare (81)
(22709,4416,1),
(22709,4408,13),
(22709,4414,3),
(22709,5467,1),
(22709,4613,10),
-- Invader Guide of Nightmare (81)
(22710,4416,1),
(22710,4408,11),
(22710,4414,3),
(22710,5467,1),
(22710,5374,4),
(22710,5375,4),
(22710,4046,10),
-- Invader Destroyer of Nightmare (81)
(22711,4416,1),
(22711,4408,12),
(22711,4410,18),
(22711,4414,3),
(22711,5467,1),
(22711,5334,4),
-- Invader Assassin of Nightmare (81)
(22712,4416,9),
(22712,4408,11),
(22712,4410,14),
(22712,4414,3),
(22712,5467,1),
(22712,5364,4),
(22712,4579,10),
-- Invader Shaman of Nightmare (81)
(22713,4416,1),
(22713,4408,12),
(22713,5467,1),
(22713,5374,4),
(22713,5375,4),
(22713,4608,2),
-- Invader Archer of Nightmare (81)
(22714,4416,1),
(22714,4408,11),
(22714,5467,1),
(22714,5335,4),
(22714,4040,4),
(22714,4758,4),
(22714,4495,4),
(22714,5046,4),
-- Invader Soldier of Nightmare (81)
(22715,4416,1),
(22715,4408,13),
(22715,5467,1),
(22715,5334,4),
-- Invader Soldier of Nightmare (81)
(22716,4416,1),
(22716,5467,1),
(22716,5334,4),
-- Invader Disciple of Nightmare (81)
(22717,4416,1),
(22717,4408,16),
(22717,5467,1),
(22717,5334,4),
-- Invader Elite Soldier of Nightmare (81)
(22718,4416,1),
(22718,4408,16),
(22718,4410,18),
(22718,4412,14),
(22718,4413,13),
(22718,4414,1),
(22718,5467,1),
(22718,5334,4),
-- Nihil Invader Warrior (82)
(22719,4416,9),
(22719,5467,1),
(22719,4412,14),
(22719,4413,15),
(22719,5334,4),
-- Nihil Invader Healer (82)
(22720,4416,9),
(22720,5467,1),
(22720,4613,10),
-- Nihil Invader Guide (82)
(22721,4416,9),
(22721,5467,1),
(22721,5374,4),
(22721,5375,4),
(22721,4046,10),
-- Nihil Invader Destroyer (82)
(22722,4416,1),
(22722,5467,1),
(22722,5334,4),
-- Nihil Invader Assassin (82)
(22723,4416,1),
(22723,5467,1),
(22723,4410,13),
(22723,4414,3),
(22723,5364,4),
(22723,4579,10),
-- Nihil Invader Shaman (82)
(22724,4416,9),
(22724,5467,1),
(22724,5374,4),
(22724,5375,4),
(22724,4608,2),
-- Nihil Invader Archer (82)
(22725,4416,1),
(22725,5467,1),
(22725,5335,4),
-- Nihil Invader Soldier (82)
(22726,4416,1),
(22726,5467,1),
(22726,5334,4),
-- Nihil Invader Soldier (82)
(22727,4416,1),
(22727,5467,1),
(22727,4408,8),
(22727,5334,4),
-- Nihil Invader Disciple (82)
(22728,4416,9),
(22728,5467,1),
(22728,5334,4),
-- Nihil Invader Elite Soldier (82)
(22729,4416,9),
(22729,5467,1),
(22729,4408,10),
(22729,4412,14),
(22729,4413,13),
(22729,5334,4),
-- Mutant Warrior (84)
(22730,4416,9),
(22730,5467,1),
(22730,4412,16),
(22730,4413,15),
(22730,4441,5),
(22730,5334,5),
-- Mutant Healer (84)
(22731,4416,9),
(22731,5467,1),
(22731,4613,10),
-- Mutant Guide (84)
(22732,4416,9),
(22732,5467,1),
(22732,5374,4),
(22732,5375,4),
(22732,4046,10),
-- Mutant Destroyer (84)
(22733,4416,1),
(22733,5467,1),
(22733,4410,18),
(22733,5334,5),
-- Mutant Assassin (84)
(22734,4416,1),
(22734,5467,1),
(22734,4410,14),
(22734,4414,3),
(22734,5364,5),
(22734,4579,10),
-- Mutant Shaman (84)
(22735,4416,9),
(22735,5467,1),
(22735,5374,4),
(22735,5375,4),
(22735,4608,2),
-- Mutant Overlord (84)
(22736,4416,1),
(22736,5467,1),
(22736,5335,4),
-- Mutant Soldier (84)
(22737,4416,1),
(22737,5467,1),
(22737,5334,5),
-- Mutant Soldier (84)
(22738,4416,1),
(22738,5467,1),
(22738,4408,8),
(22738,5334,5),
-- Mutant Disciple (84)
(22739,4416,9),
(22739,5467,1),
(22739,4408,10),
(22739,5334,5),
-- Mutant Elite Soldier (84)
(22740,4416,9),
(22740,5467,1),
(22740,4408,10),
(22740,4410,18),
(22740,4412,14),
(22740,4413,13),
(22740,5334,5),
-- Aenkinel (81)
(25690,4494,1),
(25690,6217,1),
(25690,4416,9),
(25690,5467,1),
(25690,5334,5),
(25690,5336,5),
(25690,4177,9),
(25690,4173,9),
-- Aenkinel (81)
(25691,4494,1),
(25691,6218,1),
(25691,4416,9),
(25691,5467,1),
(25691,5334,5),
(25691,5336,5),
(25691,4177,9),
(25691,4173,9),
-- Aenkinel (81)
(25692,4494,1),
(25692,6219,1),
(25692,4416,9),
(25692,5467,1),
(25692,5334,5),
(25692,5336,5),
(25692,4177,9),
(25692,4173,9),
-- Aenkinel (81)
(25693,4494,1),
(25693,6220,1),
(25693,4416,9),
(25693,5467,1),
(25693,5334,5),
(25693,5336,5),
(25693,4177,9),
(25693,4173,9),
-- Aenkinel (82)
(25694,4494,1),
(25694,6221,1),
(25694,4416,9),
(25694,5467,1),
(25694,5334,5),
(25694,5336,5),
(25694,4177,9),
(25694,4173,9),
-- Aenkinel (84)
(25695,4494,1),
(25695,6222,1),
(25695,4416,9),
(25695,5467,1),
(25695,5334,5),
(25695,5336,5),
(25695,4177,9),
(25695,4173,9);

-- Gracia Epilog : Chamber of Delusion
REPLACE INTO `droplist` VALUES
-- Invader Warrior of Nightmare (81)
(22708,57,11663,23327,0,700000), -- Adena
(22708,1879,5,10,1,100000), -- Cokes
(22708,1885,1,3,1,90000), -- High Grade Suede
(22708,9628,1,1,1,20000), -- Leonard
(22708,9629,1,1,1,20000), -- Adamantine
(22708,9630,1,1,1,20000), -- Orichalcum
(22708,9533,1,3,2,100), -- Sealed Dynasty Gauntlet Piece
(22708,9543,1,3,2,100), -- Sealed Dynasty Glove Piece
(22708,9538,1,3,2,100), -- Sealed Dynasty Leather Glove Piece
(22708,9539,1,3,2,100), -- Sealed Dynasty Leather Boots Piece
(22708,9534,1,3,2,100), -- Sealed Dynasty Boot Piece
(22708,9544,1,3,2,100), -- Sealed Dynasty Shoes Piece
(22708,9547,1,1,200,1000), -- Water Stone
(22708,9517,1,1,2,10), -- Sealed Dynasty Gauntlets
(22708,9522,1,1,2,10), -- Sealed Dynasty Leather Gloves
(22708,9527,1,1,2,10), -- Sealed Dynasty Gloves
(22708,9528,1,1,2,10), -- Sealed Dynasty Shoes
(22708,9523,1,1,2,10), -- Sealed Dynasty Leather Boots
(22708,9518,1,1,2,10), -- Sealed Dynasty Boots
(22708,9544,1,1,-1,60000), -- Sealed Dynasty Shoes Piece
(22708,10114,1,1,-1,60000), -- Sealed Dynasty Sigil Piece
(22708,9542,1,1,-1,60000), -- Sealed Dynasty Circlet Piece
-- Invader Healer of Nightmare (81)
(22709,57,11687,23373,0,700000), -- Adena
(22709,4043,1,1,1,100000), -- Asofe
(22709,4042,1,1,1,50000), -- Enria
(22709,4040,1,1,1,20000), -- Mold Lubricant
(22709,1895,1,5,1,250000), -- Metallic Fiber
(22709,9545,1,1,2,100), -- Sealed Dynasty Shield Piece
(22709,10114,1,1,2,100), -- Sealed Dynasty Sigil Piece
(22709,9542,1,1,2,100), -- Sealed Dynasty Circlet Piece
(22709,9532,1,1,2,100), -- Sealed Dynasty Helmet Piece
(22709,9537,1,1,2,100), -- Sealed Dynasty Leather Helmet Piece
(22709,9516,1,1,2,10), -- Sealed Dynasty Helmet
(22709,9521,1,1,2,10), -- Sealed Dynasty Leather Helmet
(22709,9526,1,1,2,10), -- Sealed Dynasty Circlet
(22709,12812,1,1,2,10), -- Dynasty Sigil
(22709,9441,1,1,2,10), -- Dynasty Shield
(22709,9548,1,1,200,1000), -- Earth Stone
(22709,1882,1,3,-1,125000), -- Leather
(22709,9530,1,1,-1,31250), -- Sealed Dynasty Breast Plate Piece
(22709,5162,1,1,-1,62500), -- Recipe: Spiritshot (S) Compressed Package (100%)
-- Invader Guide of Nightmare (81)
(22710,57,7448,14896,0,700000), -- Adena
(22710,1879,5,10,1,100000), -- Cokes
(22710,1885,1,3,1,90000), -- High Grade Suede
(22710,9628,1,1,1,20000), -- Leonard
(22710,9629,1,1,1,20000), -- Adamantine
(22710,9630,1,1,1,20000), -- Orichalcum
(22710,9616,1,1,2,50), -- Dynasty Sword Piece
(22710,9617,1,1,2,50), -- Dynasty Blade Piece
(22710,9618,1,1,2,50), -- Dynasty Phantom Piece
(22710,9442,1,1,2,5), -- Dynasty Sword
(22710,9443,1,1,2,5), -- Dynasty Blade
(22710,9444,1,1,2,5), -- Dynasty Phantom
(22710,9549,1,1,200,1000), -- Wind Stone
(22710,1882,1,3,-1,125000), -- Leather
(22710,9628,1,1,-1,30000), -- Leonard
(22710,9530,1,1,-1,31250), -- Sealed Dynasty Breast Plate Piece
-- Invader Destroyer of Nightmare (81)
(22711,57,10259,20518,0,700000), -- Adena
(22711,1895,1,5,1,200000), -- Metallic Fiber
(22711,4040,1,1,1,20000), -- Mold Lubricant
(22711,9628,1,1,1,20000), -- Leonard
(22711,9630,1,1,1,20000), -- Orichalcum
(22711,9550,1,1,200,1000), -- Dark Stone
(22711,9623,1,1,2,50), -- Dynasty Mace Piece
(22711,10546,1,1,2,50), -- Dynasty Staff Fragment
(22711,9622,1,1,2,50), -- Halberd Cudgel Piece
(22711,10547,1,1,2,50), -- Dynasty Crusher Fragment
(22711,9449,1,1,2,5), -- Dynasty Mace
(22711,9448,1,1,2,5), -- Dynasty Cudgel
(22711,10252,1,1,2,5), -- Dynasty Staff
(22711,10253,1,1,2,5), -- Dynasty Crusher
(22711,1808,1,1,-1,60000), -- Recipe: Soulshot: S Grade
(22711,9535,1,1,-1,20000), -- Sealed Dynasty Leather Armor Piece
(22711,9993,1,1,-1,30000), -- Sealed Dynasty Ring Gemstone
-- Invader Assassin of Nightmare (81)
(22712,57,7646,15293,0,700000), -- Adena
(22712,1895,1,5,1,200000), -- Metallic Fiber
(22712,4040,1,1,1,20000), -- Mold Lubricant
(22712,9628,1,1,1,20000), -- Leonard
(22712,9630,1,1,1,20000), -- Orichalcum
(22712,9551,1,1,200,1000), -- Divine Stone
(22712,9624,1,1,2,50), -- Dynasty Bagh-Nakh Piece
(22712,9450,1,1,2,5), -- Dynasty Bagh-Nakh
(22712,1808,1,1,-1,60000), -- Recipe: Soulshot: S Grade
(22712,9628,1,1,-1,30000), -- Leonard
(22712,9531,1,1,-1,30000), -- Sealed Dynasty Gaiter Piece
-- Invader Shaman of Nightmare (81)
(22713,57,9606,19212,0,700000), -- Adena
(22713,1895,1,5,1,200000), -- Metallic Fiber
(22713,4040,1,1,1,20000), -- Mold Lubricant
(22713,9628,1,1,1,20000), -- Leonard
(22713,9630,1,1,1,20000), -- Orichalcum
(22713,1345,100,300,0,150000), -- Shining Arrow
(22713,9619,1,1,2,50), -- Dynasty Bow Piece
(22713,9445,1,1,2,5), -- Dynasty Bow
(22713,9617,1,1,-1,20000), -- Dynasty Blade Piece
(22713,6901,1,1,-1,62500), -- Recipe: Shining Arrow (100%)
(22713,9543,1,1,-1,30000), -- Sealed Dynasty Gloves
-- Invader Archer of Nightmare (81)
(22714,57,7270,14539,0,700000), -- Adena
(22714,1895,1,5,1,200000), -- Metallic Fiber
(22714,4040,1,1,1,20000), -- Mold Lubricant
(22714,9628,1,1,1,20000), -- Leonard
(22714,9630,1,1,1,20000), -- Orichalcum
(22714,960,1,1,2,100), -- Scroll: Enchant Armor (S)
(22714,9620,1,1,2,50), -- Dynasty Knife Piece
(22714,9446,1,1,2,5), -- Dynasty Knife
(22714,9620,1,1,-1,30000), -- Dynasty Knife Piece
(22714,1808,1,1,-1,60000), -- Recipe: Soulshot: S Grade
(22714,9535,1,1,-1,20000), -- Sealed Dynasty Leather Armor Piece
-- Invader Soldier of Nightmare (81)
(22715,57,1817,3635,0,700000), -- Adena
(22715,1879,5,10,1,100000), -- Cokes
(22715,1885,1,3,1,90000), -- High Grade Suede
(22715,9628,1,1,1,20000), -- Leonard
(22715,9629,1,1,1,20000), -- Adamantine
(22715,9630,1,1,1,20000), -- Orichalcum
(22715,9621,1,1,2,50), -- Dynasty Halberd Piece
(22715,9530,1,1,2,100), -- Sealed Dynasty Breast Plate Piece
(22715,9531,1,1,2,100), -- Sealed Dynasty Gaiter Piece
(22715,9447,1,1,2,5), -- Dynasty Halberd
(22715,9514,1,1,2,10), -- Sealed Dynasty Breast Plate
(22715,9515,1,1,2,10), -- Sealed Dynasty Gaiter
(22715,1882,1,3,-1,125000), -- Leather
(22715,9534,1,1,-1,30000), -- Sealed Dynasty Boot Piece
(22715,9541,1,1,-1,20000), -- Sealed Dynasty Stocking Piece
-- Invader Soldier of Nightmare (81)
(22716,57,11663,23327,0,700000), -- Adena
(22716,1879,5,10,1,50000), -- Cokes
(22716,1885,1,3,1,45000), -- High Grade Suede
(22716,9628,1,1,1,10000), -- Leonard
(22716,9629,1,1,1,10000), -- Adamantine
(22716,9630,1,1,1,10000), -- Orichalcum
(22716,9621,1,1,2,25), -- Dynasty Halberd Piece
(22716,9530,1,1,2,50), -- Sealed Dynasty Breast Plate Piece
(22716,9531,1,1,2,50), -- Sealed Dynasty Gaiter Piece
(22716,9447,1,1,2,2), -- Dynasty Halberd
(22716,9514,1,1,2,4), -- Sealed Dynasty Breast Plate
(22716,9515,1,1,2,4), -- Sealed Dynasty Gaiter
-- Invader Disciple of Nightmare (81)
(22717,57,12729,25459,0,700000), -- Adena
(22717,1895,1,5,1,300000), -- Metallic Fiber
(22717,4040,1,1,1,25000), -- Mold Lubricant
(22717,9628,1,1,1,20000), -- Leonard
(22717,9630,1,1,1,20000), -- Orichalcum
(22717,9535,1,1,2,100), -- Sealed Dynasty Leather Armor Piece
(22717,9536,1,1,2,100), -- Sealed Dynasty Leather Leggings Piece
(22717,9519,1,1,2,10), -- Sealed Dynasty Leather Armor
(22717,9520,1,1,2,10), -- Sealed Dynasty Leather Leggings
(22717,9619,1,1,-1,20000), -- Dynasty Bow Piece
(22717,6901,1,1,-1,62500), -- Recipe: Shining Arrow (100%)
(22717,959,1,1,-1,4768), -- Scroll: Enchant Weapon (S)
-- Invader Elite Soldier of Nightmare (81)
(22718,57,3728,27455,0,700000), -- Adena
(22718,1895,1,5,1,300000), -- Metallic Fiber
(22718,4040,1,1,1,25000), -- Mold Lubricant
(22718,9628,1,1,1,20000), -- Leonard
(22718,9630,1,1,1,20000), -- Orichalcum
(22718,6901,1,1,2,10000), -- Recipe: Shining Arrow (100%)
(22718,9540,1,1,2,100), -- Sealed Dynasty Tunic Piece
(22718,9541,1,1,2,100), -- Sealed Dynasty Stocking Piece
(22718,9524,1,1,2,5), -- Sealed Dynasty Tunic
(22718,9525,1,1,2,5), -- Sealed Dynasty Stockings
(22718,9628,1,1,-1,30000), -- Leonard
(22718,9543,1,1,-1,20000), -- Sealed Dynasty Glove Piece
(22718,9535,1,1,-1,20000), -- Sealed Dynasty Leather Armor Piece
-- Nihil Invader Warrior (82)
(22719,57,3296,26592,0,700000),
(22719,9993,1,1,1,13341),
(22719,9991,1,1,1,9493),
(22719,9992,1,1,1,7285),
(22719,9454,1,1,1,201),
(22719,9452,1,1,1,134),
(22719,9453,1,1,1,100),
(22719,1879,2,4,2,164943),
(22719,1885,1,3,2,123707),
(22719,9628,1,1,2,23286),
(22719,9630,1,1,2,15626),
(22719,9629,1,1,2,12909),
(22719,5157,1,1,2,1320),
(22719,9624,1,1,-1,46703),
(22719,1808,1,1,-1,25707),
(22719,3036,1,1,-1,25707),
-- Nihil Invader Healer (82)
(22720,57,2285,24569,0,700000),
(22720,9533,1,1,1,9264),
(22720,9534,1,1,1,9264),
(22720,9538,1,1,1,9264),
(22720,9539,1,1,1,9264),
(22720,9543,1,1,1,9264),
(22720,9544,1,1,1,9264),
(22720,9517,1,1,1,42),
(22720,9518,1,1,1,42),
(22720,9522,1,1,1,42),
(22720,9523,1,1,1,42),
(22720,9527,1,1,1,42),
(22720,9528,1,1,1,42),
(22720,1879,2,4,2,157781),
(22720,1885,1,3,2,118335),
(22720,9628,1,1,2,22275),
(22720,9630,1,1,2,14948),
(22720,9629,1,1,2,12348),
(22720,5162,1,1,2,1262),
(22720,9628,1,1,-1,433961),
(22720,9534,1,1,-1,397058),
(22720,9630,1,1,-1,291211),
-- Nihil Invader Guide (82)
(22721,57,12291,24583,0,700000),
(22721,1985,1,1,1,26785),
(22721,9545,1,1,1,4994),
(22721,9532,1,1,1,4190),
(22721,9537,1,1,1,4190),
(22721,9542,1,1,1,4190),
(22721,10114,1,1,1,2889),
(22721,9529,1,1,1,24),
(22721,13886,1,1,1,24),
(22721,9516,1,1,1,17),
(22721,9521,1,1,1,17),
(22721,9526,1,1,1,17),
(22721,4040,1,1,2,46994),
(22721,9628,1,1,2,18429),
(22721,9630,1,1,2,12367),
(22721,5167,1,1,2,1044),
(22721,9534,1,1,-1,219003),
(22721,9538,1,1,-1,219003),
(22721,3957,1,1,-1,13564),
-- Nihil Invader Destroyer (82)
(22722,57,12221,24443,0,700000),
(22722,9616,1,1,1,2147),
(22722,9617,1,1,1,2147),
(22722,9618,1,1,1,2147),
(22722,9442,1,1,1,7),
(22722,9443,1,1,1,7),
(22722,9444,1,1,1,7),
(22722,1895,3,7,2,194195),
(22722,4043,1,1,2,113280),
(22722,4040,1,1,2,67968),
(22722,4042,1,1,2,56640),
(22722,9625,1,1,2,680),
(22722,1882,8,17,-1,980859),
(22722,9538,1,1,-1,395934),
(22722,5157,1,1,-1,24521),
-- Nihil Invader Assassin (82)
(22723,57,12517,25035,0,700000),
(22723,10546,1,1,1,910),
(22723,10547,1,1,1,910),
(22723,9622,1,1,1,878),
(22723,9623,1,1,1,878),
(22723,9448,1,1,1,3),
(22723,9449,1,1,1,3),
(22723,10252,1,1,1,3),
(22723,10253,1,1,1,3),
(22723,1879,1,3,2,132939),
(22723,1885,1,1,2,132939),
(22723,9628,1,1,2,12512),
(22723,9630,1,1,2,8396),
(22723,9629,1,1,2,6936),
(22723,9626,1,1,2,213),
(22723,1882,4,10,-1,986635),
(22723,9530,1,1,-1,67894),
(22723,5162,1,1,-1,13813),
-- Nihil Invader Shaman (82)
(22724,57,12348,24697,0,700000),
(22724,9624,1,1,1,6272),
(22724,9450,1,1,1,21),
(22724,1895,3,7,2,195304),
(22724,4043,1,1,2,113927),
(22724,4040,1,1,2,68356),
(22724,4042,1,1,2,56964),
(22724,9625,1,1,2,684),
(22724,9535,1,1,-1,148904),
(22724,10547,1,1,-1,46434),
(22724,5167,1,1,-1,24661),
-- Nihil Invader Archer (82)
(22725,57,11864,23728,0,700000),
(22725,9619,1,1,1,6381),
(22725,9445,1,1,1,20),
(22725,1895,3,7,2,191072),
(22725,4040,1,1,2,66875),
(22725,9628,1,1,2,26226),
(22725,9630,1,1,2,17599),
(22725,9626,1,1,2,446),
(22725,1882,8,17,-1,965084),
(22725,9533,1,1,-1,389566),
(22725,9539,1,1,-1,389566),
-- Nihil Invader Soldier (82)
(22726,57,12221,24443,0,700000),
(22726,9620,1,1,1,6436),
(22726,9446,1,1,1,21),
(22726,1879,2,4,2,157334),
(22726,1885,1,3,2,118000),
(22726,9546,1,1,2,22656),
(22726,9628,1,1,2,22212),
(22726,9630,1,1,2,14905),
(22726,9629,1,1,2,12313),
(22726,9623,1,1,-1,44549),
(22726,5272,1,1,-1,24521),
(22726,5277,1,1,-1,24521),
-- Nihil Invader Soldier (82)
(22727,57,5555,11111,0,700000),
(22727,9621,1,1,1,1618),
(22727,9447,1,1,1,5),
(22727,1879,1,1,2,118000),
(22727,1885,1,1,2,59000),
(22727,9547,1,1,2,5664),
(22727,9628,1,1,2,5553),
(22727,9630,1,1,2,3726),
(22727,9629,1,1,2,3078),
(22727,9533,1,1,-1,98983),
(22727,10547,1,1,-1,11543),
(22727,960,1,1,-1,5517),
-- Nihil Invader Disciple (82)
(22728,57,12221,24443,0,700000),
(22728,9531,1,1,1,24954),
(22728,9530,1,1,1,8436),
(22728,9515,1,1,1,51), 
(22728,9514,1,1,1,32),
(22728,1895,3,7,2,194195),
(22728,4040,1,1,2,67968),
(22728,9548,1,1,2,27187),
(22728,9628,1,1,2,26654),
(22728,9630,1,1,2,17886),
(22728,1882,8,17,-1,980859),
(22728,9530,1,1,-1,120530),
(22728,5277,1,1,-1,24521),
-- Nihil Invader Elite Soldier (82)
(22729,57,11652,33304,0,700000),
(22729,9536,1,1,1,28554),
(22729,9535,1,1,1,19425),
(22729,9520,1,1,1,127), 
(22729,9519,1,1,1,79), 
(22729,1895,7,13,2,182000),
(22729,4040,1,1,2,127400),
(22729,4042,1,1,2,106167),
(22729,4043,1,3,2,106167),
(22729,9549,1,1,2,50960),
(22729,9993,1,1,-1,511157),
(22729,10546,1,1,-1,86542),
(22729,9623,1,1,-1,83502),
-- Mutant Warrior (84)
(22730,57,17930,35859,0,700000),
(22730,9541,1,1,1,32521), 
(22730,9540,1,1,1,22124), 
(22730,9525,1,1,1,144), 
(22730,9524,1,1,1,90), 
(22730,1879,5,9,2,143949),
(22730,1885,3,5,2,125955),
(22730,9550,1,1,2,48367),
(22730,9628,1,1,2,47418),
(22730,9630,1,1,2,31820),
(22730,9629,1,1,2,26286),
(22730,9630,1,1,-1,627395),
(22730,10405,1,1,-1,76413),
(22730,959,1,1,-1,4768),
-- Mutant Healer (84)
(22731,57,15236,30472,0,700000),
(22731,9993,1,1,1,25639),
(22731,9991,1,1,1,18244),
(22731,9992,1,1,1,14002),
(22731,9454,1,1,1,386),
(22731,9452,1,1,1,257),
(22731,9453,1,1,1,193),
(22731,1895,7,13,2,195637),
(22731,4040,1,1,2,136946),
(22731,4042,1,1,2,114122),
(22731,4043,1,3,2,114122),
(22731,9551,1,1,2,54778),
(22731,9532,1,1,-1,606812),
(22731,9630,1,1,-1,592137),
(22731,10402,1,1,-1,72119),
-- Mutant Guide (84)
(22732,57,15364,30727,0,700000),
(22732,9533,1,1,1,18665),
(22732,9534,1,1,1,18665),
(22732,9538,1,1,1,18665),
(22732,9539,1,1,1,18665),
(22732,9543,1,1,1,18665),
(22732,9544,1,1,1,18665),
(22732,9517,1,1,1,85),
(22732,9518,1,1,1,85),
(22732,9522,1,1,1,85),
(22732,9523,1,1,1,85),
(22732,9527,1,1,1,85),
(22732,9528,1,1,1,85),
(22732,1895,7,13,2,196189),
(22732,4040,1,1,2,137332),
(22732,9628,1,1,2,53856),
(22732,9630,1,1,2,36140),
(22732,959,1,1,2,275),
(22732,10397,1,1,-1,72555), 
(22732,10400,1,1,-1,72323),
(22732,10403,1,1,-1,72323),
-- Mutant Destroyer (84)
(22733,57,17802,35604,0,700000),
(22733,9545,1,1,1,21145),
(22733,9532,1,1,1,17739),
(22733,9537,1,1,1,17739),
(22733,9542,1,1,1,17739),
(22733,10114,1,1,1,12232),
(22733,9529,1,1,1,103),
(22733,13886,1,1,1,103),
(22733,9516,1,1,1,72),
(22733,9521,1,1,1,72),
(22733,9526,1,1,1,72),
(22733,1879,5,9,2,143566),
(22733,1885,3,5,2,125620),
(22733,9628,1,1,2,47292),
(22733,9630,1,1,2,31736),
(22733,9629,1,1,2,26216),
(22733,960,1,1,2,2412),
(22733,9542,1,1,-1,641232),
(22733,9630,1,1,-1,625725),
(22733,9991,1,1,-1,418133),
-- Mutant Assassin (84)
(22734,57,12356,24712,0,700000),
(22734,10397,1,1,1,1649),
(22734,10399,1,1,1,1649),
(22734,10400,1,1,1,1643),
(22734,10215,1,1,1,5),
(22734,10217,1,1,1,5),
(22734,10218,1,1,1,5),
(22734,1879,2,4,2,156667),
(22734,1885,1,3,2,117500),
(22734,9628,1,1,2,22118),
(22734,9630,1,1,2,14842),
(22734,9629,1,1,2,12261),
(22734,5272,1,1,2,1253),
(22734,9542,1,1,-1,299893),
(22734,9530,1,1,-1,121466),
(22734,1808,1,1,-1,24712),
-- Mutant Shaman (84)
(22735,57,15364,30727,0,700000),
(22735,10402,1,1,1,5002),
(22735,10404,1,1,1,5002),
(22735,10220,1,1,1,15),
(22735,10222,1,1,1,15),
(22735,1895,7,13,2,196189),
(22735,4040,1,1,2,137332),
(22735,9628,1,1,2,53856),
(22735,9630,1,1,2,36140),
(22735,5272,1,1,2,3052), 
(22735,10114,1,1,-1,419597),
(22735,6901,1,1,-1,112823),
(22735,960,1,1,-1,45129),
-- Mutant Overlord (84)
(22736,57,11358,22717,0,700000),
(22736,10403,1,1,1,4710),
(22736,10221,1,1,1,14),
(22736,1895,3,7,2,184742),
(22736,4040,1,1,2,64660),
(22736,9628,1,1,2,25357),
(22736,9630,1,1,2,17016),
(22736,5282,1,1,2,1437),
(22736,9532,1,1,-1,286510),
(22736,9630,1,1,-1,279581),
(22736,10399,1,1,-1,34161),
-- Mutant Soldier (84)
(22737,57,15107,30214,0,700000),
(22737,10405,1,1,1,9947), 
(22737,10223,1,1,1,30),
(22737,1895,7,13,2,108377),
(22737,1879,4,8,2,105366),
(22737,1885,2,4,2,105366),
(22737,4040,1,1,2,75864),
(22737,9628,1,1,2,29751),
(22737,9630,1,1,2,19964),
(22737,9629,1,1,2,16492),
(22737,6901,1,1,2,3793),
(22737,5157,1,1,2,1686),
(22737,10398,1,1,-1,72144),
(22737,10399,1,1,-1,72144),
(22737,10404,1,1,-1,71913),
-- Mutant Soldier (84)
(22738,57,11277,22554,0,700000),
(22738,10398,1,1,1,2495), 
(22738,10216,1,1,1,8), 
(22738,1895,2,4,2,90315),
(22738,1879,1,3,2,79025),
(22738,1885,1,1,2,79025),
(22738,4040,1,1,2,18966),
(22738,9628,1,1,2,7438),
(22738,9630,1,1,2,4991),
(22738,9629,1,1,2,4123),
(22738,6901,1,1,2,948),
(22738,5157,1,1,2,421),
(22738,9545,1,1,-1,180310),
(22738,9622,1,1,-1,22645),
(22738,5272,1,1,-1,12465),
-- Mutant Disciple (84)
(22739,57,22905,65810,0,700000),
(22739,10401,1,1,1,18283),
(22739,10219,1,1,1,55),
(22739,1879,7,15,2,190140),
(22739,1885,4,8,2,174295),
(22739,9628,1,1,2,98425),
(22739,9630,1,1,2,66048),
(22739,9629,1,1,2,54562),
(22739,9619,1,1,-1,173125),
(22739,10398,1,1,-1,132600),
(22739,5277,1,1,-1,91641),
-- Mutant Elite Soldier (84)
(22740,57,27241,64482,0,700000),
(22740,9531,1,1,1,96968),
(22740,9530,1,1,1,32782),
(22740,9515,1,1,1,197),
(22740,9514,1,1,1,123),
(22740,1879,8,16,2,131007),
(22740,1885,4,8,2,131007),
(22740,9628,1,1,2,73981),
(22740,9630,1,1,2,49645),
(22740,9629,1,1,2,41011),
(22740,5167,1,1,2,4192),
(22740,1345,2516,5032,3,49987),
(22740,9620,1,1,-1,180814),
(22740,10401,1,1,-1,139087),
(22740,5282,1,1,-1,96434);
-- 
REPLACE INTO `droplist` VALUES
(25634,960,1,1,2,489799), -- Scroll: Enchant Armor (S)
(25634,6700,14,42,0,269254), -- Sealed Tateossian Necklace Chain
(25634,6725,1,1,0,57775), -- Sealed Tateossian Ring
(25634,959,1,1,2,48980), -- Scroll: Enchant Weapon (S)
(25634,6724,1,1,0,38516), -- Sealed Tateossian Earring
(25634,6726,1,1,0,28881), -- Sealed Tateossian Necklace
(25634,6577,1,1,2,8164), -- Blessed Scroll: Enchant Weapon (S)
(25634,6699,40,120,0,171573), -- Sealed Tateossian Ring Gem
(25634,6698,81,243,0,76356), -- Sealed Tateossian Earring Part
(25634,6364,1,1,1,6285), -- Forgotten Blade
(25634,6372,1,1,1,6285), -- Heaven\'s Divider
(25634,6688,8,22,1,193620), -- Forgotten Blade Edge
(25634,6696,4,12,1,368805), -- Heavens Divider Edge
-- 
(25690,960,1,1,1,12000), -- Scroll: Enchant Armor (S)
(25690,9617,1,1,1,339852), -- Dynasty Blade Piece
(25690,9616,1,1,1,339852), -- Dynasty Sword Piece
(25690,9618,1,1,1,339852), -- Dynasty Phantom Piece
(25690,959,1,1,1,17000), -- Scroll: Enchant Weapon (S)
(25690,9992,2,6,1,41090), -- Sealed Dynasty Necklace Gemstone
(25690,9993,5,15,1,10416), -- Sealed Dynasty Ring Gemstone
(25690,9991,1,3,1,178007), -- Sealed Dynasty Earring Gemstone
(25690,6577,1,1,1,17648), -- Blessed Scroll: Enchant Weapon (S)
(25690,9443,1,1,2,4856), -- Dynasty Blade
(25690,9442,1,1,2,4856), -- Dynasty Sword
(25690,9444,1,1,2,4856), -- Dynasty Phantom
(25690,9452,1,1,2,6461), -- Sealed Dynasty Earring
(25690,9453,1,1,2,2843), -- Sealed Dynasty Necklace
(25690,9454,1,1,2,13691), -- Sealed Dynasty Ring
-- 
(25691,960,1,1,1,14000), -- Scroll: Enchant Armor (S)
(25691,9617,1,2,1,359852), -- Dynasty Blade Piece
(25691,9616,1,2,1,359852), -- Dynasty Sword Piece
(25691,9618,1,2,1,359852), -- Dynasty Phantom Piece
(25691,959,1,1,1,19000), -- Scroll: Enchant Weapon (S)
(25691,9992,2,6,1,51090), -- Sealed Dynasty Necklace Gemstone
(25691,9993,5,15,1,14416), -- Sealed Dynasty Ring Gemstone
(25691,9991,1,3,1,198007), -- Sealed Dynasty Earring Gemstone
(25691,6577,1,1,1,19648), -- Blessed Scroll: Enchant Weapon (S)
(25691,9443,1,1,2,5856), -- Dynasty Blade
(25691,9442,1,1,2,5856), -- Dynasty Sword
(25691,9444,1,1,2,5856), -- Dynasty Phantom
(25691,9452,1,1,2,7461), -- Sealed Dynasty Earring
(25691,9453,1,1,2,3843), -- Sealed Dynasty Necklace
(25691,9454,1,1,2,14691), -- Sealed Dynasty Ring
-- 
(25692,960,1,1,1,16000), -- Scroll: Enchant Armor (S)
(25692,9617,1,3,1,379852), -- Dynasty Blade Piece
(25692,9616,1,3,1,379852), -- Dynasty Sword Piece
(25692,9618,1,3,1,379852), -- Dynasty Phantom Piece
(25692,959,1,1,1,21000), -- Scroll: Enchant Weapon (S)
(25692,9992,2,6,1,61090), -- Sealed Dynasty Necklace Gemstone
(25692,9993,5,15,1,24416), -- Sealed Dynasty Ring Gemstone
(25692,9991,1,3,1,218007), -- Sealed Dynasty Earring Gemstone
(25692,6577,1,1,1,21648), -- Blessed Scroll: Enchant Weapon (S)
(25692,9443,1,1,2,6856), -- Dynasty Blade
(25692,9442,1,1,2,6856), -- Dynasty Sword
(25692,9444,1,1,2,6856), -- Dynasty Phantom
(25692,9452,1,1,2,8461), -- Sealed Dynasty Earring
(25692,9453,1,1,2,4843), -- Sealed Dynasty Necklace
(25692,9454,1,1,2,15691), -- Sealed Dynasty Ring
-- 
(25693,960,1,1,1,18000), -- Scroll: Enchant Armor (S)
(25693,9617,2,6,1,399852), -- Dynasty Blade Piece
(25693,9616,2,6,1,399852), -- Dynasty Sword Piece
(25693,9618,2,6,1,399852), -- Dynasty Phantom Piece
(25693,959,1,1,1,23000), -- Scroll: Enchant Weapon (S)
(25693,9992,4,12,1,81090), -- Sealed Dynasty Necklace Gemstone
(25693,9993,10,30,1,44416), -- Sealed Dynasty Ring Gemstone
(25693,9991,2,6,1,238007), -- Sealed Dynasty Earring Gemstone
(25693,6577,1,1,1,23648), -- Blessed Scroll: Enchant Weapon (S)
(25693,9443,1,1,2,7856), -- Dynasty Blade
(25693,9442,1,1,2,7856), -- Dynasty Sword
(25693,9444,1,1,2,7856), -- Dynasty Phantom
(25693,9452,1,1,2,9461), -- Sealed Dynasty Earring
(25693,9453,1,1,2,5843), -- Sealed Dynasty Necklace
(25693,9454,1,1,2,16691), -- Sealed Dynasty Ring
-- 
(25694,15341,1,3,0,1000000), -- Guiding Tea Leaves
(25694,960,1,1,1,20000), -- Scroll: Enchant Armor (S)
(25694,9617,3,9,1,419852), -- Dynasty Blade Piece
(25694,9616,3,9,1,419852), -- Dynasty Sword Piece
(25694,9618,3,9,1,419852), -- Dynasty Phantom Piece
(25694,959,1,1,1,25000), -- Scroll: Enchant Weapon (S)
(25694,9992,7,24,1,101090), -- Sealed Dynasty Necklace Gemstone
(25694,9993,20,60,1,64416), -- Sealed Dynasty Ring Gemstone
(25694,9991,4,13,1,258007), -- Sealed Dynasty Earring Gemstone
(25694,6577,1,1,1,25648), -- Blessed Scroll: Enchant Weapon (S)
(25694,9443,1,1,2,8856), -- Dynasty Blade
(25694,9442,1,1,2,8856), -- Dynasty Sword
(25694,9444,1,1,2,8856), -- Dynasty Phantom
(25694,9452,1,1,2,10461), -- Sealed Dynasty Earring
(25694,9453,1,1,2,6843), -- Sealed Dynasty Necklace
(25694,9454,1,1,2,17691), -- Sealed Dynasty Ring
-- 
(25695,15341,2,3,0,1000000), -- Guiding Tea Leaves
(25695,960,1,3,1,350000), -- Scroll: Enchant Armor (S)
(25695,959,1,3,1,300000), -- Scroll: Enchant Weapon (S)
(25695,9992,14,42,1,101090), -- Sealed Dynasty Necklace Gemstone
(25695,9993,40,120,1,64416), -- Sealed Dynasty Ring Gemstone
(25695,9991,9,27,1,258007), -- Sealed Dynasty Earring Gemstone
(25695,10397,3,9,1,390226), -- Icarus Sawsword Piece
(25695,10399,3,9,1,390226), -- Icarus Spirit Piece
(25695,10400,3,9,1,390226), -- Icarus Heavy Arms Piece
(25695,6577,1,1,1,30648), -- Blessed Scroll: Enchant Weapon (S)
(25695,9452,1,1,2,14461), -- Sealed Dynasty Earring
(25695,9453,1,1,2,10843), -- Sealed Dynasty Necklace
(25695,9454,1,1,2,21691), -- Sealed Dynasty Ring
(25695,10215,1,1,2,4976), -- Icarus Sawsword
(25695,10217,1,1,2,4976), -- Icarus Spirit
(25695,10218,1,1,2,4976); -- Icarus Heavy Arms
-- Kamaloka
REPLACE INTO `droplist` VALUES
(29150,14117,1,1,0,296000), --  Sealed Vesper Shoes
(29150,9528,1,1,1,296000), --  Sealed Dynasty Shoes
(29150,9516,1,1,3,294000), --  Sealed Dynasty Helmet
(29150,9521,1,1,2,294000), --  Sealed Dynasty Leather Helmet
(29150,9526,1,1,1,294000), --  Sealed Dynasty Circlet
(29150,13886,1,1,1,294000), --  Sealed Dynasty Sigil
(29150,9514,1,1,3,294000), --  Sealed Dynasty Breast Plate
(29150,9519,1,1,2,294000), --  Sealed Dynasty Leather Armor
(29150,9524,1,1,1,294000), --  Sealed Dynasty Tunic
(29150,9515,1,1,3,294000), --  Sealed Dynasty Gaiter
(29150,9517,1,1,3,294000), --  Sealed Dynasty Gauntlets
(29150,9518,1,1,3,294000), --  Sealed Dynasty Boots
(29150,9529,1,1,3,294000), --  Sealed Dynasty Shield
(29150,9520,1,1,2,294000), --  Sealed Dynasty Leather Leggings
(29150,9522,1,1,2,294000), --  Sealed Dynasty Leather Gloves
(29150,9523,1,1,2,294000), --  Sealed Dynasty Leather Boots
(29150,9525,1,1,1,294000), --  Sealed Dynasty Stockings
(29150,9527,1,1,1,294000), --  Sealed Dynasty Gloves
(29150,13143,1,1,4,294000), --  Sealed Vesper Helmet
(29150,13144,1,1,5,294000), --  Sealed Vesper Leather Helmet
(29150,13145,1,1,0,294000), --  Sealed Vesper Circlet
(29150,13887,1,1,0,294000), --  Sealed Vesper Sickle
(29150,14105,1,1,4,294000), --  Sealed Vesper Breastplate
(29150,14106,1,1,5,294000), --  Sealed Vesper Leather Breastplate
(29150,14107,1,1,0,294000), --  Sealed Vesper Tunic
(29150,14108,1,1,4,294000), --  Sealed Vesper Gaiters
(29150,14109,1,1,4,294000), --  Sealed Vesper Gauntlet
(29150,14110,1,1,4,294000), --  Sealed Vesper Boots
(29150,14111,1,1,4,294000), --  Sealed Vesper Shield
(29150,14112,1,1,5,294000), --  Sealed Vesper Leather Leggings
(29150,14113,1,1,5,294000), --  Sealed Vesper Leather Gloves
(29150,14114,1,1,5,294000), -- Sealed Vesper Leather Boots
(29150,14115,1,1,0,294000), --  Sealed Vesper Stockings
(29150,14116,1,1,0,294000), --  Sealed Vesper Gloves
(29150,14160,1,1,6,350000), --  Sealed Vesper Earring
(29150,14162,1,1,6,350000), --  Sealed Vesper Ring
(29150,14161,1,1,6,300000), --  Sealed Vesper Necklace
(29150,10552,1,1,7,300000), --  Forgotten Scroll - Fighter's Will
(29150,10553,1,1,7,300000), --  Forgotten Scroll - Archer's Will
(29150,14219,1,1,7,300000), --  Forgotten Scroll - Magician's Will
(29150,13893,1,1,8,100000); --  Sealed Holy Spirit's Cloak
-- 
REPLACE INTO `droplist` VALUES
(22422,57,7033,14107,0,700000),
(22422,1876,1,1,2,148014),
(22422,1345,40,120,2,123346),
(22422,1873,2,6,2,59206),
(22422,1868,18,54,2,41115),
(22422,1895,3,9,2,30207),
(22422,4042,1,1,2,12334),
(22422,5480,1,1,1,6643),
(22422,5481,1,1,1,6643),
(22422,9599,1,1,100,616700),
(22422,9551,1,1,200,5921),
(22422,960,1,1,2,296),
(22422,5323,1,1,1,45),
(22422,5320,1,1,1,45),
(22422,4042,1,1,-1,200313),
(22422,6689,1,1,-1,25489),
(22422,959,1,1,-1,481);
