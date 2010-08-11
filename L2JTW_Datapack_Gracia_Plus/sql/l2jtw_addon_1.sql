/************ Made in Taiwan ************/

/************ �R���۩w��NPC ************/
DELETE FROM `spawnlist` WHERE `id` > 820000 AND `id` < 880000;


/************ �ץ�32007�[����-�����|�� ************/
INSERT INTO `spawnlist` VALUES ('820001', '', '1', '32007', '140967', '-123600', '-1905', '0', '0', '11829', '60', '0', '0');
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
UPDATE `armor` SET `skill` = '3263-1;' WHERE `item_id` IN (10621,10625,10629);
UPDATE `armor` SET `skill` = '3264-1;' WHERE `item_id` IN (10620,10624,10628,14753,14756,14759,14762);
UPDATE `armor` SET `skill` = '3265-1;' WHERE `item_id` IN (10623,10627,10631,14754,14757,14760,14763);
UPDATE `armor` SET `skill` = '3266-1;' WHERE `item_id` IN (10622,10626,10630,14755,14758,14761,14764);
UPDATE `armor` SET `skill` = '21005-3;' WHERE `item_id` IN (20016);
UPDATE `armor` SET `skill` = '21006-1;21007-1;' WHERE `item_id` IN (20018);
UPDATE `armor` SET `skill` = '21004-1;' WHERE `item_id` IN (20019);


