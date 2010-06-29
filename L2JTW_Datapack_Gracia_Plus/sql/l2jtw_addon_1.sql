/************ Made in Taiwan ************/

/************ �R���۩w��NPC ************/
DELETE FROM `spawnlist` WHERE `id` > 820000 AND `id` < 880000;


/************ �ץ�32007�[����-�����|�� ************/
INSERT INTO `spawnlist` VALUES ('820001', '', '1', '32007', '140967', '-123600', '-1905', '0', '0', '11829', '60', '0', '0');
UPDATE `npc` SET `type` = 'L2Fisherman' WHERE `id` IN (32007);
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
UPDATE `armor` SET `skill` = '3263-1;' WHERE `item_id` IN (9177,9178,9179,9180,9181,9182,9183,10621,10625,10629);
UPDATE `armor` SET `skill` = '3264-1;' WHERE `item_id` IN (9184,9185,9186,9187,9188,9189,9190,10620,10624,10628,14753,14756,14759,14762);
UPDATE `armor` SET `skill` = '3265-1;' WHERE `item_id` IN (9191,9192,9193,9194,9195,9196,9197,10623,10627,10631,14754,14757,14760,14763);
UPDATE `armor` SET `skill` = '3266-1;' WHERE `item_id` IN (9198,9199,9200,9201,9202,9203,9204,9890,9891,9892,9893,9894,9895,9896,10622,10626,10630,14755,14758,14761,14764);
UPDATE `armor` SET `skill` = '21005-3;' WHERE `item_id` IN (20016);
UPDATE `armor` SET `skill` = '21006-1;21007-1;' WHERE `item_id` IN (20018);
UPDATE `armor` SET `skill` = '21004-1;' WHERE `item_id` IN (20019);


/************ �W�[/�ץ�/�R��NPC ************/
UPDATE `npc` SET `collision_radius` = '13.5', `collision_height` = '36.5' WHERE `id` IN (27323); -- �ץ������K��(���ȩǪ�)
UPDATE `npc` SET `type` = 'L2VillageMaster' WHERE `id` IN (32191); -- �ץ��~�R�Y  �v�v��NPC����
UPDATE `npc` SET `type` = 'L2Adventurer' WHERE `id` IN (32074); -- �ץ��j�|�B���|����NPC����
UPDATE `npc` SET `type` = 'L2Npc', `collision_radius` = '9', `collision_height` = '16.5', `rhand` = '0' WHERE `id` IN (35417,35418); -- �ץ��a���u���H
UPDATE `spawnlist` SET `npc_templateid` = '35440' WHERE `id` = 33771; -- �ץ�NPC ID:������(�ھڦa�u���H)
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (30880,30881,30882,30883,30884,30885,30886,30887,30888,30889); -- �R�����s�b��NPC
UPDATE `droplist` SET `mobId` = '21070' WHERE `mobId` IN (21071); -- �ʦL�j�Ѩ�

-- �[�J���L�R�޲z��
REPLACE INTO `spawnlist` VALUES
('810001', '', '1', '32478', '17735', '169802', '-3495', '0', '0', '19465', '60', '0', '0'); -- �y�H����

-- �ץ�NPC��m
REPLACE INTO `spawnlist` VALUES
('33472', 'oren16_npc2218_016', '1', '31605', '85692', '16400', '-2803', '0', '0', '38000', '60', '0', '0'),   -- �����p(�H����)
('33485', 'oren17_npc2219_009', '1', '30676', '81655', '54737', '-1509', '0', '0', '24576', '60', '0', '0'),   -- �wù��(�ڷ�ܮw)
('33594', 'innadril09_npc2324_23', '1', '31092', '114486', '217413', '-3631', '0', '0', '0', '60', '0', '0'),  -- �]�I���a�U�ӤH(���W����������)
('33613', 'aden17_npc2317_01', '1', '31675', '111186', '-13261', '-1702', '0', '0', '13828', '60', '0', '0'),  -- ���J�S �� �w��J(��Ҧu�ƶ�����)
('33614', 'aden17_npc2317_02', '1', '31679', '111532', '-17238', '-1702', '0', '0', '49586', '60', '0', '0'),  -- �״��S�� �� ���(���ĵ�ƶ�����)
('33628', 'aden17_npc2317_03', '1', '31677', '111532', '-13266', '-1704', '0', '0', '14508', '60', '0', '0'),  -- ��Ҧu�ƶ���
('33635', 'aden17_npc2317_03', '1', '31677', '111178', '-17234', '-1702', '0', '0', '46468', '60', '0', '0'),  -- ��Ҧu�ƶ���
('51231', 'schuttgart', '1', '30767', '85792', '-142809', '-1341', '0', '0', '10508', '60', '0', '0'),         -- ���޲z��(�ץ[�S����)
('51232', 'schuttgart', '1', '35558', '89344', '-141591', '-1541', '0', '0', '64817', '60', '0', '0');         -- ����޲z��(�ץ[�S����)

-- �[�J�|����NPC
INSERT INTO `spawnlist` VALUES
('820002', '', '1', '35644', '116178', '-181602', '-1365', '0', '0', '0', '60', '0', '0'),      -- ����޲z��(�G�H����)
('820003', '', '1', '35645', '-44159', '-112229', '-239', '0', '0', '39768', '60', '0', '0'),   -- ����޲z��(�b�~�H����)
('820004', '', '1', '32321', '147271', '28647', '-2268', '0', '0', '53514', '60', '0', '0'),    -- �D��򤶰�(�ȤB����)
('820005', '', '1', '32071', '84432', '-144032', '-1538', '0', '0', '8764', '60', '0', '0'),    -- �Y�F(�ץ[�S����)
('820006', '', '1', '31691', '86123', '-145764', '-1292', '0', '0', '0', '60', '0', '0'),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('820007', '', '1', '31691', '86123', '-145628', '-1295', '0', '0', '0', '60', '0', '0'),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('820008', '', '1', '31691', '86123', '-145492', '-1292', '0', '0', '0', '60', '0', '0'),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('820009', '', '1', '31691', '86123', '-145356', '-1292', '0', '0', '0', '60', '0', '0'),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('820010', '', '1', '31691', '86123', '-145220', '-1292', '0', '0', '0', '60', '0', '0'),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('820011', '', '1', '31691', '86315', '-145764', '-1292', '0', '0', '0', '60', '0', '0'),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('820012', '', '1', '31691', '86315', '-145628', '-1292', '0', '0', '0', '60', '0', '0'),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('820013', '', '1', '31691', '86315', '-145492', '-1295', '0', '0', '0', '60', '0', '0'),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('820014', '', '1', '31691', '86315', '-145356', '-1292', '0', '0', '0', '60', '0', '0'),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('820015', '', '1', '31691', '86315', '-145220', '-1292', '0', '0', '0', '60', '0', '0'),       -- �V�m�ί�H(�ץ[�S�����Ԥh���|)
('820016', '', '1', '32119', '23707', '-19108', '-2815', '0', '0', '37776', '60', '0', '0'),    -- �Q�| �Ͳ�
('820017', '', '1', '32120', '27716', '-11685', '-2281', '0', '0', '31470', '60', '0', '0'),    -- �ھ| �Ͳ�
('820018', '', '1', '32121', '18714', '-9635', '-2790', '0', '0', '54407', '60', '0', '0'),     -- �ʤ� �Ͳ�
('820019', '', '1', '32109', '23666', '-7144', '-1134', '0', '0', '46433', '60', '0', '0'),     -- �u�Y�t��
('820020', '', '1', '35601', '141085', '-124316', '-1868', '0', '0', '44789', '60', '0', '0'),  -- �u���H(�i�m�u�ھڦa)
('820021', '', '1', '35601', '141152', '-124272', '-1864', '0', '0', '10000', '60', '0', '0'),  -- �u���H(�i�m�u�ھڦa)
('820022', '', '1', '35602', '140704', '-124020', '-1904', '0', '0', '34000', '60', '0', '0'),  -- �u���H(�i�m�u�ھڦa)
('820023', '', '1', '35602', '140732', '-123796', '-1904', '0', '0', '2000', '60', '0', '0'),   -- �u���H(�i�m�u�ھڦa)
('820024', '', '1', '35603', '152924', '-126604', '-2304', '0', '0', '33000', '60', '0', '0'),  -- �J���޲z��(�i�m�u�ھڦa)
('820025', '', '1', '35604', '143944', '-119196', '-2136', '0', '0', '1000', '60', '0', '0'),   -- �ǥO(�i�m�u�ھڦa)
('820026', '', '1', '35605', '140824', '-124844', '-1864', '0', '0', '10000', '60', '0', '0'),  -- �w��S ����(�i�m�u�ھڦa)
('820027', '', '1', '35623', '59884', '-94204', '-1344', '0', '0', '27000', '60', '0', '0'),    -- �����u���H(���~�A���ھڦa)
('820028', '', '1', '35624', '59920', '-94336', '-1344', '0', '0', '60000', '60', '0', '0'),    -- �����u���H(���~�A���ھڦa)
('820029', '', '1', '35625', '55184', '-93040', '-1360', '0', '0', '35000', '60', '0', '0'),    -- �~���u���H(���~�A���ھڦa)
('820030', '', '1', '35626', '55400', '-93008', '-1360', '0', '0', '30000', '60', '0', '0'),    -- �~���u���H(���~�A���ھڦa)
('820031', '', '1', '35627', '53508', '-93776', '-1584', '0', '0', '36000', '60', '0', '0'),    -- �ǥO(���~�A���ھڦa)
('820032', '', '1', '35628', '60880', '-94320', '-1344', '0', '0', '27000', '60', '0', '0'),    -- ����� �A���޲z��(���~�A���ھڦa)
('820033', '', '1', '35638', '56736', '-26400', '568', '0', '0', '49000', '60', '0', '0'),      -- �ڭ۴� ���s�޲z��
('820034', '', '1', '35639', '58128', '-32000', '296', '0', '0', '0', '60', '0', '0'),          -- �ǥd�w �ǥO
('820035', '', '1', '35640', '58024', '-25744', '592', '0', '0', '49000', '60', '0', '0'),      -- �Z�wù ����
('820036', '', '1', '35641', '58080', '-29552', '568', '0', '0', '49000', '60', '0', '0'),      -- �n��u���H
('820037', '', '1', '35641', '58137', '-29223', '568', '0', '0', '16500', '60', '0', '0'),      -- �n��u���H
('820038', '', '1', '35642', '58024', '-26456', '592', '0', '0', '49000', '60', '0', '0'),      -- �n��u���H
('820039', '', '1', '35642', '58074', '-26325', '597', '0', '0', '15732', '60', '0', '0');      -- �n��u���H

-- �[�J�a�U�v�޳����J���޲z��
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (32377); -- �R���a�U�v�޳����ƪ��J���޲z��
UPDATE `npc` SET `type` = 'L2Teleporter' WHERE `id` IN (32503); -- �J���޲z�� �_�p�𪺴���
INSERT INTO `spawnlist` VALUES
('830001', '', '1', '32491', '-82166', '-49176', '-10341', '0', '0', '31175', '60', '0', '0'),  -- �a�U�v�޳��U��
('830002', '', '1', '32503', '-70661', '-71066', '-1419', '0', '0', '49151', '60', '0', '0'),   -- �J���޲z�� �_�p�𪺴���
('830003', '', '1', '32513', '-84640', '-45360', '-10728', '0', '0', '56156', '60', '0', '0'),  -- ��     �J���޲z��
('830004', '', '1', '32514', '-77408', '-50656', '-10728', '0', '0', '29664', '60', '0', '0'),  -- �𨽯� �J���޲z��
('830005', '', '1', '32515', '-81904', '-53904', '-10728', '0', '0', '17044', '60', '0', '0'),  -- �Q��   �J���޲z��
('830006', '', '1', '32516', '-86359', '-50593', '-10728', '0', '0', '3704', '60', '0', '0'),   -- �d�B�� �J���޲z��
('830007', '', '1', '32377', '-79117', '-45433', '-10731', '0', '0', '40959', '60', '0', '0');  -- �w��   �J���޲z��

-- �[�J���ʨ�_�p�𪺴���/�U���Ū��a�U�v�޳��~��
REPLACE INTO `teleport` VALUES
('Fantasy Isle -> Underground Coliseum', '12060', '-82271', '-49196', '-10352', '0', '0', '57'),
('Underground Coliseum -> Underground Coliseum LV40', '3249140', '-84451', '-45452', '-10728', '0', '0', '57'),
('Underground Coliseum -> Underground Coliseum LV50', '3249150', '-86154', '-50429', '-10728', '0', '0', '57'),
('Underground Coliseum -> Underground Coliseum LV60', '3249160', '-82009', '-53652', '-10728', '0', '0', '57'),
('Underground Coliseum -> Underground Coliseum LV70', '3249170', '-77586', '-50503', '-10728', '0', '0', '57'),
('Underground Coliseum -> Underground Coliseum LV00', '3249100', '-79309', '-45561', '-10728', '0', '0', '57');

-- �[�J�a����ɪ�NPC (�P�� pmq ����)
REPLACE INTO spawnlist VALUES
('850001', '', 1, 18466, 4681, 243922, -1930, 0, 0, 37373, 10, 0, 0),    -- �~��ĵ�ö���
('850002', '', 1, 22326, -23961, 245615, -3138, 0, 0, 129600, 10, 0, 0), -- ���Y�ǧJ
('850003', '', 1, 32344, 13278, 282253, -9705, 0, 0, 49686, 10, 0, 0),   -- ���I�O��
('850004', '', 1, 32302, 13219, 282021, -7547, 0, 0, 50484, 10, 0, 0),   -- ��}
('850005', '', 1, 32373, 17938, 283202, -9700, 0, 0, 9914, 10, 0, 0);    -- �h�Q�w

REPLACE INTO `npc` VALUES
(22326, 22326, 'Hellinark', 0, 'Guardian of Naia', 0, 'LineageMonster.karik', 19.00, 90.00, 84, 'male', 'L2Monster', 60, 465488, 4355, 202.00, 10.00, 64, 66, 68, 62, 61, 58, 2629657, 267913, 28564, 3856, 12487, 5647, 590, 0, 3819, 0, 0, 0, 0, 40, 290, 0, 13, 'FULL_PARTY', 'false'),
(32362, 32362, 'Hellbound Native', 0, '', 0, 'LineageNPC.a_common_peopleC_Mhuman', 8.00, 23.50, 1, 'male', 'L2Npc', 40, 2444, 2444, 0.00, 0.00, 10, 10, 10, 10, 10, 10, 0, 0, 500, 500, 500, 500, 253, 0, 253, 0, 0, 0, 0, 80, 120, 0, 0, 'LAST_HIT', 'false');
REPLACE INTO `minions` VALUES (22448, 22451, 2, 2); -- �p�ڹF�� �ϧܭx�����x
REPLACE INTO `minions` VALUES (22449, 22450, 8, 8); -- ���ڤh�d�� ���ݱM�a

                                  
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
REPLACE INTO `grandboss_data` VALUES (29045, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `npc` VALUES ('18328', '18328', 'Hall Alarm Device', '0', '', '0', 'NPC.grave_keeper_key', '8.00', '21.00', '80', 'male', 'L2Monster', '80', '1264000', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '0', '333', '0', '0', '0', '0', '0', '0', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('18329', '18329', 'Hall Keeper Captain', '0', '', '0', 'Monster.death_lord', '21.00', '40.00', '80', 'male', 'L2Monster', '80', '23582', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '78', '0', '0', '0', '88', '132', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('18330', '18330', 'Hall Keeper Wizard', '0', '', '0', 'Monster.vale_master', '12.00', '40.00', '80', 'male', 'L2Monster', '80', '18203', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '326', '0', '0', '0', '88', '132', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('18331', '18331', 'Hall Keeper Guard', '0', '', '0', 'Monster.death_knight', '12.00', '29.00', '80', 'male', 'L2Monster', '80', '18655', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '142', '0', '0', '0', '88', '132', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('18332', '18332', 'Hall Keeper Patrol', '0', '', '0', 'Monster.headless_knight', '21.00', '31.00', '80', 'male', 'L2Monster', '80', '18434', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '70', '0', '0', '0', '88', '132', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('18333', '18333', 'Hall Keeper Suicidal Soldier', '0', '', '0', 'Monster3.self_blaster', '20.00', '23.00', '80', 'male', 'L2Monster', '80', '18203', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '0', '0', '0', '0', '88', '132', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('18334', '18334', 'Dark Choir Captain', '0', '', '0', 'Monster2.erinyes_cmd', '21.00', '50.00', '85', 'male', 'L2Monster', '80', '24069', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '0', '333', '0', '0', '0', '0', '0', '0', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('18335', '18335', 'Dark Choir Prima Donna', '0', '', '0', 'Monster3.portrait_spirit', '11.00', '30.00', '80', 'male', 'L2Monster', '80', '18655', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '0', '0', '0', '0', '88', '132', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('18336', '18336', 'Dark Choir Lancer', '0', '', '0', 'Monster.death_blader', '15.00', '45.00', '80', 'male', 'L2Monster', '80', '18655', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '1472', '0', '0', '0', '88', '132', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('18337', '18337', 'Dark Choir Archer', '0', '', '0', 'Monster.skeleton_archer_20_bi', '13.00', '33.00', '80', 'male', 'L2Monster', '80', '18655', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '279', '0', '0', '0', '88', '132', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('18338', '18338', 'Dark Choir Witch Doctor', '0', '', '0', 'Monster3.portrait_spirit_winged', '11.00', '30.00', '80', 'male', 'L2Monster', '80', '13991', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '500', '333', '0', '0', '0', '0', '88', '132', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('18339', '18339', 'Dark Choir Player', '0', '', '0', 'Monster.skeleton', '11.00', '25.00', '80', 'male', 'L2Monster', '80', '18203', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '440000', '40000', '9000', '5000', '6000', '6000', '300', '0', '333', '148', '103', '0', '0', '88', '132', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('29045', '29045', 'Frintezza', '0', '', '0', 'Monster3.frintessa', '10.00', '42.00', '90', 'male', 'L2GrandBoss', '0', '23480000', '22197', '830.62', '3.09', '40', '43', '30', '21', '20', '10', '0', '0', '9182', '6214', '7133', '4191', '253', '0', '333', '0', '0', '0', '0', '1', '1', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('29046', '29046', 'Scarlet van Halisha', '0', '', '0', 'Monster3.follower_of_frintessa', '29.00', '90.00', '85', 'male', 'L2GrandBoss', '50', '23480000', '22393', '823.48', '2.65', '60', '57', '73', '76', '70', '80', '0', '0', '10699', '5036', '5212', '4191', '278', '6000', '3819', '8204', '0', '0', '0', '55', '132', '0', '0', 'FULL_PARTY', 'false');
REPLACE INTO `npc` VALUES ('29047', '29047', 'Scarlet van Halisha', '0', '', '0', 'Monster3.follower_of_frintessa_tran', '29.00', '110.00', '90', 'male', 'L2GrandBoss', '60', '23480000', '22393', '830.62', '3.09', '70', '67', '73', '79', '70', '80', '496960259', '40375148', '23813', '7000', '12680', '6238', '409', '6000', '3819', '8222', '0', '0', '0', '92', '187', '0', '14', 'FULL_PARTY', 'false');
REPLACE INTO `npc` VALUES ('29048', '29048', 'Evil Spirit', '0', '', '0', 'Monster3.Evilate', '20.00', '56.00', '87', 'male', 'L2Monster', '70', '350000', '9999', '414.12', '3.09', '40', '43', '30', '21', '20', '10', '30', '2', '9000', '2350', '7133', '2045', '253', '6000', '333', '0', '0', '0', '0', '0', '0', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('29049', '29049', 'Evil Spirit', '0', '', '0', 'Monster3.Evilate', '20.00', '56.00', '87', 'male', 'L2Monster', '70', '350000', '9999', '414.12', '3.09', '40', '43', '30', '21', '20', '10', '30', '2', '9000', '2350', '7133', '2045', '253', '6000', '333', '0', '0', '0', '0', '0', '0', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('29050', '29050', 'Breath of Halisha', '0', '', '0', 'Monster3.portrait_spirit', '10.00', '20.00', '85', 'male', 'L2Monster', '40', '350000', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '30', '2', '9000', '2350', '7133', '2045', '253', '6000', '333', '0', '0', '0', '0', '55', '66', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('29051', '29051', 'Breath of Halisha', '0', '', '0', 'Monster3.portrait_spirit_winged', '10.00', '20.00', '85', 'male', 'L2Monster', '40', '350000', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '30', '2', '9000', '2350', '7133', '2045', '253', '6000', '333', '0', '0', '0', '0', '55', '66', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('29052', '29052', '', '0', '', '0', 'Monster3.Organ_Dummy', '1.00', '1.00', '99', 'male', 'L2Npc', '40', '400000', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '0', '0', '9000', '5000', '6000', '6000', '300', '0', '333', '0', '0', '0', '0', '88', '132', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('29053', '29053', '', '0', '', '0', 'Monster3.Follower_Dummy', '1.00', '1.00', '99', 'male', 'L2Npc', '40', '400000', '9999', '13.43', '3.09', '40', '43', '30', '21', '20', '10', '0', '0', '9000', '5000', '6000', '6000', '300', '0', '333', '0', '0', '0', '0', '88', '132', '0', '0', 'LAST_HIT', 'false');
REPLACE INTO `npc` VALUES ('29061', '29061', 'Teleportation Cubic', '0', '', '0', 'NPC.teleport_npc_frin', '40.00', '80.00', '70', 'male', 'L2Teleporter', '40', '2444', '2444', '0.00', '0.00', '10', '10', '10', '10', '10', '10', '0', '0', '500', '500', '500', '500', '278', '0', '333', '0', '0', '0', '0', '88', '132', '0', '0', 'LAST_HIT', 'false');
DELETE FROM `npcskills` Where `skillid` IN (5014,5015,5016,5017,5018,5019);
REPLACE INTO `npcskills` VALUES
(29050,5010,1),
(29050,5013,1),
(29051,5009,1),
(29051,5013,1);
DELETE FROM `zone_vertices` WHERE `id` IN (12011);
REPLACE INTO `zone_vertices` (`id`,`order`,`x`,`y`) VALUES
(12011,0,172229,-74350),
(12011,1,176241,-90230);


/************ ��L�ץ� ************/
-- �ץ��ǰe�줣�P���ж��D�Բ�����/�ȯ�
REPLACE INTO `teleport` VALUES
('Disciples Necropolis -> Anakim',449,184467,-13102,-5500,0,0,57),
('Disciples Necropolis -> Lilith',450,184448,-10120,-5500,0,0,57);

-- �ץ��𫰮ɶ�
ALTER TABLE `castle` DROP PRIMARY KEY, ADD PRIMARY KEY (`id`);
UPDATE `castle` SET `siegeDate` = '978782400000' WHERE `siegeDate` = '0' AND `id` IN (1,2,5,8,9);
UPDATE `castle` SET `siegeDate` = '979459200000' WHERE `siegeDate` = '0' AND `id` IN (3,4,6,7);

-- �ץ��_����f���ǰe����
UPDATE `teleport` SET `price` = '5200' WHERE `id` IN (63);
UPDATE `teleport` SET `price` = '7100' WHERE `id` IN (107);

-- �ץ��y���۪��D������
UPDATE `etcitem` SET `item_type` = 'none' WHERE `item_id` IN (8764);

-- �ץ�����
UPDATE `etcitem` SET `price` = '1550000' WHERE `item_id` = '729';  -- �Z���j�ƨ��b-A��
UPDATE `etcitem` SET `price` = '2250000' WHERE `item_id` = '959';  -- �Z���j�ƨ��b-S��
UPDATE `etcitem` SET `price` = '2700000' WHERE `item_id` = '6569'; -- ���֪��Z���j�ƨ��b-A��
UPDATE `etcitem` SET `price` = '5000000' WHERE `item_id` = '6577'; -- ���֪��Z���j�ƨ��b-S��

-- �ץ����⭫�ͮɡAHP/MP���� (�P�� wolo ����)
Update `npc`, `raidboss_spawnlist` SET `raidboss_spawnlist`.`heading`=0, `raidboss_spawnlist`.`currentHp`=`npc`.`hp`,`raidboss_spawnlist`.`currentMp`=`npc`.`mp` WHERE `npc`.`type`='L2RaidBoss' AND `npc`.`id`=`raidboss_spawnlist`.`boss_id`;

-- �ץ��ھڦa��л�
UPDATE `auction` SET `startingBid` = '20000000' WHERE `id` IN (58,59,60,61) AND `sellerId` = '0';

-- �ץ��Z��
UPDATE `weapon` SET `onCrit_skill_chance` = '100' WHERE `item_id` in (4694,4789,4795,4804,4807,5604,5646,6308,8104,8105,8125,8128,8811,9254,9282,9287,9321,9347);
UPDATE `weapon` SET `onCrit_skill_chance` = '6' WHERE `item_id` in (4781);
UPDATE `weapon` SET `onCrit_skill_chance` = '7' WHERE `item_id` in (4775);
UPDATE `weapon` SET `onCrit_skill_chance` = '9' WHERE `item_id` in (4760,4766);
UPDATE `weapon` SET `onCrit_skill_chance` = '12' WHERE `item_id` in (4805);
UPDATE `weapon` SET `onCrit_skill_chance` = '14' WHERE `item_id` in (4796,4801);
UPDATE `weapon` SET `onCrit_skill_chance` = '17' WHERE `item_id` in (4790);
UPDATE `weapon` SET `onCrit_skill_chance` = '25' WHERE `item_id` in (4859);
UPDATE `weapon` SET `onCrit_skill_chance` = '27' WHERE `item_id` in (4856);
UPDATE `weapon` SET `onCrit_skill_chance` = '29' WHERE `item_id` in (4852);
UPDATE `weapon` SET `onCrit_skill_chance` = '31' WHERE `item_id` in (4847,4849);
UPDATE `weapon` SET `onCrit_skill_chance` = '32' WHERE `item_id` in (4843);
UPDATE `weapon` SET `onCrit_skill_chance` = '34' WHERE `item_id` in (4835,4838,4840);
UPDATE `weapon` SET `onCast_skill_chance` = '50' WHERE `item_id` in (4865,4877,4889,4898);
UPDATE `weapon` SET `skill` = '3260-1;3261-1;3262-1;' WHERE `item_id` in (9140,9141);


/************ �[�J�}����Ҫ��D�� ************/
-- �s�Y��
DELETE FROM `etcitem` WHERE `item_id` IN (20497,20498); -- ���˪����� (L2J���~�]�w��etcitem)
REPLACE INTO `armor` VALUES
(20497,'Mother\'s Wreath - Event Blessing of Love - 24 hours limited period','','hairall','false','none',120,'wood','none',0,-1,1440,0,0,0,0,0,'false','false','true','false','true','0-0','21086-1;'), -- ���˪�����-���� �R������(����24�p��)
(20498,'Mother\'s Wreath Blessing of Love - 3 day limited period','','hairall','false','none',120,'wood','none',0,-1,4320,0,0,0,0,0,'false','false','true','false','true','0-0','21086-1;'); -- ���˪�����-���� �R������(����3��)

-- �ץ�NPC
UPDATE `npc` SET `type` = 'L2Npc' WHERE `id` IN (32628,32629); -- �X�Y���ާL�������אּ�@��NPC
UPDATE `npc` SET `type` = 'L2Teleporter' WHERE `id` IN (32540,32542,32602); -- �`�W���u���H/�w�w���A�ͺؤl/�{�ɶǰe�v�������אּ�ǰe
UPDATE `spawnlist` SET `heading` = '16383' WHERE `npc_templateid` = '32609' AND `heading` = '20771'; -- �ץ����Ÿ�����˸m�����V

-- �s�ǰe
REPLACE INTO `teleport` VALUES
('3254001', '3260203', '-212836', '209824', '4288', '0', '0', '57'),   -- �`�W���u���H
('3260201', '3260201', '-245833', '220174', '-12104', '0', '0', '57'), -- �{�ɶǰe�v
('3260202', '3260202', '-251624', '213420', '-12072', '0', '0', '57'), -- �{�ɶǰe�v
('3260203', '3260203', '-249774', '207316', '-11952', '0', '0', '57'); -- �{�ɶǰe�v

-- NPC�令AI����
Delete From `spawnlist` Where `npc_templateid` in (32549,32619,32628,32629); -- �f���ڴ�/��j�L/�X�Y���ާL

-- ����ץ�
UPDATE `armor` SET `armor_type` = 'heavy' WHERE `item_id` IN (9821,9831,10019,10020); -- �۶H�˳�-���}����/�i���������Բ���/��l�ݥ�/���K�H��
UPDATE `armor` SET `armor_type` = 'light' WHERE `item_id` IN (9824,9834,10021,10022); -- �۶H�˳�-���}§�A/�i����������§�A/�������Ũ�m/��������H��
UPDATE `armor` SET `armor_type` = 'magic' WHERE `item_id` IN (9827,9837,10023,10024); -- �۶H�˳�-���}���T/�i���������Ԫ��T/���A�G���~��/���A�G������
UPDATE `armor` SET `time` = 0 WHERE `item_id` IN (20098); -- §�A-���� 1�p�ɤ۶H
UPDATE `armor` SET `time` = 43200 WHERE `item_id` IN (13544,13545); -- ����l����N-�k�ͮ��}��/����l����N-�k�ͮ��}��
UPDATE `armor` SET `time` = 43200 WHERE `item_id` IN (20503,20504); -- ���O��l/�]�T�����M�����N ����30�� (L2J���~�]�w��etcitem)
UPDATE `armor` SET `duration` = 360 WHERE `item_id` IN (14753,14754,14755,14756,14757,14758,14759,14760,14761,14762,14763,14764); -- �۶H�˳�

-- �Z���ץ�
UPDATE `weapon` SET `bodypart` = 'rhand' WHERE `item_id` IN (13556,13557,20114,20126,20128,20140,20142,20154,20156,20168,20170,20258,20264); -- ���Ÿ��ޱ���/���Ÿ��j��/���q�v��-����/�]�e�v��-����/��k��-����/�u���ԩ�-����/�d�ʤڥ�����-����/�ֶ�-����/���s����-����/�ȪZ������-����/�����v��-����/�k���ѥ]�R�q��/�k���ѥ]����/
UPDATE `weapon` SET `bodypart` = 'lrhand', `weaponType` = 'bigblunt' WHERE `item_id` IN (9819,13530,13531,13532,13533,13534,13535,13536,13537,13538);  -- �����X�m/�j�|�B�X�m/�f���X�m/�_���X�m/�ڷ�X�m/�ȤB�X�m/�]�Ǳo�ߺX�m/���F�S�X�m/�|�]�X�m/�ץ[�S�X�m
UPDATE `weapon` SET `bodypart` = 'lrhand', `weaponType` = 'bigblunt' WHERE `item_id` IN (13539,13560,13561,13562,13563,13564,13565,13566,13567,13568);  -- �j�v�E�q���]��/�j�|�B �u�@����/�f�� �u�@����/�_�� �u�@����/�ڷ� �u�@����/�ȤB �u�@����/�]�Ǳo�� �u�@����/���F�S �u�@����/�|�] �u�@����/�ץ[�S �u�@����
UPDATE `weapon` SET `bodypart` = 'lrhand', `weaponType` = 'bigblunt' WHERE `item_id` IN (13809,13981); -- �c���]�k�v���]�k��/�Ǫ���(�s���x�԰��L)
UPDATE `weapon` SET `weaponType` = 'none' WHERE `item_id` IN (13525); -- ��Ǧ�Ȥh�L�޵P

-- ��L���~�ץ�
Delete From `items` Where (`item_id` > 708 and `item_id` < 725); -- �M����P�W�٪���L���~
UPDATE `etcitem` SET `consume_type` = 'normal' WHERE `item_id` IN (731,732,949,950,953,954,957,958,961,962); -- �Z���j�Ƶ������b/����j�Ƶ������b
UPDATE `etcitem` SET `consume_type` = 'normal' WHERE `item_id` IN (10117,10118); -- ���P���ʦL�����²ŦL/���P�� ���²ŦL
UPDATE `etcitem` SET `consume_type` = 'normal' WHERE `item_id` IN (10414,10607,13382); -- ����洫��/����ʦL���N-�G��/�����֪�§��-���ʥ�
UPDATE `etcitem` SET `consume_type` = 'stackable' WHERE `item_id` IN (13420,13421,20025,20026,20027,20028,20033); -- �I��/�J�|/�ۥѶǰe���b/�l�[�J����-����(�`�W���U)/�l�[�J����-��t����/�l�[�J����-����(�`�W�g�c)/�ۥѶǰe�X
UPDATE `etcitem` SET `time` = 1440 WHERE `item_id` IN (20320); -- �ͤ�J�|
UPDATE `etcitem` SET `time` = 10080 WHERE `item_id` IN (20339,20340,20345,20346,20351,20352); -- �g��ȥj��/SP�j��/�������j��
UPDATE `etcitem` SET `time` = 21600 WHERE `item_id` IN (20190); -- ���H�`�˹��~
UPDATE `etcitem` SET `time` = 43200 WHERE `item_id` IN (13027,14728,20199); -- �����֪�§��/����-�q�۴���/�ڤ۪����H�`�J�|

-- �W�[���~�ĪG
UPDATE `armor` SET `skill` = '3407-1;' WHERE `item_id` = '9900';                               -- �R�����B�٫�
UPDATE `etcitem` SET `skill` = '2309-1;', `handler` = 'ItemSkills' WHERE `item_id` = '9144';   -- �޽�§��
UPDATE `etcitem` SET `skill` = '2422-1;', `handler` = 'ItemSkills' WHERE `item_id` = '10254';  -- 1���_�U
UPDATE `etcitem` SET `skill` = '2423-2;', `handler` = 'ItemSkills' WHERE `item_id` = '10255';  -- 2���_�U
UPDATE `etcitem` SET `skill` = '2424-3;', `handler` = 'ItemSkills' WHERE `item_id` = '10256';  -- 3���_�U
UPDATE `etcitem` SET `skill` = '2425-4;', `handler` = 'ItemSkills' WHERE `item_id` = '10257';  -- 4���_�U
UPDATE `etcitem` SET `skill` = '2426-5;', `handler` = 'ItemSkills' WHERE `item_id` = '10258';  -- 5���_�U
UPDATE `etcitem` SET `skill` = '2427-6;', `handler` = 'ItemSkills' WHERE `item_id` = '10259';  -- 6���_�U
UPDATE `etcitem` SET `skill` = '2487-1;', `handler` = 'ItemSkills' WHERE `item_id` = '10520';  -- �^�n����-�ܤ�¦�
UPDATE `etcitem` SET `skill` = '2670-1;', `handler` = 'ItemSkills' WHERE `item_id` = '13794';  -- �ܨ���-½�u����ܨ����b
UPDATE `etcitem` SET `skill` = '2671-1;', `handler` = 'ItemSkills' WHERE `item_id` = '13795';  -- �ܨ���-½�u����ܨ����b
UPDATE `etcitem` SET `skill` = '2631-1;', `handler` = 'ItemSkills' WHERE `item_id` = '13800';  -- �C���ܨ����b
UPDATE `etcitem` SET `skill` = '2632-1;', `handler` = 'ItemSkills' WHERE `item_id` = '13801';  -- �p���ܨ����b

-- �R���]�k�ѰӤH
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (30840,31262,31413,31414,31415,31416,31417,31421,31422,31423,31424,31425,31426,31427,31429,31430,31431,31666,31667,31670,31951,31973,31980);
DELETE FROM `merchant_buylists` WHERE `shop_id` IN ( SELECT `shop_id` FROM `merchant_shopids` WHERE `npc_id` IN (30840,31262,31413,31414,31415,31416,31417,31421,31422,31423,31424,31425,31426,31427,31429,31430,31431,31666,31667,31670,31951,31973,31980));
DELETE FROM `merchant_shopids` WHERE `npc_id` IN (30840,31262,31413,31414,31415,31416,31417,31421,31422,31423,31424,31425,31426,31427,31429,31430,31431,31666,31667,31670,31951,31973,31980);

-- �R���m��ӤH
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (30990,30994) AND `id` NOT IN (45033);

-- �R���䤤�@����¾�޲z��
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (31756);
-- DELETE FROM `spawnlist` WHERE `npc_templateid` IN (31757);

-- �ץ�/��s����128 ��ԥd-�B�P�����q
UPDATE `etcitem` SET `skill` = '2150-1;', `handler` = 'SoulShots', `item_type` = 'shot', `crystal_type` = 'd' WHERE `item_id` = 13037;
UPDATE `etcitem` SET `skill` = '2153-1;', `handler` = 'SoulShots', `item_type` = 'shot', `crystal_type` = 'a' WHERE `item_id` = 13045;
UPDATE `etcitem` SET `skill` = '2153-1;', `handler` = 'SoulShots', `item_type` = 'shot', `crystal_type` = 'a' WHERE `item_id` = 13055;
UPDATE `weapon` SET `skill` = '0-0;' WHERE `item_id` = 13042;
UPDATE `npc` SET `collision_radius` = 28, `collision_height` = 20, `level` = 61, `hp` = 3450, `mp` = 1365, `patk` = 991, `pdef` = 415, `matk` = 504, `mdef` = 388, `runspd` = 187 WHERE `id` = 14916;
UPDATE `npc` SET `collision_radius` = 28, `collision_height` = 20, `level` = 70, `hp` = 4025, `mp` = 1592, `patk` = 1156, `pdef` = 484, `matk` = 588, `mdef` = 452, `runspd` = 187 WHERE `id` = 14917;

DELETE FROM `accounts` WHERE `login` = 'l2jtwdev';
DELETE FROM `characters` WHERE `account_name` = 'l2jtwdev';


/************ CT 2.5 �t�l�ϩR�ץ� ************/
-- ���O�אּ�q��,���A����/��/�k/��Ѩ�
UPDATE `items` SET `item_id` = 13687 WHERE `item_id` IN (13688,13689,13690); -- ��/�k/��ѨϪ��M�h���O��q�Τ��O
UPDATE `items` SET `item_id` = 13890 WHERE `item_id` IN (13889,13891,13892); -- ��/�k/��ѨϪ��t�F���O��q�Τ��O
UPDATE `items` SET `item_id` = 14609 WHERE `item_id` IN (14601,14602,14608,14610); -- ��/�k/��ѨϪ��j�N���O��q�Τ��O
DELETE FROM `merchant_buylists` WHERE `item_id` IN (13688,13689,13690,13889,13891,13892,14601,14602,14608,14610); -- �R����/�k/��ѨϪ����O���c��

-- �s�ǰe
REPLACE INTO `teleport` VALUES
('3265201', '3265201', '175499', '-181586', '-904', '0', '0', '57'); -- ���̯����q�s���ǰe����

-- �s�Y��
UPDATE `armor` SET `skill` = '21090-1;' WHERE `item_id` = 20601;         -- �^��U
UPDATE `armor` SET `skill` = '21092-1;' WHERE `item_id` = 20613;         -- �վ�
UPDATE `armor` SET `skill` = '21093-1;' WHERE `item_id` = 20614;         -- �վ�
UPDATE `armor` SET `skill` = '21094-1;' WHERE `item_id` = 20615;         -- �վ�
UPDATE `armor` SET `skill` = '21092-1;21111-1;' WHERE `item_id` = 20616; -- �վ�
UPDATE `armor` SET `skill` = '21093-1;21112-1;' WHERE `item_id` = 20617; -- �վ�
UPDATE `armor` SET `skill` = '21094-1;21113-1;' WHERE `item_id` = 20618; -- �վ�
UPDATE `armor` SET `skill` = '21095-1;' WHERE `item_id` = 20626;         -- �^��U
UPDATE `armor` SET `skill` = '21096-1;' WHERE `item_id` = 20633;         -- ��ʴU
UPDATE `armor` SET `skill` = '21098-1;' WHERE `item_id` = 20667;         -- �k�Z���U
UPDATE `armor` SET `skill` = '21099-1;' WHERE `item_id` = 20669;         -- �Ѫ�U
UPDATE `armor` SET `skill` = '21100-1;' WHERE `item_id` = 20671;         -- �k���v��
UPDATE `armor` SET `skill` = '21101-1;' WHERE `item_id` = 20673;         -- �_�_�ߺ��U
UPDATE `armor` SET `skill` = '21103-1;' WHERE `item_id` = 20675;         -- �ιοߺ��U
UPDATE `armor` SET `skill` = '21102-1;' WHERE `item_id` = 20677;         -- ���ߺ��U
UPDATE `armor` SET `skill` = '21104-1;' WHERE `item_id` = 20679;         -- �u���H�U
UPDATE `armor` SET `skill` = '21120-1;' WHERE `item_id` = 20711;         -- �ǧJ�n�ʭ���-����
UPDATE `armor` SET `skill` = '21120-1;' WHERE `item_id` = 20723;         -- �����ǧJ�n�ʭ���
UPDATE `armor` SET `skill` = '21120-1;21136-1;' WHERE `item_id` = 20724; -- �����ǧJ�n�ʭ���
UPDATE `armor` SET `skill` = '21137-1;' WHERE `item_id` = 20743;         -- �{ģ����ǩǤH����
UPDATE `armor` SET `skill` = '21138-1;' WHERE `item_id` = 20744;         -- �{ģ�����n�y�s����
UPDATE `armor` SET `skill` = '21139-1;' WHERE `item_id` = 20745;         -- �{ģ��������F����
UPDATE `armor` SET `skill` = '21140-1;' WHERE `item_id` = 20746;         -- �{ģ�������e������
UPDATE `armor` SET `skill` = '21141-1;' WHERE `item_id` = 20747;         -- �{ģ��X235��P����
UPDATE `armor` SET `skill` = '21152-1;' WHERE `item_id` = 20789;         -- ���b���U

-- �s���N
UPDATE `armor` SET `bodypart` = 'lbracelet', `skill` = '8358-1;3267-1;' WHERE `item_id` = 15351;                           -- �ʦL�Ѱ����N-����
UPDATE `armor` SET `bodypart` = 'lbracelet' WHERE `item_id` IN (20658,20659);                                              -- ����ʦL���N-�R�ʩ��B��
UPDATE `armor` SET `skill` = '8464-1;3267-1;' WHERE `item_id` = 17004;                                                     -- ����ʦL���N-�G���_�_
UPDATE `armor` SET `bodypart` = 'lbracelet', `skill` = '21191-1;23171-1;23173-1;3267-1;' WHERE `item_id` = 20941;          -- ��ĳ���ʦL���N-����ӻ�
UPDATE `armor` SET `bodypart` = 'hairall' WHERE `item_id` IN (20942,20944);                                                -- ���W����/���W�ڴU�l

-- �䥦
UPDATE `etcitem` SET `skill` = '2869-1;', `handler` = 'ItemSkills' WHERE `item_id` = 14724;                                -- ����-�N�N���l����b
UPDATE `etcitem` SET `skill` = '2870-1;', `handler` = 'ItemSkills' WHERE `item_id` = 14725;                                -- ����-�W�����l����b
UPDATE `etcitem` SET `skill` = '2880-1;', `handler` = 'ItemSkills' WHERE `item_id` = 14726;                                -- ����-�~�{�N�N���l����b
UPDATE `etcitem` SET `skill` = '2881-1;', `handler` = 'ItemSkills' WHERE `item_id` = 14727;                                -- ����-�~�{�W�����l����b
UPDATE `etcitem` SET `consume_type` = 'stackable' WHERE `item_id` = 20597;                                                 -- �֤k�����F��
UPDATE `etcitem` SET `skill` = '22105-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20707; -- �a��w�l����b
UPDATE `etcitem` SET `skill` = '22106-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20708; -- ���������l����b
UPDATE `etcitem` SET `skill` = '22107-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20709; -- ���w�}�l����b
UPDATE `etcitem` SET `skill` = '22110-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20728; -- �N���ѿO�l���
UPDATE `etcitem` SET `skill` = '22111-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20729; -- �w�y�ѿO�l���
UPDATE `etcitem` SET `skill` = '22112-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20730; -- ��֤ѿO�l���
UPDATE `etcitem` SET `skill` = '22113-1;', `handler` = 'ItemSkills', `consume_type` = 'stackable' WHERE `item_id` = 20731; -- ���w�ѿO�l���
UPDATE `etcitem` SET `consume_type` = 'stackable' WHERE `item_id` IN (20904,20905,20906,20907);                            -- �������/������
UPDATE `etcitem` SET `sellable` = 'true', `dropable` = 'true' WHERE `item_id` IN (20904,20905,20906,20907);                -- �������/������
UPDATE `etcitem` SET `destroyable` = 'true', `tradeable` = 'true' WHERE `item_id` IN (20904,20905,20906,20907);            -- �������/������

-- �s�S��Z��
UPDATE `weapon` SET `skill` = '8357-1;' WHERE `item_id` = 15310;          -- ����ĸt�C
UPDATE `weapon` SET `skill` = '21089-1;' WHERE `item_id` = 20600;         -- �ۻ��
UPDATE `weapon` SET `skill` = '21169-1;23154-1;' WHERE `item_id` = 20867; -- ���Q�ܨ��]��

-- �ץ����B�޲z�����Z��
UPDATE `custom_npc` SET `rhand` = 316 WHERE `id` = 50007;


/************ CT 2.6 �������ץ� ************/
-- �s�j���-���q17.18
REPLACE INTO `etcitem` VALUES
(15541,'Red Soul Crystal - Stage 17','','false','scroll',20,'normal','paper','none',-1,-1,0,0,'true','true','true','true','true','SoulCrystals','0-0;'),
(15542,'Blue Soul Crystal - Stage 17','','false','scroll',20,'normal','paper','none',-1,-1,0,0,'true','true','true','true','true','SoulCrystals','0-0;'),
(15543,'Green Soul Crystal - Stage 17','','false','scroll',20,'normal','paper','none',-1,-1,0,0,'true','true','true','true','true','SoulCrystals','0-0;'),
(15826,'Red Soul Crystal - Stage 18','','false','scroll',20,'normal','paper','none',-1,-1,0,0,'true','true','true','true','true','SoulCrystals','0-0;'),
(15827,'Blue Soul Crystal - Stage 18','','false','scroll',20,'normal','paper','none',-1,-1,0,0,'true','true','true','true','true','SoulCrystals','0-0;'),
(15828,'Green Soul Crystal - Stage 18','','false','scroll',20,'normal','paper','none',-1,-1,0,0,'true','true','true','true','true','SoulCrystals','0-0;'),

-- �s�ͩR��-85.86��
(16160,'Life Stone - level 85','','false','none',2,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','none','0-0;'),
(16161,'Mid-Grade Life Stone - level 85','','false','none',2,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','none','0-0;'),
(16162,'High-Grade Life Stone - level 85','','false','none',2,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','none','0-0;'),
(16163,'Top-Grade Life Stone - level 85','','false','none',2,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','none','0-0;'),
(16164,'Life Stone - level 86','','false','none',2,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','none','0-0;'),
(16165,'Mid-Grade Life Stone - level 86','','false','none',2,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','none','0-0;'),
(16166,'High-Grade Life Stone - level 86','','false','none',2,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','none','0-0;'),
(16167,'Top-Grade Life Stone - level 86','','false','none',2,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','none','0-0;');

-- �s����(�T�Y�s/��ծu�w���y/��ù�w�Q�����y/�Q�G�X�@�y)
REPLACE INTO `armor` VALUES
(20970,'20970','','lbracelet','false','none',150,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','21194-1;23181-1;3267-1;'),
(20983,'20983','','lbracelet','false','none',150,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','21202-1;23201-1;3267-1;'),
(20984,'20984','','lbracelet','false','none',150,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','21203-1;23202-1;3267-1;'),
(20985,'20985','','lbracelet','false','none',150,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','21204-1;23203-1;3267-1;'),
(20986,'20986','','lbracelet','false','none',150,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','21205-1;23204-1;3267-1;'),
(20987,'20987','','lbracelet','false','none',150,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','21206-1;23205-1;3267-1;'),
(20988,'20988','','lbracelet','false','none',150,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','21207-1;23206-1;3267-1;'),
(20989,'20989','','lbracelet','false','none',150,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','21208-1;23207-1;3267-1;'),
(20990,'20990','','lbracelet','false','none',150,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','21209-1;23208-1;3267-1;'),
(20991,'20991','','lbracelet','false','none',150,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','21210-1;23209-1;3267-1;');
