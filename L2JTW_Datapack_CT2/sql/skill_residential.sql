DROP TABLE IF EXISTS `skill_residential`;
CREATE TABLE `skill_residential` (
  `entityId` int(11) NOT NULL,
  `skillId` int(11) NOT NULL DEFAULT '0',
  `skillLevel` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entityId`,`skillId`)
);

INSERT INTO `skill_residential` VALUES
(1, 593, 1),
(1, 600, 1),
(1, 606, 1),
(2, 591, 1),
(2, 597, 1),
(2, 594, 1),
(3, 609, 1),
(3, 601, 1),
(3, 607, 1),
(4, 598, 1),
(4, 605, 1),
(5, 596, 1),
(5, 608, 1),
(6, 595, 1),
(6, 597, 1),
(6, 609, 1),
(7, 594, 1),
(7, 598, 1),
(7, 603, 1),
(8, 593, 1),
(8, 599, 1),
(8, 604, 1),
(9, 592, 1),
(9, 600, 1),
(9, 610, 1),
(101, 590, 1),
(101, 603, 1),
(102, 602, 1),
(102, 604, 1),
(103, 601, 1),
(103, 605, 1),
(104, 595, 1),
(104, 606, 1),
(105, 594, 1),
(105, 607, 1),
(106, 593, 1),
(106, 608, 1),
(107, 596, 1),
(107, 605, 1),
(108, 592, 1),
(108, 599, 1),
(109, 591, 1),
(109, 610, 1),
-- missing Marshland Fortress
(111, 590, 1),
(111, 608, 1),
(112, 590, 1),
(112, 608, 1),
(113, 604, 1),
(113, 610, 1),
(114, 605, 1),
(114, 609, 1),
(115, 599, 1),
(115, 604, 1),
(116, 598, 1),
(116, 603, 1),
(117, 597, 1),
(117, 602, 1),
(117, 610, 1),
(118, 596, 1),
(118, 601, 1),
(119, 592, 1),
(119, 595, 1),
(120, 591, 1),
(120, 594, 1),
(121, 590, 1),
(121, 593, 1);