/************ �W�[/�ץ�/�R��NPC ************/
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
('32766', 'oren09_npc2018_010', '1', '30134', '9689', '15550', '-4574', '0', '0', '5892', '60', '0', '0'),     -- �Ǵ��K(�·t���F����)
('33472', 'oren16_npc2218_016', '1', '31605', '85692', '16400', '-2803', '0', '0', '38000', '60', '0', '0'),   -- �����p(�H����)
('33594', 'innadril09_npc2324_23', '1', '31092', '114486', '217413', '-3631', '0', '0', '0', '60', '0', '0'),  -- �]�I���a�U�ӤH(���W����������)
('33613', 'aden17_npc2317_01', '1', '31675', '111186', '-13261', '-1702', '0', '0', '13828', '60', '0', '0'),  -- ���J�S �� �w��J(��Ҧu�ƶ�����)
('33614', 'aden17_npc2317_02', '1', '31679', '111532', '-17238', '-1702', '0', '0', '49586', '60', '0', '0'),  -- �״��S�� �� ���(���ĵ�ƶ�����)
('33628', 'aden17_npc2317_03', '1', '31677', '111532', '-13266', '-1704', '0', '0', '14508', '60', '0', '0'),  -- ��Ҧu�ƶ���
('33635', 'aden17_npc2317_03', '1', '31677', '111178', '-17234', '-1702', '0', '0', '46468', '60', '0', '0'),  -- ��Ҧu�ƶ���
('51231', 'schuttgart', '1', '30767', '85792', '-142809', '-1341', '0', '0', '10508', '60', '0', '0');         -- ���޲z��(�ץ[�S����)

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
('820016', '', '1', '32109', '23666', '-7144', '-1134', '0', '0', '46433', '60', '0', '0'),     -- �u�Y�t��
('820017', '', '1', '35601', '141152', '-124272', '-1864', '0', '0', '10000', '60', '0', '0'),  -- �u���H(�i�m�u�ھڦa)
('820018', '', '1', '35602', '140704', '-124020', '-1904', '0', '0', '34000', '60', '0', '0'),  -- �u���H(�i�m�u�ھڦa)
('820019', '', '1', '35602', '140732', '-123796', '-1904', '0', '0', '2000', '60', '0', '0'),   -- �u���H(�i�m�u�ھڦa)
('820020', '', '1', '35603', '152924', '-126604', '-2304', '0', '0', '33000', '60', '0', '0'),  -- �J���޲z��(�i�m�u�ھڦa)
('820021', '', '1', '35604', '143944', '-119196', '-2136', '0', '0', '1000', '60', '0', '0'),   -- �ǥO(�i�m�u�ھڦa)
('820022', '', '1', '35605', '140824', '-124844', '-1864', '0', '0', '10000', '60', '0', '0'),  -- �w��S ����(�i�m�u�ھڦa)
('820023', '', '1', '35623', '59884', '-94204', '-1344', '0', '0', '27000', '60', '0', '0'),    -- �����u���H(���~�A���ھڦa)
('820024', '', '1', '35624', '59920', '-94336', '-1344', '0', '0', '60000', '60', '0', '0'),    -- �����u���H(���~�A���ھڦa)
('820025', '', '1', '35625', '55184', '-93040', '-1360', '0', '0', '35000', '60', '0', '0'),    -- �~���u���H(���~�A���ھڦa)
('820026', '', '1', '35626', '55400', '-93008', '-1360', '0', '0', '30000', '60', '0', '0'),    -- �~���u���H(���~�A���ھڦa)
('820027', '', '1', '35627', '53508', '-93776', '-1584', '0', '0', '36000', '60', '0', '0'),    -- �ǥO(���~�A���ھڦa)
('820028', '', '1', '35628', '60880', '-94320', '-1344', '0', '0', '27000', '60', '0', '0'),    -- ����� �A���޲z��(���~�A���ھڦa)
('820029', '', '1', '35638', '56736', '-26400', '568', '0', '0', '49000', '60', '0', '0'),      -- �ڭ۴� ���s�޲z��
('820030', '', '1', '35639', '58128', '-32000', '296', '0', '0', '0', '60', '0', '0'),          -- �ǥd�w �ǥO
('820031', '', '1', '35640', '58024', '-25744', '592', '0', '0', '49000', '60', '0', '0'),      -- �Z�wù ����
('820032', '', '1', '35641', '58080', '-29552', '568', '0', '0', '49000', '60', '0', '0'),      -- �n��u���H
('820033', '', '1', '35641', '58137', '-29223', '568', '0', '0', '16500', '60', '0', '0'),      -- �n��u���H
('820034', '', '1', '35642', '58024', '-26456', '592', '0', '0', '49000', '60', '0', '0'),      -- �n��u���H
('820035', '', '1', '35642', '58074', '-26325', '597', '0', '0', '15732', '60', '0', '0');      -- �n��u���H

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
('3254001', '3254001', '-212836', '209824', '4288', '0', '0', '57'),   -- �`�W���u���H
('3260201', '3260201', '-245833', '220174', '-12104', '0', '0', '57'), -- �{�ɶǰe�v
('3260202', '3260202', '-251624', '213420', '-12072', '0', '0', '57'), -- �{�ɶǰe�v
('3260203', '3260203', '-249774', '207316', '-11952', '0', '0', '57'); -- �{�ɶǰe�v

-- NPC�令AI����
Delete From `spawnlist` Where `npc_templateid` in (32628,32629); -- �X�Y���ާL

-- ����ץ�
UPDATE `armor` SET `armor_type` = 'heavy' WHERE `item_id` IN (9821,10019,10020); -- �۶H�˳�-���}����/��l�ݥ�/���K�H��
UPDATE `armor` SET `armor_type` = 'light' WHERE `item_id` IN (9824,10021,10022); -- �۶H�˳�-���}§�A/�������Ũ�m/��������H��
UPDATE `armor` SET `armor_type` = 'magic' WHERE `item_id` IN (9827,10023,10024); -- �۶H�˳�-���}���T/���A�G���~��/���A�G������
UPDATE `armor` SET `time` = 0 WHERE `item_id` IN (20098); -- §�A-���� 1�p�ɤ۶H
UPDATE `armor` SET `time` = 43200 WHERE `item_id` IN (13544,13545); -- ����l����N-�k�ͮ��}��/����l����N-�k�ͮ��}��
UPDATE `armor` SET `time` = 43200 WHERE `item_id` IN (20503,20504); -- ���O��l/�]�T�����M�����N ����30�� (L2J���~�]�w��etcitem)
UPDATE `armor` SET `duration` = 360 WHERE `item_id` IN (14753,14754,14755,14756,14757,14758,14759,14760,14761,14762,14763,14764); -- �۶H�˳�

-- �Z���ץ�
UPDATE `weapon` SET `bodypart` = 'lrhand', `weaponType` = 'bigblunt' WHERE `item_id` IN (9819,13530,13531,13532,13533,13534,13535,13536,13537,13538);  -- �����X�m/�j�|�B�X�m/�f���X�m/�_���X�m/�ڷ�X�m/�ȤB�X�m/�]�Ǳo�ߺX�m/���F�S�X�m/�|�]�X�m/�ץ[�S�X�m
UPDATE `weapon` SET `bodypart` = 'lrhand', `weaponType` = 'bigblunt' WHERE `item_id` IN (13539,13560,13561,13562,13563,13564,13565,13566,13567,13568); -- �j�v�E�q���]��/�j�|�B �u�@����/�f�� �u�@����/�_�� �u�@����/�ڷ� �u�@����/�ȤB �u�@����/�]�Ǳo�� �u�@����/���F�S �u�@����/�|�] �u�@����/�ץ[�S �u�@����
UPDATE `weapon` SET `bodypart` = 'lrhand', `weaponType` = 'bigblunt' WHERE `item_id` IN (13809,13981); -- �c���]�k�v���]�k��/�Ǫ���(�s���x�԰��L)
UPDATE `weapon` SET `weaponType` = 'none' WHERE `item_id` IN (13525); -- ��Ǧ�Ȥh�L�޵P

-- ��L���~�ץ�
Delete From `items` Where (`item_id` > 708 and `item_id` < 725); -- �R���M����P�˦W�٪���L���~
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
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (30840,31262,31413,31414,31415,31416,31417,31421,31422,31423,31424,31425,31426,31426,31429,31430,31431,31666,31667,31670,31951,31973,31980);
DELETE FROM `merchant_buylists` WHERE `shop_id` IN ( SELECT `shop_id` FROM `merchant_shopids` WHERE `npc_id` IN (30840,31262,31413,31414,31415,31416,31417,31421,31422,31423,31424,31425,31426,31427,31429,31430,31431,31666,31667,31670,31951,31973,31980));
DELETE FROM `merchant_shopids` WHERE `npc_id` IN (30840,31262,31413,31414,31415,31416,31417,31421,31422,31423,31424,31425,31426,31427,31429,31430,31431,31666,31667,31670,31951,31973,31980);

-- �R���m��ӤH
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (30990,30994) AND `id` NOT IN (45033);

-- �R���䤤�@����¾�޲z��
-- DELETE FROM `spawnlist` WHERE `npc_templateid` IN (31756);
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (31757);

-- �ץ�/��s����128 ��ԥd-�B�P�����q
UPDATE `etcitem` SET `skill` = '2150-1;', `handler` = 'SoulShots', `item_type` = 'shot', `crystal_type` = 'd' WHERE `item_id` = 13037;
UPDATE `etcitem` SET `skill` = '2153-1;', `handler` = 'SoulShots', `item_type` = 'shot', `crystal_type` = 'a' WHERE `item_id` = 13045;
UPDATE `etcitem` SET `skill` = '2153-1;', `handler` = 'SoulShots', `item_type` = 'shot', `crystal_type` = 'a' WHERE `item_id` = 13055;
UPDATE `weapon` SET `skill` = '0-0;' WHERE `item_id` = 13042;
UPDATE `npc` SET `collision_radius` = 28, `collision_height` = 20, `level` = 61, `hp` = 3450, `mp` = 1365, `patk` = 991, `pdef` = 415, `matk` = 504, `mdef` = 388, `runspd` = 187 WHERE `id` = 14916;
UPDATE `npc` SET `collision_radius` = 28, `collision_height` = 20, `level` = 70, `hp` = 4025, `mp` = 1592, `patk` = 1156, `pdef` = 484, `matk` = 588, `mdef` = 452, `runspd` = 187 WHERE `id` = 14917;


/************ CT 2.5 �t�l�ϩR�ץ� ************/
-- ���O�אּ�q��,���A����/��/�k/��Ѩ�
UPDATE `items` SET `item_id` = 13687 WHERE `item_id` IN (13688,13689,13690); -- ��/�k/��ѨϪ��M�h���O��q�Τ��O
UPDATE `items` SET `item_id` = 13890 WHERE `item_id` IN (13889,13891,13892); -- ��/�k/��ѨϪ��t�F���O��q�Τ��O
UPDATE `items` SET `item_id` = 14609 WHERE `item_id` IN (14601,14602,14608,14610); -- ��/�k/��ѨϪ��j�N���O��q�Τ��O
DELETE FROM `merchant_buylists` WHERE `item_id` IN (13688,13689,13690,13889,13891,13892,14601,14602,14608,14610); -- �R����/�k/��ѨϪ����O���c��

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

-- �s�Y��(�Ѩ�/�B��/�u�\�Y�T/�T��/����/�Ȩ�/���Z/�Y�y/�Q�t/����/�s��U/���y�z���Y/�ʼ@����-�B��/����/�i��)
REPLACE INTO `armor` VALUES
(15484,'15484','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(16098,'16098','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(16099,'16099','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(16100,'16100','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(16101,'16101','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(16102,'16102','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(16103,'16103','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(16104,'16104','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(16105,'16105','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(16106,'16106','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(16107,'16107','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(16108,'16108','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(16109,'16109','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(17033,'17033','','hairall','false','none',10,'wood','none',0,-1,43200,0,0,0,0,0,'false','false','true','false','true','0-0','8497-1;'),
(20973,'20973','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(20974,'20974','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(20975,'20975','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(20981,'20981','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(21009,'21009','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(21010,'21010','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;'),
(21011,'21011','','hairall','false','none',10,'wood','none',0,-1,-1,0,0,0,0,0,'false','false','true','false','true','0-0','0-0;');

-- �s���~(�ܦ�/�ըش�/�ѩR)
REPLACE INTO `armor` VALUES
(15717,'15717','','rfinger,lfinger','true','none',150,'gold','s84',0,-1,-1,0,69,27,0,523,'true','true','true','true','true','0-0','0-0;'),
(15718,'15718','','rear,lear','true','none',150,'gold','s84',0,-1,-1,0,104,39,0,785,'true','true','true','true','true','0-0','0-0;'),
(15719,'15719','','neck','true','none',150,'gold','s84',0,-1,-1,0,138,52,0,1046,'true','true','true','true','true','0-0','0-0;'),
(15720,'15720','','rfinger,lfinger','true','none',150,'gold','s84',0,-1,-1,0,65,26,0,436,'true','true','true','true','true','0-0','0-0;'),
(15721,'15721','','rear,lear','true','none',150,'gold','s84',0,-1,-1,0,98,38,0,654,'true','true','true','true','true','0-0','0-0;'),
(15722,'15722','','neck','true','none',150,'gold','s84',0,-1,-1,0,131,51,0,872,'true','true','true','true','true','0-0','0-0;'),
(15723,'15723','','rfinger,lfinger','true','none',150,'gold','s80',0,-1,-1,0,61,24,0,263,'true','true','true','true','true','0-0','0-0;'),
(15724,'15724','','rear,lear','true','none',150,'gold','s80',0,-1,-1,0,86,36,0,395,'true','true','true','true','true','0-0','0-0;'),
(15725,'15725','','neck','true','none',150,'gold','s80',0,-1,-1,0,115,48,0,526,'true','true','true','true','true','0-0','0-0;');

-- �sBOSS���~(����������)
REPLACE INTO `armor` VALUES
(16025,'16025','','neck','true','none',150,'gold','s84',0,-1,-1,0,125,50,0,729,'true','true','true','true','true','0-0','8459-1;'),
(16026,'16026','','neck','true','none',150,'gold','s84',0,-1,-1,0,132,50,0,729,'true','true','true','true','true','0-0','8460-1;');

-- �s���˭}�Z��(���ªZ�����ܦ⪩+���ǪZ������O)
REPLACE INTO `weapon` VALUES
(15676,'15676','','rhand','true',1520,1,1,'fine_steel','s84',396,10,'sword',8,0.00000,0,0,0,379,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,15687,'0-0;'),
(15677,'15677','','rhand','true',1520,1,1,'fine_steel','s84',346,5,'dagger',12,-3.00000,0,0,0,433,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
(15678,'15678','','rhand','true',1740,1,1,'fine_steel','s84',396,20,'blunt',4,4.00000,0,0,0,379,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
(15679,'15679','','lrhand','true',1740,1,1,'fine_steel','s84',482,20,'bigblunt',4,4.00000,0,0,0,325,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
(15680,'15680','','lrhand','true',1740,1,1,'fine_steel','s84',482,10,'bigsword',8,0.00000,0,0,0,325,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,15688,'0-0;'),
(15681,'15681','','lrhand','true',1550,1,1,'fine_steel','s84',482,5,'dualfist',4,4.00000,0,0,0,325,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
(15682,'15682','','lrhand','true',2010,1,1,'fine_steel','s84',396,10,'pole',8,-3.00000,0,0,0,325,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3599-1;'),
(15683,'15683','','rhand','true',1080,1,1,'fine_steel','s84',317,20,'blunt',4,4.00000,0,0,0,379,0,244,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
(15684,'15684','','lrhand','true',1080,1,1,'fine_steel','s84',386,20,'bigblunt',4,4.00000,0,0,0,325,0,268,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
(15685,'15685','','rhand','true',1520,1,1,'fine_steel','s84',317,10,'sword',8,0.00000,0,0,0,379,0,244,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
(15686,'15686','','lrhand','true',1520,1,1,'fine_steel','s84',724,5,'bow',12,-3.00000,0,0,0,293,12,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,15689,'0-0;'),
(15687,'15687','','rhand','true',1280,1,1,'fine_steel','s84',359,40,'rapier',10,-1.00000,0,0,0,406,0,183,-1,-1,0,0,'true','true','true','true','true',3426,1,0,0,0,0,0,0,15676,'0-0;'),
(15688,'15688','','lrhand','true',1800,1,1,'fine_steel','s84',429,15,'ancient',8,2.00000,0,0,0,350,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,15680,'0-0;'),
(15689,'15689','','rhand','true',1580,1,1,'fine_steel','s84',444,10,'crossbow',10,-1.00000,0,0,0,303,0,183,-1,-1,0,0,'true','true','true','true','true',0,0,0,0,0,0,0,0,15686,'0-0;');

-- �S�O�����˭}�Z���W�[��ۮĪG
UPDATE `weapon` SET `skill` = '8297-1;' WHERE `item_id` = 15676;
UPDATE `weapon` SET `skill` = '8297-1;' WHERE `item_id` = 15677;
UPDATE `weapon` SET `skill` = '3568-1;' WHERE `item_id` = 15678;
UPDATE `weapon` SET `skill` = '3568-1;' WHERE `item_id` = 15679;
UPDATE `weapon` SET `skill` = '8297-1;' WHERE `item_id` = 15680;
UPDATE `weapon` SET `skill` = '8289-1;' WHERE `item_id` = 15681;
UPDATE `weapon` SET `skill` = '3599-1;8297-1;' WHERE `item_id` = 15682;
UPDATE `weapon` SET `skill` = '3047-3;' WHERE `item_id` = 15683;
UPDATE `weapon` SET `skill` = '3575-2;' WHERE `item_id` = 15684;
UPDATE `weapon` SET `skill` = '3047-3;' WHERE `item_id` = 15685;
UPDATE `weapon` SET `skill` = '8298-1;' WHERE `item_id` = 15686;
UPDATE `weapon` SET `skill` = '8297-1;' WHERE `item_id` = 15687;
UPDATE `weapon` SET `skill` = '8297-1;' WHERE `item_id` = 15688;
UPDATE `weapon` SET `skill` = '8296-1;' WHERE `item_id` = 15689;

-- �s����(�ܦ�/�ըش�/�ѩR)
REPLACE INTO `armor` VALUES
(15572,'15572','','head','true','none',530,'fine_steel','s84',0,-1,-1,110,0,0,0,1205,'true','true','true','true','true','0-0','0-0;'),
(15573,'15573','','head','true','none',530,'wood','s84',0,-1,-1,110,0,0,0,1205,'true','true','true','true','true','0-0','0-0;'),
(15574,'15574','','head','true','none',530,'cloth','s84',0,-1,-1,110,0,0,0,1205,'true','true','true','true','true','0-0','0-0;'),
(15575,'15575','','chest','true','heavy',7520,'fine_steel','s84',0,-1,-1,272,0,0,0,3214,'true','true','true','true','true','0-0','0-0;'),
(15576,'15576','','chest','true','light',4140,'wood','s84',0,-1,-1,204,0,0,0,2410,'true','true','true','true','true','0-0','0-0;'),
(15577,'15577','','chest','true','magic',1750,'cloth','s84',0,-1,-1,136,0,661,0,2410,'true','true','true','true','true','0-0','0-0;'),
(15578,'15578','','legs','true','heavy',3170,'fine_steel','s84',0,-1,-1,170,0,0,0,2009,'true','true','true','true','true','0-0','0-0;'),
(15579,'15579','','legs','true','light',1320,'wood','s84',0,-1,-1,128,0,0,0,1506,'true','true','true','true','true','0-0','0-0;'),
(15580,'15580','','legs','true','magic',850,'cloth','s84',0,-1,-1,85,0,439,0,1506,'true','true','true','true','true','0-0','0-0;'),
(15581,'15581','','gloves','true','none',510,'fine_steel','s84',0,-1,-1,74,0,0,0,803,'true','true','true','true','true','0-0','0-0;'),
(15582,'15582','','gloves','true','none',510,'wood','s84',0,-1,-1,74,0,0,0,803,'true','true','true','true','true','0-0','0-0;'),
(15583,'15583','','gloves','true','none',510,'cloth','s84',0,-1,-1,74,0,0,0,803,'true','true','true','true','true','0-0','0-0;'),
(15584,'15584','','feet','true','none',1070,'fine_steel','s84',0,-1,-1,74,0,0,0,803,'true','true','true','true','true','0-0','0-0;'),
(15585,'15585','','feet','true','none',1070,'wood','s84',0,-1,-1,74,0,0,0,803,'true','true','true','true','true','0-0','0-0;'),
(15586,'15586','','feet','true','none',1070,'cloth','s84',0,-1,-1,74,0,0,0,803,'true','true','true','true','true','0-0','0-0;'),
(15588,'15588','','lhand','false','sigil',920,'silver','s84',0,-1,-1,21,0,0,0,844,'true','true','true','true','true','0-0','0-0;'),
(15589,'15589','','head','true','none',530,'fine_steel','s84',0,-1,-1,107,0,0,0,1005,'true','true','true','true','true','0-0','0-0;'),
(15590,'15590','','head','true','none',530,'wood','s84',0,-1,-1,107,0,0,0,1005,'true','true','true','true','true','0-0','0-0;'),
(15591,'15591','','head','true','none',530,'cloth','s84',0,-1,-1,107,0,0,0,1005,'true','true','true','true','true','0-0','0-0;'),
(15592,'15592','','chest','true','heavy',7520,'fine_steel','s84',0,-1,-1,263,0,0,0,2680,'true','true','true','true','true','0-0','0-0;'),
(15593,'15593','','chest','true','light',4140,'wood','s84',0,-1,-1,197,0,0,0,2010,'true','true','true','true','true','0-0','0-0;'),
(15594,'15594','','chest','true','magic',1750,'cloth','s84',0,-1,-1,132,0,649,0,2010,'true','true','true','true','true','0-0','0-0;'),
(15595,'15595','','legs','true','heavy',3170,'fine_steel','s84',0,-1,-1,164,0,0,0,1675,'true','true','true','true','true','0-0','0-0;'),
(15596,'15596','','legs','true','light',1320,'wood','s84',0,-1,-1,123,0,0,0,1256,'true','true','true','true','true','0-0','0-0;'),
(15597,'15597','','legs','true','magic',850,'cloth','s84',0,-1,-1,82,0,427,0,1256,'true','true','true','true','true','0-0','0-0;'),
(15598,'15598','','gloves','true','none',510,'fine_steel','s84',0,-1,-1,71,0,0,0,670,'true','true','true','true','true','0-0','0-0;'),
(15599,'15599','','gloves','true','none',510,'wood','s84',0,-1,-1,71,0,0,0,670,'true','true','true','true','true','0-0','0-0;'),
(15600,'15600','','gloves','true','none',510,'cloth','s84',0,-1,-1,71,0,0,0,670,'true','true','true','true','true','0-0','0-0;'),
(15601,'15601','','feet','true','none',1070,'fine_steel','s84',0,-1,-1,71,0,0,0,670,'true','true','true','true','true','0-0','0-0;'),
(15602,'15602','','feet','true','none',1070,'wood','s84',0,-1,-1,71,0,0,0,670,'true','true','true','true','true','0-0','0-0;'),
(15603,'15603','','feet','true','none',1070,'cloth','s84',0,-1,-1,71,0,0,0,670,'true','true','true','true','true','0-0','0-0;'),
(15605,'15605','','lhand','false','sigil',920,'silver','s84',0,-1,-1,19,0,0,0,704,'true','true','true','true','true','0-0','0-0;'),
(15606,'15606','','head','true','none',530,'fine_steel','s80',0,-1,-1,96,0,0,0,606,'true','true','true','true','true','0-0','0-0;'),
(15607,'15607','','head','true','none',530,'wood','s80',0,-1,-1,96,0,0,0,606,'true','true','true','true','true','0-0','0-0;'),
(15608,'15608','','head','true','none',530,'cloth','s80',0,-1,-1,96,0,0,0,606,'true','true','true','true','true','0-0','0-0;'),
(15609,'15609','','chest','true','heavy',7520,'fine_steel','s80',0,-1,-1,238,0,0,0,1616,'true','true','true','true','true','0-0','0-0;'),
(15610,'15610','','chest','true','light',4140,'wood','s80',0,-1,-1,178,0,0,0,1212,'true','true','true','true','true','0-0','0-0;'),
(15611,'15611','','chest','true','magic',1750,'cloth','s80',0,-1,-1,119,0,614,0,1212,'true','true','true','true','true','0-0','0-0;'),
(15612,'15612','','legs','true','heavy',3170,'fine_steel','s80',0,-1,-1,149,0,0,0,1010,'true','true','true','true','true','0-0','0-0;'),
(15613,'15613','','legs','true','light',1320,'wood','s80',0,-1,-1,111,0,0,0,758,'true','true','true','true','true','0-0','0-0;'),
(15614,'15614','','legs','true','magic',850,'cloth','s80',0,-1,-1,74,0,392,0,758,'true','true','true','true','true','0-0','0-0;'),
(15615,'15615','','gloves','true','none',510,'fine_steel','s80',0,-1,-1,64,0,0,0,404,'true','true','true','true','true','0-0','0-0;'),
(15616,'15616','','gloves','true','none',510,'wood','s80',0,-1,-1,64,0,0,0,404,'true','true','true','true','true','0-0','0-0;'),
(15617,'15617','','gloves','true','none',510,'cloth','s80',0,-1,-1,64,0,0,0,404,'true','true','true','true','true','0-0','0-0;'),
(15618,'15618','','feet','true','none',1070,'fine_steel','s80',0,-1,-1,64,0,0,0,404,'true','true','true','true','true','0-0','0-0;'),
(15619,'15619','','feet','true','none',1070,'wood','s80',0,-1,-1,64,0,0,0,404,'true','true','true','true','true','0-0','0-0;'),
(15620,'15620','','feet','true','none',1070,'cloth','s80',0,-1,-1,64,0,0,0,404,'true','true','true','true','true','0-0','0-0;'),
(15622,'15622','','lhand','false','sigil',920,'silver','s80',0,-1,-1,16,0,0,0,424,'true','true','true','true','true','0-0','0-0;');

-- �s�޵P(�ܦ�/�ըش�/�ѩR)
REPLACE INTO `weapon` VALUES
(15587,'15587','','lhand','true',1190,0,0,'fine_steel','s84',0,0,'none',0,0.00000,-8,413,20,0,0,0,-1,-1,0,844,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
(15604,'15604','','lhand','true',1190,0,0,'fine_steel','s84',0,0,'none',0,0.00000,-8,399,20,0,0,0,-1,-1,0,704,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;'),
(15621,'15621','','lhand','true',1190,0,0,'fine_steel','s80',0,0,'none',0,0.00000,-8,355,20,0,0,0,-1,-1,0,424,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'0-0;');

-- �s���㪺�M�ˮĪG
REPLACE INTO `armorsets` VALUES
(146,15609,15612,15606,15615,15618,'3006-1;8397-1;',15621,3417,3623,0,0,0,0,0),
(147,15610,15613,15607,15616,15619,'3006-1;8398-1;',0,0,3624,0,0,0,0,0),
(148,15611,15614,15608,15617,15620,'3006-1;8399-1;',0,0,3625,0,0,0,0,0),
(149,15592,15595,15589,15598,15601,'3006-1;8400-1;',15604,3417,8461,0,0,0,0,0),
(150,15593,15596,15590,15599,15602,'3006-1;8401-1;',0,0,8462,0,0,0,0,0),
(151,15594,15597,15591,15600,15603,'3006-1;8402-1;',0,0,8463,0,0,0,0,0),
(152,15575,15578,15572,15581,15584,'3006-1;8403-1;',15587,3417,8461,0,0,0,0,0),
(153,15576,15579,15573,15582,15585,'3006-1;8404-1;',0,0,8462,0,0,0,0,0),
(154,15577,15580,15574,15583,15586,'3006-1;8405-1;',0,0,8463,0,0,0,0,0);

-- �s�Z��(S84�W��/S84�S��)
REPLACE INTO `weapon` VALUES
(15829,'15829','','rhand','true',1520,1,1,'fine_steel','s84',415,10,'sword',8,0.00000,0,0,0,379,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,15863,'3013-5;'),
(15830,'15830','','rhand','true',1520,1,1,'fine_steel','s84',415,10,'sword',8,0.00000,0,0,0,379,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,15864,'8289-2;'),
(15831,'15831','','rhand','true',1520,1,1,'fine_steel','s84',415,10,'sword',8,0.00000,0,0,0,379,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,15862,'8297-1;'),
(15832,'15832','','rhand','true',1520,1,1,'fine_steel','s84',363,5,'dagger',12,-3.00000,0,0,0,433,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3568-1;'),
(15833,'15833','','rhand','true',1520,1,1,'fine_steel','s84',363,5,'dagger',12,-3.00000,0,0,0,433,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'8297-1;'),
(15834,'15834','','rhand','true',1520,1,1,'fine_steel','s84',363,5,'dagger',12,-3.00000,0,0,0,433,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3572-3;'),
(15835,'15835','','rhand','true',1740,1,1,'fine_steel','s84',415,20,'blunt',4,4.00000,0,0,0,379,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3013-4;'),
(15836,'15836','','rhand','true',1740,1,1,'fine_steel','s84',415,20,'blunt',4,4.00000,0,0,0,379,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3569-1;'),
(15837,'15837','','rhand','true',1740,1,1,'fine_steel','s84',415,20,'blunt',4,4.00000,0,0,0,379,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3568-1;'),
(15838,'15838','','lrhand','true',1740,1,1,'fine_steel','s84',505,20,'bigblunt',4,4.00000,0,0,0,325,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3013-5;'),
(15839,'15839','','lrhand','true',1740,1,1,'fine_steel','s84',505,20,'bigblunt',4,4.00000,0,0,0,325,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3568-1;'),
(15840,'15840','','lrhand','true',1740,1,1,'fine_steel','s84',505,20,'bigblunt',4,4.00000,0,0,0,325,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3569-1;'),
(15841,'15841','','lrhand','true',1740,1,1,'fine_steel','s84',505,10,'bigsword',8,0.00000,0,0,0,325,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,15866,'3013-5;'),
(15842,'15842','','lrhand','true',1740,1,1,'fine_steel','s84',505,10,'bigsword',8,0.00000,0,0,0,325,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,15867,'8289-2;'),
(15843,'15843','','lrhand','true',1740,1,1,'fine_steel','s84',505,10,'bigsword',8,0.00000,0,0,0,325,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,15865,'8297-1;'),
(15844,'15844','','lrhand','true',1550,1,1,'fine_steel','s84',505,5,'dualfist',4,4.00000,0,0,0,325,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3013-5;'),
(15845,'15845','','lrhand','true',1550,1,1,'fine_steel','s84',505,5,'dualfist',4,4.00000,0,0,0,325,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,3571,1,43,0,'3552-1;'),
(15846,'15846','','lrhand','true',1550,1,1,'fine_steel','s84',505,5,'dualfist',4,4.00000,0,0,0,325,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'8289-2;'),
(15847,'15847','','lrhand','true',2010,1,1,'fine_steel','s84',415,10,'pole',8,-3.00000,0,0,0,325,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3602-7;'),
(15848,'15848','','lrhand','true',2010,1,1,'fine_steel','s84',415,10,'pole',8,-3.00000,0,0,0,325,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3599-1;8297-1;'),
(15849,'15849','','lrhand','true',2010,1,1,'fine_steel','s84',415,10,'pole',8,-3.00000,0,0,0,325,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3013-4;'),
(15850,'15850','','rhand','true',1080,1,1,'fine_steel','s84',332,20,'blunt',4,4.00000,0,0,0,379,0,244,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3576-2;'),
(15851,'15851','','rhand','true',1080,1,1,'fine_steel','s84',332,20,'blunt',4,4.00000,0,0,0,379,0,244,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3014-3;'),
(15852,'15852','','rhand','true',1080,1,1,'fine_steel','s84',332,20,'blunt',4,4.00000,0,0,0,379,0,244,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3047-3;'),
(15853,'15853','','lrhand','true',1080,1,1,'fine_steel','s84',404,20,'bigblunt',4,4.00000,0,0,0,325,0,268,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3576-2;'),
(15854,'15854','','lrhand','true',1080,1,1,'fine_steel','s84',404,20,'bigblunt',4,4.00000,0,0,0,325,0,268,-1,-1,0,8233,'true','true','true','true','true',0,0,3577,1,20,0,0,0,0,'3552-1;'),
(15855,'15855','','lrhand','true',1080,1,1,'fine_steel','s84',404,20,'bigblunt',4,4.00000,0,0,0,325,0,268,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3575-3;'),
(15856,'15856','','rhand','true',1520,1,1,'fine_steel','s84',332,10,'sword',8,0.00000,0,0,0,379,0,244,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3047-3;'),
(15857,'15857','','rhand','true',1520,1,1,'fine_steel','s84',332,10,'sword',8,0.00000,0,0,0,379,0,244,-1,-1,0,8233,'true','true','true','true','true',0,0,3577,1,20,0,0,0,0,'3552-1;'),
(15858,'15858','','rhand','true',1520,1,1,'fine_steel','s84',332,10,'sword',8,0.00000,0,0,0,379,0,244,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3014-3;'),
(15859,'15859','','lrhand','true',1520,1,1,'fine_steel','s84',768,5,'bow',12,-3.00000,0,0,0,293,12,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,15869,'8289-3;'),
(15860,'15860','','lrhand','true',1520,1,1,'fine_steel','s84',768,5,'bow',12,-3.00000,0,0,0,293,12,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,3574,3,33,15870,'3552-1;'),
(15861,'15861','','lrhand','true',1520,1,1,'fine_steel','s84',768,5,'bow',12,-3.00000,0,0,0,293,12,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,15868,'3552-1;'),
(15862,'15862','','rhand','true',1280,1,1,'fine_steel','s84',376,40,'rapier',10,-1.00000,0,0,0,406,0,183,-1,-1,0,8233,'true','true','true','true','true',3426,1,0,0,0,0,0,0,15830,'3013-5;'),
(15863,'15863','','rhand','true',1280,1,1,'fine_steel','s84',376,40,'rapier',10,-1.00000,0,0,0,406,0,183,-1,-1,0,8233,'true','true','true','true','true',3426,1,0,0,0,0,0,0,15831,'8289-3;'),
(15864,'15864','','rhand','true',1280,1,1,'fine_steel','s84',376,40,'rapier',10,-1.00000,0,0,0,406,0,183,-1,-1,0,8233,'true','true','true','true','true',3426,1,0,0,0,0,0,0,15829,'8297-1;'),
(15865,'15865','','lrhand','true',1800,1,1,'fine_steel','s84',449,15,'ancient',8,2.00000,0,0,0,350,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,15842,'3013-5;'),
(15866,'15866','','lrhand','true',1800,1,1,'fine_steel','s84',449,15,'ancient',8,2.00000,0,0,0,350,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,15843,'8289-2;'),
(15867,'15867','','lrhand','true',1800,1,1,'fine_steel','s84',449,15,'ancient',8,2.00000,0,0,0,350,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,15841,'8297-1;'),
(15868,'15868','','rhand','true',1580,1,1,'fine_steel','s84',471,10,'crossbow',10,-1.00000,0,0,0,303,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,15860,'8289-3;'),
(15869,'15869','','rhand','true',1580,1,1,'fine_steel','s84',471,10,'crossbow',10,-1.00000,0,0,0,303,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,3574,3,20,15861,'3552-1;'),
(15870,'15870','','rhand','true',1580,1,1,'fine_steel','s84',471,10,'crossbow',10,-1.00000,0,0,0,303,0,183,-1,-1,0,8233,'true','true','true','true','true',0,0,0,0,0,0,0,0,15859,'3552-1;'),
(15871,'15871','','rhand','true',1520,1,1,'fine_steel','s84',437,10,'sword',8,0.00000,0,0,0,379,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,15906,'8289-2;'),
(15872,'15872','','rhand','true',1520,1,1,'fine_steel','s84',437,10,'sword',8,0.00000,0,0,0,379,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,15904,'8297-1;'),
(15873,'15873','','rhand','true',1520,1,1,'fine_steel','s84',437,10,'sword',8,0.00000,0,0,0,379,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,15905,'3013-5;'),
(15874,'15874','','rhand','true',1520,1,1,'fine_steel','s84',382,5,'dagger',12,-3.00000,0,0,0,433,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'8297-1;'),
(15875,'15875','','rhand','true',1520,1,1,'fine_steel','s84',382,5,'dagger',12,-3.00000,0,0,0,433,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3572-4;'),
(15876,'15876','','rhand','true',1520,1,1,'fine_steel','s84',382,5,'dagger',12,-3.00000,0,0,0,433,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3568-1;'),
(15877,'15877','','rhand','true',1740,1,1,'fine_steel','s84',437,20,'blunt',4,4.00000,0,0,0,379,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3569-1;'),
(15878,'15878','','rhand','true',1740,1,1,'fine_steel','s84',437,20,'blunt',4,4.00000,0,0,0,379,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3568-1;'),
(15879,'15879','','rhand','true',1740,1,1,'fine_steel','s84',437,20,'blunt',4,4.00000,0,0,0,379,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3013-4;'),
(15880,'15880','','lrhand','true',1740,1,1,'fine_steel','s84',532,20,'bigblunt',4,4.00000,0,0,0,325,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3568-1;'),
(15881,'15881','','lrhand','true',1740,1,1,'fine_steel','s84',532,20,'bigblunt',4,4.00000,0,0,0,325,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3569-1;'),
(15882,'15882','','lrhand','true',1740,1,1,'fine_steel','s84',532,20,'bigblunt',4,4.00000,0,0,0,325,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3013-5;'),
(15883,'15883','','lrhand','true',1740,1,1,'fine_steel','s84',532,10,'bigsword',8,0.00000,0,0,0,325,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,15909,'8289-2;'),
(15884,'15884','','lrhand','true',1740,1,1,'fine_steel','s84',532,10,'bigsword',8,0.00000,0,0,0,325,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,15907,'8297-1;'),
(15885,'15885','','lrhand','true',1740,1,1,'fine_steel','s84',532,10,'bigsword',8,0.00000,0,0,0,325,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,15908,'3013-5;'),
(15886,'15886','','lrhand','true',1550,1,1,'fine_steel','s84',532,5,'dualfist',4,4.00000,0,0,0,325,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,3571,1,43,0,'3552-1;'),
(15887,'15887','','lrhand','true',1550,1,1,'fine_steel','s84',532,5,'dualfist',4,4.00000,0,0,0,325,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'8289-2;'),
(15888,'15888','','lrhand','true',1550,1,1,'fine_steel','s84',532,5,'dualfist',4,4.00000,0,0,0,325,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3013-5;'),
(15889,'15889','','lrhand','true',2010,1,1,'fine_steel','s84',437,10,'pole',8,-3.00000,0,0,0,325,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3599-1;8297-1;'),
(15890,'15890','','lrhand','true',2010,1,1,'fine_steel','s84',437,10,'pole',8,-3.00000,0,0,0,325,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3013-4;'),
(15891,'15891','','lrhand','true',2010,1,1,'fine_steel','s84',437,10,'pole',8,-3.00000,0,0,0,325,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3602-7;'),
(15892,'15892','','rhand','true',1080,1,1,'fine_steel','s84',350,20,'blunt',4,4.00000,0,0,0,379,0,256,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3014-3;'),
(15893,'15893','','rhand','true',1080,1,1,'fine_steel','s84',350,20,'blunt',4,4.00000,0,0,0,379,0,256,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3047-3;'),
(15894,'15894','','rhand','true',1080,1,1,'fine_steel','s84',350,20,'blunt',4,4.00000,0,0,0,379,0,256,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3576-2;'),
(15895,'15895','','lrhand','true',1080,1,1,'fine_steel','s84',426,20,'bigblunt',4,4.00000,0,0,0,325,0,281,-1,-1,0,9872,'true','true','true','true','true',0,0,3577,1,20,0,0,0,0,'3552-1;'),
(15896,'15896','','lrhand','true',1080,1,1,'fine_steel','s84',426,20,'bigblunt',4,4.00000,0,0,0,325,0,281,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3575-4;'),
(15897,'15897','','lrhand','true',1080,1,1,'fine_steel','s84',426,20,'bigblunt',4,4.00000,0,0,0,325,0,281,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3576-2;'),
(15898,'15898','','rhand','true',1520,1,1,'fine_steel','s84',350,10,'sword',8,0.00000,0,0,0,379,0,256,-1,-1,0,9872,'true','true','true','true','true',0,0,3577,1,20,0,0,0,0,'3552-1;'),
(15899,'15899','','rhand','true',1520,1,1,'fine_steel','s84',350,10,'sword',8,0.00000,0,0,0,379,0,256,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3014-3;'),
(15900,'15900','','rhand','true',1520,1,1,'fine_steel','s84',350,10,'sword',8,0.00000,0,0,0,379,0,256,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,0,'3047-3;'),
(15901,'15901','','lrhand','true',1520,1,1,'fine_steel','s84',794,5,'bow',12,-3.00000,0,0,0,293,12,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,3574,3,44,15912,'3552-1;'),
(15902,'15902','','lrhand','true',1520,1,1,'fine_steel','s84',794,5,'bow',12,-3.00000,0,0,0,293,12,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,15910,'3552-1;'),
(15903,'15903','','lrhand','true',1520,1,1,'fine_steel','s84',794,5,'bow',12,-3.00000,0,0,0,293,12,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,15911,'8289-3;'),
(15904,'15904','','rhand','true',1280,1,1,'fine_steel','s84',396,40,'rapier',10,-1.00000,0,0,0,406,0,192,-1,-1,0,9872,'true','true','true','true','true',3426,1,0,0,0,0,0,0,15873,'8289-3;'),
(15905,'15905','','rhand','true',1280,1,1,'fine_steel','s84',396,40,'rapier',10,-1.00000,0,0,0,406,0,192,-1,-1,0,9872,'true','true','true','true','true',3426,1,0,0,0,0,0,0,15871,'8297-1;'),
(15906,'15906','','rhand','true',1280,1,1,'fine_steel','s84',396,40,'rapier',10,-1.00000,0,0,0,406,0,192,-1,-1,0,9872,'true','true','true','true','true',3426,1,0,0,0,0,0,0,15872,'3013-5;'),
(15907,'15907','','lrhand','true',1800,1,1,'fine_steel','s84',473,15,'ancient',8,2.00000,0,0,0,350,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,15885,'8289-2;'),
(15908,'15908','','lrhand','true',1800,1,1,'fine_steel','s84',473,15,'ancient',8,2.00000,0,0,0,350,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,15883,'8297-1;'),
(15909,'15909','','lrhand','true',1800,1,1,'fine_steel','s84',473,15,'ancient',8,2.00000,0,0,0,350,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,15884,'3013-5;'),
(15910,'15910','','rhand','true',1580,1,1,'fine_steel','s84',487,10,'crossbow',10,-1.00000,0,0,0,303,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,3574,3,24,15903,'3552-1;'),
(15911,'15911','','rhand','true',1580,1,1,'fine_steel','s84',487,10,'crossbow',10,-1.00000,0,0,0,303,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,15901,'3552-1;'),
(15912,'15912','','rhand','true',1580,1,1,'fine_steel','s84',487,10,'crossbow',10,-1.00000,0,0,0,303,0,192,-1,-1,0,9872,'true','true','true','true','true',0,0,0,0,0,0,0,0,15902,'8289-3;'),
(16152,'16152','','lrhand','true',2050,1,1,'fine_steel','s84',415,10,'dualdagger',12,-3.00000,0,0,0,433,0,183,-1,-1,0,9872,'true','true','true','true','true',3044,20,0,0,0,0,0,0,0,'0-0;'),
(16154,'16154','','lrhand','true',1520,1,1,'fine_steel','s84',505,10,'dual',8,0.00000,0,0,0,325,0,183,-1,-1,0,8233,'true','true','true','true','true',3411,1,0,0,0,0,0,0,0,'0-0;'),
(16156,'16156','','lrhand','true',2050,1,1,'fine_steel','s84',437,10,'dualdagger',12,-3.00000,0,0,0,433,0,192,-1,-1,0,11421,'true','true','true','true','true',3044,20,0,0,0,0,0,0,0,'0-0;'),
(16158,'16158','','lrhand','true',1520,1,1,'fine_steel','s84',532,10,'dual',8,0.00000,0,0,0,325,0,192,-1,-1,0,9872,'true','true','true','true','true',3411,1,0,0,0,0,0,0,0,'0-0;');

/************ Add by pmq *********/
-- �a���D��
UPDATE `etcitem` SET `handler` = 'PaganKeys' WHERE `item_id` = '9685';  -- �·t�������_��
UPDATE `etcitem` SET `handler` = 'PaganKeys' WHERE `item_id` = '9686';  -- �}�a�������_��
UPDATE `etcitem` SET `handler` = 'PaganKeys' WHERE `item_id` = '9687';  -- �大�����_��
REPLACE INTO `etcitem` VALUES (9849,'Fiery Demon Blood','','false','herb',0,'normal','paper','none',-1,-1,0,0,'true','true','true','true','true','ItemSkills','2357-1;');  -- �c�]�ż�����

-- ����}�a�� �F��������
REPLACE INTO `minions` VALUES (22363, 22364, 4, 4);
REPLACE INTO `minions` VALUES (22370, 22371, 4, 4);

-- �W�[ SteelCitade 1/F 2/F
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (22363,22365,22367,22368,22369,22370,22372);
DELETE FROM `custom_spawnlist` WHERE `npc_templateid` IN (22363,22365,22367,22368,22369,22370,22372);
INSERT INTO `custom_spawnlist` VALUES
('', '', 1, 22363, 16290, 282328, -9709, 0, 0, 15719, 120, 0, 0),
('', '', 1, 22363, 16287, 281847, -9709, 0, 0, 50191, 120, 0, 0),
('', '', 1, 22368, 18755, 280971, -9710, 0, 0, 381, 120, 0, 0),
('', '', 1, 22367, 19884, 280967, -9710, 0, 0, 31385, 120, 0, 0),
('', '', 1, 22365, 18389, 280744, -9710, 0, 0, 434, 120, 0, 0),
('', '', 1, 22367, 19681, 280509, -9710, 0, 0, 32912, 120, 0, 0),
('', '', 1, 22365, 17709, 280523, -9710, 0, 0, 1265, 120, 0, 0),
('', '', 1, 22369, 18277, 280519, -9710, 0, 0, 65380, 120, 0, 0),
('', '', 1, 22369, 18924, 280523, -9710, 0, 0, 32100, 120, 0, 0),
('', '', 1, 22367, 19258, 279942, -9710, 0, 0, 65089, 120, 0, 0),
('', '', 1, 22367, 13470, 282570, -9710, 0, 0, 16162, 120, 0, 0),
('', '', 1, 22367, 18273, 279953, -9710, 0, 0, 406, 120, 0, 0),
('', '', 1, 22365, 18362, 279668, -9710, 0, 0, 525, 120, 0, 0),
('', '', 1, 22369, 18689, 279678, -9710, 0, 0, 448, 120, 0, 0),
('', '', 1, 22365, 19120, 279672, -9710, 0, 0, 65149, 120, 0, 0),
('', '', 1, 22369, 18902, 279414, -9710, 0, 0, 89, 120, 0, 0),
('', '', 1, 22369, 13701, 282933, -9710, 0, 0, 17019, 120, 0, 0),
('', '', 1, 22368, 19703, 279685, -9710, 0, 0, 31728, 120, 0, 0),
('', '', 1, 22368, 19799, 279411, -9710, 0, 0, 31886, 120, 0, 0),
('', '', 1, 22365, 19857, 278725, -9710, 0, 0, 32607, 120, 0, 0),
('', '', 1, 22368, 19805, 278942, -9710, 0, 0, 34993, 120, 0, 0),
('', '', 1, 22368, 19493, 278723, -9710, 0, 0, 34230, 120, 0, 0),
('', '', 1, 22365, 19120, 278733, -9710, 0, 0, 33455, 120, 0, 0),
('', '', 1, 22369, 18817, 278731, -9710, 0, 0, 32941, 120, 0, 0),
('', '', 1, 22367, 19753, 278498, -9710, 0, 0, 32246, 120, 0, 0),
('', '', 1, 22369, 19232, 278732, -9710, 0, 0, 896, 120, 0, 0),
('', '', 1, 22365, 19244, 278045, -9709, 0, 0, 64735, 120, 0, 0),
('', '', 1, 22369, 19190, 277515, -9710, 0, 0, 49267, 120, 0, 0),
('', '', 1, 22365, 18543, 277340, -9710, 0, 0, 32767, 120, 0, 0),
('', '', 1, 22369, 18757, 277083, -9710, 0, 0, 64442, 120, 0, 0),
('', '', 1, 22367, 18377, 276792, -9710, 0, 0, 62597, 120, 0, 0),
('', '', 1, 22368, 19526, 276891, -9709, 0, 0, 0, 120, 0, 0),
('', '', 1, 22365, 19880, 276892, -9710, 0, 0, 29, 120, 0, 0),
('', '', 1, 22367, 19518, 276690, -9710, 0, 0, 37501, 120, 0, 0),
('', '', 1, 22365, 15419, 283358, -9710, 0, 0, 48804, 120, 0, 0),
('', '', 1, 22367, 15199, 283193, -9710, 0, 0, 48866, 120, 0, 0),
('', '', 1, 22368, 14958, 282490, -9710, 0, 0, 49264, 120, 0, 0),
('', '', 1, 22368, 14380, 283653, -9710, 0, 0, 32372, 120, 0, 0),
('', '', 1, 22365, 14379, 282802, -9710, 0, 0, 49139, 120, 0, 0),
('', '', 1, 22367, 14170, 282812, -9710, 0, 0, 15109, 120, 0, 0),
('', '', 1, 22369, 14170, 283242, -9710, 0, 0, 15986, 120, 0, 0),
('', '', 1, 22368, 13946, 283012, -9710, 0, 0, 15955, 120, 0, 0),
('', '', 1, 22365, 13932, 282531, -9710, 0, 0, 49238, 120, 0, 0),
('', '', 1, 22368, 13459, 283155, -9710, 0, 0, 16749, 120, 0, 0),
('', '', 1, 22365, 13475, 283672, -9710, 0, 0, 16061, 120, 0, 0),
('', '', 1, 22369, 13248, 283522, -9709, 0, 0, 49310, 120, 0, 0),
('', '', 1, 22367, 13249, 283068, -9709, 0, 0, 49381, 120, 0, 0),
('', '', 1, 22369, 13235, 282705, -9710, 0, 0, 49151, 120, 0, 0),
('', '', 1, 22365, 13000, 282703, -9710, 0, 0, 16726, 120, 0, 0),
('', '', 1, 22368, 12772, 283174, -9710, 0, 0, 53514, 120, 0, 0),
('', '', 1, 22367, 13003, 283655, -9710, 0, 0, 46111, 120, 0, 0),
('', '', 1, 22365, 12734, 283802, -9710, 0, 0, 50338, 120, 0, 0),
('', '', 1, 22368, 12748, 281470, -9710, 0, 0, 16123, 120, 0, 0),
('', '', 1, 22367, 13648, 281478, -9710, 0, 0, 32478, 120, 0, 0),
('', '', 1, 22368, 14285, 281484, -9710, 0, 0, 999, 120, 0, 0),
('', '', 1, 22369, 14018, 281701, -9710, 0, 0, 30640, 120, 0, 0),
('', '', 1, 22365, 13469, 281697, -9710, 0, 0, 32998, 120, 0, 0),
('', '', 1, 22368, 14739, 281691, -9710, 0, 0, 49151, 120, 0, 0),
('', '', 1, 22367, 14955, 281437, -9710, 0, 0, 49151, 120, 0, 0),
('', '', 1, 22369, 15190, 281139, -9713, 0, 0, 47583, 120, 0, 0),
('', '', 1, 22365, 15213, 281654, -9710, 0, 0, 49151, 120, 0, 0),
('', '', 1, 22365, 15195, 280519, -9710, 0, 0, 15148, 120, 0, 0),
('', '', 1, 22368, 14831, 280310, -9710, 0, 0, 63609, 120, 0, 0),
('', '', 1, 22369, 14731, 280993, -9710, 0, 0, 16706, 120, 0, 0),
('', '', 1, 22365, 13584, 281252, -9710, 0, 0, 34128, 120, 0, 0),
('', '', 1, 22369, 13822, 281028, -9710, 0, 0, 0, 120, 0, 0),
('', '', 1, 22369, 13173, 281029, -9710, 0, 0, 32824, 120, 0, 0),
('', '', 1, 22368, 12750, 281018, -9713, 0, 0, 64923, 120, 0, 0),
('', '', 1, 22365, 12969, 280740, -9710, 0, 0, 64856, 120, 0, 0),
('', '', 1, 22367, 13616, 280744, -9710, 0, 0, 65045, 120, 0, 0),
('', '', 1, 22365, 14322, 280744, -9710, 0, 0, 31587, 120, 0, 0),
('', '', 1, 22369, 14174, 280528, -9710, 0, 0, 33019, 120, 0, 0),
('', '', 1, 22368, 13699, 280524, -9710, 0, 0, 62180, 120, 0, 0),
('', '', 1, 22369, 13905, 280305, -9710, 0, 0, 32614, 120, 0, 0),
('', '', 1, 22367, 13182, 280316, -9710, 0, 0, 32393, 120, 0, 0),
('', '', 1, 22368, 12720, 280289, -9710, 0, 0, 34630, 120, 0, 0),
('', '', 1, 22368, 12963, 279970, -9713, 0, 0, 32854, 120, 0, 0),
('', '', 1, 22369, 13002, 279682, -9710, 0, 0, 32767, 120, 0, 0),
('', '', 1, 22365, 14423, 279946, -9710, 0, 0, 65290, 120, 0, 0),
('', '', 1, 22368, 14089, 279699, -9710, 0, 0, 33316, 120, 0, 0),
('', '', 1, 22367, 13554, 279691, -9710, 0, 0, 32835, 120, 0, 0),
('', '', 1, 22369, 13893, 279438, -9710, 0, 0, 32344, 120, 0, 0),
('', '', 1, 22365, 13375, 279445, -9710, 0, 0, 32677, 120, 0, 0),
('', '', 1, 22367, 12881, 279449, -9710, 0, 0, 32516, 120, 0, 0),
('', '', 1, 22368, 13459, 279196, -9710, 0, 0, 360, 120, 0, 0),
('', '', 1, 22369, 13754, 278971, -9710, 0, 0, 553, 120, 0, 0),
('', '', 1, 22367, 13310, 278975, -9710, 0, 0, 32658, 120, 0, 0),
('', '', 1, 22365, 12920, 278977, -9710, 0, 0, 32635, 120, 0, 0),
('', '', 1, 22369, 13727, 278723, -9709, 0, 0, 65259, 120, 0, 0),
('', '', 1, 22369, 13164, 278733, -9710, 0, 0, 32426, 120, 0, 0),
('', '', 1, 22368, 13152, 278517, -9713, 0, 0, 33241, 120, 0, 0),
('', '', 1, 22367, 13144, 278274, -9709, 0, 0, 65349, 120, 0, 0),
('', '', 1, 22368, 13647, 278278, -9710, 0, 0, 32914, 120, 0, 0),
('', '', 1, 22369, 12852, 278056, -9710, 0, 0, 65082, 120, 0, 0),
('', '', 1, 22368, 12839, 277811, -9710, 0, 0, 63532, 120, 0, 0),
('', '', 1, 22369, 13862, 278060, -9710, 0, 0, 65031, 120, 0, 0),
('', '', 1, 22365, 13381, 278064, -9713, 0, 0, 32681, 120, 0, 0),
('', '', 1, 22367, 13971, 277821, -9710, 0, 0, 31622, 120, 0, 0),
('', '', 1, 22368, 13381, 277819, -9710, 0, 0, 33388, 120, 0, 0),
('', '', 1, 22369, 13716, 277594, -9710, 0, 0, 31113, 120, 0, 0),
('', '', 1, 22367, 14399, 277473, -9710, 0, 0, 32691, 120, 0, 0),
('', '', 1, 22367, 12896, 277352, -9710, 0, 0, 521, 120, 0, 0),
('', '', 1, 22365, 13096, 277598, -9710, 0, 0, 64117, 120, 0, 0),
('', '', 1, 22365, 13535, 277350, -9710, 0, 0, 32853, 120, 0, 0),
('', '', 1, 22368, 13979, 277111, -9710, 0, 0, 25154, 120, 0, 0),
('', '', 1, 22365, 13549, 276847, -9710, 0, 0, 49648, 120, 0, 0),
('', '', 1, 22369, 12969, 276905, -9710, 0, 0, 65173, 120, 0, 0),
('', '', 1, 22367, 13879, 276872, -9710, 0, 0, 32938, 120, 0, 0),
('', '', 1, 22365, 14355, 276794, -9710, 0, 0, 32465, 120, 0, 0),
('', '', 1, 22370, 19751, 277009, -7558, 0, 0, 49582, 120, 0, 0),
('', '', 1, 22370, 19751, 278028, -7558, 0, 0, 49681, 120, 0, 0),
('', '', 1, 22370, 19747, 279082, -7558, 0, 0, 49151, 120, 0, 0),
('', '', 1, 22370, 19752, 280123, -7558, 0, 0, 48646, 120, 0, 0),
('', '', 1, 22370, 19288, 280127, -7558, 0, 0, 16800, 120, 0, 0),
('', '', 1, 22370, 19284, 279089, -7558, 0, 0, 15983, 120, 0, 0),
('', '', 1, 22370, 19285, 278024, -7558, 0, 0, 17441, 120, 0, 0),
('', '', 1, 22370, 19288, 276979, -7558, 0, 0, 15260, 120, 0, 0),
('', '', 1, 22370, 18812, 276976, -7558, 0, 0, 49795, 120, 0, 0),
('', '', 1, 22370, 18812, 278022, -7558, 0, 0, 49391, 120, 0, 0),
('', '', 1, 22370, 18807, 279088, -7558, 0, 0, 49289, 120, 0, 0),
('', '', 1, 22370, 18809, 280128, -7558, 0, 0, 48425, 120, 0, 0),
('', '', 1, 22370, 18343, 280125, -7558, 0, 0, 16584, 120, 0, 0),
('', '', 1, 22370, 18354, 279084, -7558, 0, 0, 14193, 120, 0, 0),
('', '', 1, 22370, 18349, 278023, -7558, 0, 0, 16383, 120, 0, 0),
('', '', 1, 22370, 18346, 276961, -7558, 0, 0, 16383, 120, 0, 0),
('', '', 1, 22370, 16552, 276721, -7556, 0, 0, 1780, 120, 0, 0),
('', '', 1, 22370, 16554, 277284, -7556, 0, 0, 65142, 120, 0, 0),
('', '', 1, 22370, 16556, 277847, -7556, 0, 0, 65170, 120, 0, 0),
('', '', 1, 22372, 15988, 277852, -7556, 0, 0, 512, 120, 0, 0),
('', '', 1, 22372, 15990, 277285, -7556, 0, 0, 578, 120, 0, 0),
('', '', 1, 22372, 15993, 276724, -7556, 0, 0, 64654, 120, 0, 0),
('', '', 1, 22370, 14843, 277368, -7558, 0, 0, 49580, 120, 0, 0),
('', '', 1, 22372, 14841, 277060, -7558, 0, 0, 16383, 120, 0, 0),
('', '', 1, 22372, 14843, 277704, -7558, 0, 0, 16183, 120, 0, 0),
('', '', 1, 22370, 13222, 276596, -7558, 0, 0, 32841, 120, 0, 0),
('', '', 1, 22370, 13369, 277449, -7556, 0, 0, 49795, 120, 0, 0),
('', '', 1, 22370, 13745, 277448, -7556, 0, 0, 49712, 120, 0, 0),
('', '', 1, 22372, 13747, 277728, -7558, 0, 0, 48585, 120, 0, 0),
('', '', 1, 22372, 13360, 277720, -7558, 0, 0, 47854, 120, 0, 0),
('', '', 1, 22370, 13742, 279238, -7556, 0, 0, 15657, 120, 0, 0),
('', '', 1, 22370, 13367, 279241, -7556, 0, 0, 15131, 120, 0, 0),
('', '', 1, 22372, 13375, 279471, -7558, 0, 0, 17184, 120, 0, 0),
('', '', 1, 22372, 13750, 279480, -7558, 0, 0, 15640, 120, 0, 0),
('', '', 1, 22370, 13371, 280419, -7556, 0, 0, 13536, 120, 0, 0),
('', '', 1, 22372, 13369, 280658, -7558, 0, 0, 16383, 120, 0, 0),
('', '', 1, 22370, 13746, 280420, -7556, 0, 0, 16779, 120, 0, 0),
('', '', 1, 22372, 13742, 280662, -7558, 0, 0, 16383, 120, 0, 0),
('', '', 1, 32302, 13293, 282023, -7555, 0, 0, 38182, 120, 0, 0);

-- Custom NPC Buffer for npc 1000003
-- (`npc_id`, `skill_id`, `skill_level`, `skill_fee_id`, `skill_fee_amount`, `buff_group`)
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 10, 8, 57, 100, 10);       -- �l��ɭ�����
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 22, 7, 57, 100, 22);       -- �l��l�崹��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 33, 8, 57, 100, 33);       -- �l��z�Z����
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 67, 7, 57, 100, 67);       -- �l��v¡����
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 264, 1, 57, 100, 264);     -- �j�a���q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 265, 1, 57, 100, 265);     -- �ͩR���q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 266, 1, 57, 100, 266);     -- ���F���q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 267, 1, 57, 100, 267);     -- �@�ä��q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 268, 1, 57, 100, 268);     -- ���F���q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 269, 1, 57, 100, 269);     -- �y�̤��q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 270, 1, 57, 100, 270);     -- ���@���q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 271, 1, 57, 100, 271);     -- �Ԥh���R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 272, 1, 57, 100, 272);     -- �h�𤧻R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 273, 1, 57, 100, 273);     -- �������R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 274, 1, 57, 100, 274);     -- ���F���R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 275, 1, 57, 100, 275);     -- �g�ɤ��R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 276, 1, 57, 100, 276);     -- �M�`���R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 277, 1, 57, 100, 277);     -- ��ģ���R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 278, 6, 57, 100, 278);     -- �l��r�D����
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 304, 1, 57, 100, 304);     -- �ӧQ���q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 305, 1, 57, 100, 305);     -- �_�����q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 306, 1, 57, 100, 306);     -- �ܤ����q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 307, 1, 57, 100, 307);     -- �ܤ����R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 308, 1, 57, 100, 308);     -- �ܭ����q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 309, 1, 57, 100, 309);     -- �ܦa���R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 310, 1, 57, 100, 310);     -- �l�大�R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 311, 1, 57, 100, 311);     -- �O�@���R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 349, 1, 57, 100, 349);     -- �Ĩ����q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 363, 1, 57, 100, 363);     -- �I�䤧�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 364, 1, 57, 100, 364);     -- ���̤��q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 365, 1, 57, 100, 365);     -- �A�b���R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 366, 1, 57, 100, 366);     -- ��v���R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 367, 1, 57, 100, 367);     -- �����蠟�R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 395, 1, 57, 100, 395);     -- �^�����_��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 396, 1, 57, 100, 396);     -- �^�����g��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 529, 1, 57, 100, 529);     -- �������q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 530, 1, 57, 100, 530);     -- �ε����R
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 783, 1, 57, 100, 783);     -- �l���o�z����
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1002, 3, 57, 100, 1002);   -- �F���|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1003, 3, 57, 100, 1003);   -- ����߼ڤO�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1004, 3, 57, 100, 1004);   -- ����߼ڴ��z
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1005, 3, 57, 100, 1005);   -- ����߼گ���
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1006, 3, 57, 100, 1006);   -- �t���|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1007, 2, 57, 100, 1007);   -- �g�Թ|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1008, 3, 57, 100, 1008);   -- ����߼ںa��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1009, 3, 57, 100, 1009);   -- �K���|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1010, 3, 57, 100, 1010);   -- �t�F����
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1032, 3, 57, 100, 1032);   -- �R�K���O
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1033, 3, 57, 100, 1033);   -- �r�ʩ��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1035, 4, 57, 100, 1035);   -- ���F���@
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1036, 2, 57, 100, 1036);   -- �]�k�̻�
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1040, 3, 57, 100, 1040);   -- �O�@��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1043, 1, 57, 100, 1043);   -- ���t�Z��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1044, 3, 57, 100, 1044);   -- �j¡�N
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1045, 6, 57, 100, 1045);   -- ��������
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1048, 6, 57, 100, 1048);   -- ��������
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1059, 3, 57, 100, 1059);   -- �]�O�ʤ�
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1062, 2, 57, 100, 1062);   -- �g�Ԥh��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1068, 3, 57, 100, 1068);   -- �O�q�j��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1077, 3, 57, 100, 1077);   -- �z�I����
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1078, 6, 57, 100, 1078);   -- �믫�M�`
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1085, 3, 57, 100, 1085);   -- �F�����
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1086, 2, 57, 100, 1086);   -- �t�׿E�o
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1087, 3, 57, 100, 1087);   -- �ӱ��N
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1182, 3, 57, 100, 1182);   -- �������@
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1189, 3, 57, 100, 1189);   -- �������@
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1191, 3, 57, 100, 1191);   -- �������@
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1204, 2, 57, 100, 1204);   -- �����e��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1240, 3, 57, 100, 1240);   -- �ɤ�
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1242, 3, 57, 100, 1242);   -- �����O��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1243, 6, 57, 100, 1243);   -- ���֤���
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1249, 3, 57, 100, 1249);   -- ����߼ڤ���
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1250, 3, 57, 100, 1250);   -- ����߼ڤ���
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1251, 2, 57, 100, 1251);   -- �g�ɹ|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1252, 3, 57, 100, 1252);   -- �j�׹|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1253, 3, 57, 100, 1253);   -- ����|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1256, 13, 57, 100, 1256);  -- ����߼ڤ���
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1259, 4, 57, 100, 1259);   -- ��ܥ�J
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1260, 3, 57, 100, 1260);   -- ����߼ڨ���
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1261, 2, 57, 100, 1261);   -- ����߼ڼ���
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1268, 4, 57, 100, 1268);   -- �l�����
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1279, 9, 57, 100, 1279);   -- �l��·�����
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1280, 9, 57, 100, 1280);   -- �l����G����
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1281, 9, 57, 100, 1281);   -- �l���������
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1284, 3, 57, 100, 1284);   -- �_���|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1303, 2, 57, 100, 1303);   -- �����]�O
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1308, 3, 57, 100, 1308);   -- ���ܹ|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1309, 3, 57, 100, 1309);   -- �y�N�|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1310, 4, 57, 100, 1310);   -- �ݦ�|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1323, 1, 57, 100, 1323);   -- �Q�ڪ�����
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1325, 1, 57, 100, 1325);   -- �Q�ڪ��j�B
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1352, 1, 57, 100, 1352);   -- �����[�@
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1353, 1, 57, 100, 1353);   -- ���t�[�@
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1355, 1, 57, 100, 1355);   -- �����w��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1356, 1, 57, 100, 1356);   -- �����w��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1357, 1, 57, 100, 1357);   -- �����w��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1362, 1, 57, 100, 1362);   -- �t�F�|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1363, 1, 57, 100, 1363);   -- �ͱ۹|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1364, 1, 57, 100, 1364);   -- ����߼ھ���
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1365, 1, 57, 100, 1365);   -- ����߼ڤ���
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1374, 1, 57, 100, 1374);   -- �^�����i��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1388, 3, 57, 100, 1388);   -- ���ŤO�q�j��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1389, 3, 57, 100, 1389);   -- ���ūO�@��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1390, 3, 57, 100, 1390);   -- �Ԫ��|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1391, 3, 57, 100, 1391);   -- �j�a�|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1392, 3, 57, 100, 1392);   -- �t�����@
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1393, 3, 57, 100, 1393);   -- �t�����@
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1397, 3, 57, 100, 1397);   -- �ẫ���
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 1413, 1, 57, 100, 1413);   -- ���׹|�q
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 4699, 10, 57, 100, 4699);  -- �ӦZ������
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 4700, 10, 57, 100, 4700);  -- �ӦZ��§��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 4701, 10, 57, 100, 4701);  -- �ӦZ�����d
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 4702, 10, 57, 100, 4702);  -- ���l�ѨϪ�����
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 4703, 10, 57, 100, 4703);  -- ���l�ѨϪ�§��
REPLACE INTO `custom_npc_buffer` VALUES (1000003, 4704, 10, 57, 100, 4704);  -- ���l�ѨϪ�����

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
UPDATE `npc` SET `level`=81, `hp`=4439, `mp`=1881, `exp`=16123, `sp`=1680 where id='22341';               -- �͹F�h
UPDATE `npc` SET `level`=81, `hp`=3461, `mp`=1708, `exp`=12425, `sp`=1325 where id='22342';               -- �F�����������
UPDATE `npc` SET `level`=81, `hp`=3461, `mp`=1708, `exp`=9997, `sp`=1066 where id='22343';                -- �F�������B�D��

REPLACE INTO `minions` VALUES (22448, 22451, 2, 2); -- �p�ڹF�� �ϧܭx�����x
REPLACE INTO `minions` VALUES (22449, 22450, 8, 8); -- ���ڤh�d�� ���ݱM�a

-- �c�Q��§���c�l
REPLACE INTO `droplist` VALUES (32342,9693,1,1,-1,700000);  -- �����H��

-- �R���a��NPC�ରAI�X�{
DELETE FROM `spawnlist` WHERE `npc_templateid` IN (32297,32354,32345,18463,18464,32355,32364,22341,22448);
-- HBCE
REPLACE INTO `etcitem` VALUES (13787,'Bond','','false','potion',180,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','ItemSkills','5849-1;');
REPLACE INTO `etcitem` VALUES (13788,'Land Mine','','false','potion',180,'stackable','paper','none',-1,-1,0,0,'true','true','true','true','true','ItemSkills','5851-1;');
UPDATE `npc` SET `type`='L2Block' where id='18672';      -- ���
UPDATE `npc` SET `type`='L2Block' where id='18676';      -- ���

