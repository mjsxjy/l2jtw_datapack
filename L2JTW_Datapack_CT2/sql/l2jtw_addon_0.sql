/************ Made in Taiwan ************/

/***** ����-���~��ƭץ� *****/
/***** ��NC�ץ���i������ơ� *****/
-- NC�]�w`crystallizable` = 'true'���~�A�ץ� = 'false' --
UPDATE `armor` SET `crystallizable` = 'false'   WHERE `item_id` IN (9826); -- �۶H�Z��-���}§�c ���˥�
/***** ��NC�ץ���i������ơ� *****/

/***** �Z��-���~��ƭץ� *****/
/***** ��NC�ץ���i������ơ� *****/
-- NC�]�w`critical` = '8'���~?�A�ץ� = '6' --
UPDATE `weapon` SET `critical` = '6' WHERE `weaponType` = '13'; -- �j�N�C(�P�R�l�[)

-- NC�]�w`atk_speed` = '379'�A�ץ� = '325' --
UPDATE `weapon` SET `atk_speed` = '325' WHERE `item_id` IN (10252,10527,10528,10529); -- �����]��(�����t��)
UPDATE `weapon` SET `atk_speed` = '325' WHERE `item_id` IN (10530,10531,10532); -- ���·�����(�����t��)

/*** ��ѨϱM�ΪZ���G�ӼC ***/
/*** �j��4�H�W���ܡA�P�R�����ɱN�|�H�@�w�����v���ɦۤv�M������̪����z�����O�B�]�k�����O�M�Ҩ����v¡�q�A�õo���ϥΧޯ�ɭ��CMP���Ӷq���ĪG�C ***/
UPDATE `weapon` SET `enchant4_skill_id` = '3426', `enchant4_skill_lvl` = '1' WHERE `weaponType` = 'rapier'; --  �Ҧ��ӼC
/*** ���αj��4�H�W�A�����ᤩ ***/
UPDATE `weapon` SET `enchant4_skill_id` = '0', `enchant4_skill_lvl` = '0', `skill` = '3427-1;3426-1;' WHERE `item_id` = '9388'; --  �L�����{

/***** Done by vdmyagami�I *****/