/************ Made in Taiwan ************/

/************ CT 2.5 �t�l�ϩR�ץ� ************/

-- ���O�אּ�q��,���A����/��/�k/��Ѩ�
UPDATE `armor` SET `armor_type` = 'none' WHERE `item_id` IN (13687,13890,14609); -- ���ˤ��O��q�Τ��O
UPDATE `items` SET `item_id` = 13687 WHERE `item_id` IN (13688,13689,13690); -- ��/�k/��ѨϪ��M�h���O��q�Τ��O
UPDATE `items` SET `item_id` = 13890 WHERE `item_id` IN (13889,13891,13892); -- ��/�k/��ѨϪ��t�F���O��q�Τ��O
UPDATE `items` SET `item_id` = 14609 WHERE `item_id` IN (14601,14602,14608,14610); -- ��/�k/��ѨϪ��j�N���O��q�Τ��O
DELETE FROM `merchant_buylists` WHERE `item_id` IN (13688,13689,13690,13889,13891,13892,14601,14602,14608,14610); -- �R����/�k/��ѨϪ����O���c��
