ALTER TABLE characters MODIFY `account_name` VARCHAR(45) DEFAULT NULL;
ALTER TABLE characters MODIFY `obj_Id` INT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `char_name` VARCHAR(35) NOT NULL;
ALTER TABLE characters MODIFY `level` TINYINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `maxHp` MEDIUMINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `curHp` MEDIUMINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `maxCp` MEDIUMINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `curCp` MEDIUMINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `maxMp` MEDIUMINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `curMp` MEDIUMINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `face` TINYINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `hairStyle` TINYINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `hairColor` TINYINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `sex` TINYINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `heading` MEDIUMINT DEFAULT NULL;
ALTER TABLE characters MODIFY `x` MEDIUMINT DEFAULT NULL;
ALTER TABLE characters MODIFY `y` MEDIUMINT DEFAULT NULL;
ALTER TABLE characters MODIFY `z` MEDIUMINT DEFAULT NULL;
ALTER TABLE characters MODIFY `exp` BIGINT UNSIGNED DEFAULT 0;
ALTER TABLE characters MODIFY `expBeforeDeath` BIGINT UNSIGNED DEFAULT 0;
ALTER TABLE characters MODIFY `sp` INT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `karma` INT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `pvpkills` SMALLINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `pkkills` SMALLINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `clanid` INT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `race` TINYINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `classid` TINYINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `base_class` TINYINT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `transform_id` SMALLINT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `deletetime` BIGINT DEFAULT NULL;
ALTER TABLE characters MODIFY `cancraft` TINYINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `title` VARCHAR(16) DEFAULT NULL;
ALTER TABLE characters MODIFY `rec_have` TINYINT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `rec_left` TINYINT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `accesslevel` MEDIUMINT DEFAULT 0;
ALTER TABLE characters MODIFY `online` TINYINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `onlinetime` INT DEFAULT NULL;
ALTER TABLE characters MODIFY `char_slot` TINYINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `newbie` MEDIUMINT UNSIGNED DEFAULT 1;
ALTER TABLE characters MODIFY `lastAccess` BIGINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `clan_privs` MEDIUMINT UNSIGNED DEFAULT 0;
ALTER TABLE characters MODIFY `wantspeace` TINYINT UNSIGNED DEFAULT 0;
ALTER TABLE characters MODIFY `isin7sdungeon` TINYINT UNSIGNED NOT NULL default 0;
ALTER TABLE characters MODIFY `in_jail` TINYINT UNSIGNED DEFAULT 0;
ALTER TABLE characters MODIFY `jail_timer` INT UNSIGNED DEFAULT 0;
ALTER TABLE characters MODIFY `power_grade` TINYINT UNSIGNED DEFAULT NULL;
ALTER TABLE characters MODIFY `nobless` TINYINT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `subpledge` SMALLINT NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `last_recom_date` BIGINT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `lvl_joined_academy` TINYINT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `apprentice` INT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `sponsor` INT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `varka_ketra_ally` TINYINT NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `clan_join_expiry_time` BIGINT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `clan_create_expiry_time` BIGINT UNSIGNED NOT NULL DEFAULT 0;
ALTER TABLE characters MODIFY `death_penalty_level` SMALLINT UNSIGNED NOT NULL DEFAULT 0;