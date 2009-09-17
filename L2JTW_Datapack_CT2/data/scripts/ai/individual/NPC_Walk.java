package ai.individual;

import ai.group_template.L2AttackableAIScript;
import java.util.Map;
import javolution.util.FastMap;
import net.sf.l2j.gameserver.ai.CtrlIntention;
import net.sf.l2j.gameserver.model.actor.L2Npc;
import net.sf.l2j.gameserver.model.actor.instance.L2PcInstance;
import net.sf.l2j.gameserver.model.L2CharPosition;

/**
 * NPC Walk script
 * Update by rocknow
 */
public class NPC_Walk extends L2AttackableAIScript
{
	private L2Npc wharf_patrol01, wharf_patrol02, wharf_patrol03, wharf_patrol04, suspicious_merchant01, suspicious_merchant02, suspicious_merchant03, suspicious_merchant04, suspicious_merchant05, suspicious_merchant06, suspicious_merchant07, suspicious_merchant08, suspicious_merchant09, suspicious_merchant10, suspicious_merchant11, suspicious_merchant12, suspicious_merchant13, suspicious_merchant14, suspicious_merchant15, suspicious_merchant16, suspicious_merchant17, suspicious_merchant18, suspicious_merchant19, suspicious_merchant20, suspicious_merchant21;
	private static Map<String, Object[]> walks = new FastMap<String, Object[]>();
	private void load()
	{
	walks.put("3565901", new Object[]{-55675,157012 ,-2034,"3565902"});
	walks.put("3565902", new Object[]{-55675,157012 ,-2064,"3565903"});
	walks.put("3565903", new Object[]{-55675,154797 ,-2680,"3565904"});
	walks.put("3565904", new Object[]{-55713,154341 ,-2544,"3565905"});
	walks.put("3565905", new Object[]{-52122,151759 ,-2568,"3565906"});
	walks.put("3565906", new Object[]{-50343,151559 ,-2768,"3565907"});
	walks.put("3565907", new Object[]{-48975,154986 ,-2272,"3565908"});
	walks.put("3565908", new Object[]{-50343,151559 ,-2768,"3565909"});
	walks.put("3565909", new Object[]{-52122,151759 ,-2568,"3565910"});
	walks.put("3565910", new Object[]{-55713,154341 ,-2544,"3565911"});
	walks.put("3565911", new Object[]{-55675,154797 ,-2680,"3565912"});
	walks.put("3565912", new Object[]{-55675,157012 ,-2064,"3565913"});
	walks.put("3565913", new Object[]{-55675,157012 ,-2034,"3565901"});
	walks.put("3569001", new Object[]{-28169,216864 ,-3544,"3569002"});
	walks.put("3569002", new Object[]{-29028,215089 ,-3672,"3569003"});
	walks.put("3569003", new Object[]{-30888,213455 ,-3656,"3569004"});
	walks.put("3569004", new Object[]{-31937,211656 ,-3656,"3569005"});
	walks.put("3569005", new Object[]{-30880,211006 ,-3552,"3569006"});
	walks.put("3569006", new Object[]{-27690,210004 ,-3272,"3569007"});
	walks.put("3569007", new Object[]{-25784,210108 ,-3272,"3569008"});
	walks.put("3569008", new Object[]{-21682,211459 ,-3272,"3569009"});
	walks.put("3569009", new Object[]{-18430,212927 ,-3704,"3569010"});
	walks.put("3569010", new Object[]{-16247,212795 ,-3664,"3569011"});
	walks.put("3569011", new Object[]{-16868,214267 ,-3648,"3569012"});
	walks.put("3569012", new Object[]{-17263,215887 ,-3552,"3569013"});
	walks.put("3569013", new Object[]{-18352,216841 ,-3504,"3569014"});
	walks.put("3569014", new Object[]{-17263,215887 ,-3552,"3569015"});
	walks.put("3569015", new Object[]{-16868,214267 ,-3648,"3569016"});
	walks.put("3569016", new Object[]{-16247,212795 ,-3664,"3569017"});
	walks.put("3569017", new Object[]{-18430,212927 ,-3704,"3569018"});
	walks.put("3569018", new Object[]{-21682,211459 ,-3272,"3569019"});
	walks.put("3569019", new Object[]{-25784,210108 ,-3272,"3569020"});
	walks.put("3569020", new Object[]{-27690,210004 ,-3272,"3569021"});
	walks.put("3569021", new Object[]{-30880,211006 ,-3552,"3569022"});
	walks.put("3569022", new Object[]{-31937,211656 ,-3656,"3569023"});
	walks.put("3569023", new Object[]{-30888,213455 ,-3656,"3569024"});
	walks.put("3569024", new Object[]{-29028,215089 ,-3672,"3569025"});
	walks.put("3569025", new Object[]{-28169,216864 ,-3544,"3569001"});
	walks.put("3572801", new Object[]{19408 ,189422 ,-3136,"3572802"});
	walks.put("3572802", new Object[]{20039 ,187700 ,-3416,"3572803"});
	walks.put("3572803", new Object[]{19016 ,185813 ,-3552,"3572804"});
	walks.put("3572804", new Object[]{17959 ,181955 ,-3680,"3572805"});
	walks.put("3572805", new Object[]{16440 ,181635 ,-3616,"3572806"});
	walks.put("3572806", new Object[]{15679 ,182540 ,-3608,"3572807"});
	walks.put("3572807", new Object[]{15310 ,182791 ,-3568,"3572808"});
	walks.put("3572808", new Object[]{15242 ,184507 ,-3112,"3572809"});
	walks.put("3572809", new Object[]{15310 ,182791 ,-3568,"3572810"});
	walks.put("3572810", new Object[]{15679 ,182540 ,-3608,"3572811"});
	walks.put("3572811", new Object[]{16440 ,181635 ,-3616,"3572812"});
	walks.put("3572812", new Object[]{17959 ,181955 ,-3680,"3572813"});
	walks.put("3572813", new Object[]{19016 ,185813 ,-3552,"3572814"});
	walks.put("3572814", new Object[]{20039 ,187700 ,-3416,"3572815"});
	walks.put("3572815", new Object[]{19408 ,189422 ,-3136,"3572801"});
	walks.put("3575901", new Object[]{123383,121093 ,-2864,"3575902"});
	walks.put("3575902", new Object[]{122670,120890 ,-3088,"3575903"});
	walks.put("3575903", new Object[]{124617,119069 ,-3088,"3575904"});
	walks.put("3575904", new Object[]{126177,118273 ,-3080,"3575905"});
	walks.put("3575905", new Object[]{125979,119528 ,-2728,"3575906"});
	walks.put("3575906", new Object[]{126177,118273 ,-3080,"3575907"});
	walks.put("3575907", new Object[]{124617,119069 ,-3088,"3575908"});
	walks.put("3575908", new Object[]{122670,120890 ,-3088,"3575909"});
	walks.put("3575909", new Object[]{123383,121093 ,-2864,"3575901"});
	walks.put("3579701", new Object[]{74725 ,1671   ,-3128,"3579702"});
	walks.put("3579702", new Object[]{76651 ,1505   ,-3552,"3579703"});
	walks.put("3579703", new Object[]{79421 ,4977   ,-3080,"3579704"});
	walks.put("3579704", new Object[]{77357 ,7197   ,-3208,"3579705"});
	walks.put("3579705", new Object[]{76287 ,9164   ,-3568,"3579706"});
	walks.put("3579706", new Object[]{72447 ,8196   ,-3264,"3579707"});
	walks.put("3579707", new Object[]{71780 ,7467   ,-3160,"3579708"});
	walks.put("3579708", new Object[]{72447 ,8196   ,-3264,"3579709"});
	walks.put("3579709", new Object[]{76287 ,9164   ,-3568,"3579710"});
	walks.put("3579710", new Object[]{77357 ,7197   ,-3208,"3579711"});
	walks.put("3579711", new Object[]{79421 ,4977   ,-3080,"3579712"});
	walks.put("3579712", new Object[]{76651 ,1505   ,-3552,"3579713"});
	walks.put("3579713", new Object[]{74725 ,1671   ,-3128,"3579701"});
	walks.put("3582801", new Object[]{159388,52392  ,-3317,"3582802"});
	walks.put("3582802", new Object[]{158407,52708  ,-3264,"3582803"});
	walks.put("3582803", new Object[]{159588,52684  ,-3328,"3582804"});
	walks.put("3582804", new Object[]{160872,53771  ,-3528,"3582805"});
	walks.put("3582805", new Object[]{162518,55063  ,-3672,"3582806"});
	walks.put("3582806", new Object[]{159388,52392  ,-3317,"3582801"});
	walks.put("3585901", new Object[]{190423,43540  ,-3656,"3585902"});
	walks.put("3585902", new Object[]{189579,45949  ,-4240,"3585903"});
	walks.put("3585903", new Object[]{187058,43551  ,-4808,"3585904"});
	walks.put("3585904", new Object[]{185916,41869  ,-4512,"3585905"});
	walks.put("3585905", new Object[]{185292,39403  ,-4200,"3585906"});
	walks.put("3585906", new Object[]{185167,38401  ,-4200,"3585907"});
	walks.put("3585907", new Object[]{184984,36863  ,-4152,"3585908"});
	walks.put("3585908", new Object[]{184377,36425  ,-4080,"3585909"});
	walks.put("3585909", new Object[]{185314,35866  ,-3936,"3585910"});
	walks.put("3585910", new Object[]{185781,35955  ,-3832,"3585911"});
	walks.put("3585911", new Object[]{186686,35667  ,-3752,"3585912"});
	walks.put("3585912", new Object[]{185781,35955  ,-3832,"3585913"});
	walks.put("3585913", new Object[]{185314,35866  ,-3936,"3585914"});
	walks.put("3585914", new Object[]{184377,36425  ,-4080,"3585915"});
	walks.put("3585915", new Object[]{184984,36863  ,-4152,"3585916"});
	walks.put("3585916", new Object[]{185167,38401  ,-4200,"3585917"});
	walks.put("3585917", new Object[]{185292,39403  ,-4200,"3585918"});
	walks.put("3585918", new Object[]{185916,41869  ,-4512,"3585919"});
	walks.put("3585919", new Object[]{187058,43551  ,-4808,"3585920"});
	walks.put("3585920", new Object[]{189579,45949  ,-4240,"3585921"});
	walks.put("3585921", new Object[]{190423,43540  ,-3656,"3585901"});
	walks.put("3589701", new Object[]{114436,202528 ,-3408,"3589702"});
	walks.put("3589702", new Object[]{113809,200514 ,-3720,"3589703"});
	walks.put("3589703", new Object[]{116035,199822 ,-3664,"3589704"});
	walks.put("3589704", new Object[]{117017,199876 ,-3632,"3589705"});
	walks.put("3589705", new Object[]{119959,201032 ,-3608,"3589706"});
	walks.put("3589706", new Object[]{121849,200614 ,-3384,"3589707"});
	walks.put("3589707", new Object[]{122868,200874 ,-3168,"3589708"});
	walks.put("3589708", new Object[]{123130,202427 ,-3128,"3589709"});
	walks.put("3589709", new Object[]{122427,204162 ,-3488,"3589710"});
	walks.put("3589710", new Object[]{122661,204842 ,-3576,"3589711"});
	walks.put("3589711", new Object[]{124051,205402 ,-3576,"3589712"});
	walks.put("3589712", new Object[]{124211,206023 ,-3504,"3589713"});
	walks.put("3589713", new Object[]{124948,206778 ,-3400,"3589714"});
	walks.put("3589714", new Object[]{124483,207777 ,-3200,"3589715"});
	walks.put("3589715", new Object[]{124948,206778 ,-3400,"3589716"});
	walks.put("3589716", new Object[]{124211,206023 ,-3504,"3589717"});
	walks.put("3589717", new Object[]{124051,205402 ,-3576,"3589718"});
	walks.put("3589718", new Object[]{122661,204842 ,-3576,"3589719"});
	walks.put("3589719", new Object[]{122427,204162 ,-3488,"3589720"});
	walks.put("3589720", new Object[]{123130,202427 ,-3128,"3589721"});
	walks.put("3589721", new Object[]{122868,200874 ,-3168,"3589722"});
	walks.put("3589722", new Object[]{121849,200614 ,-3384,"3589723"});
	walks.put("3589723", new Object[]{119959,201032 ,-3608,"3589724"});
	walks.put("3589724", new Object[]{117017,199876 ,-3632,"3589725"});
	walks.put("3589725", new Object[]{116035,199822 ,-3664,"3589726"});
	walks.put("3589726", new Object[]{113809,200514 ,-3720,"3589727"});
	walks.put("3589727", new Object[]{114436,202528 ,-3408,"3589701"});
	walks.put("3592801", new Object[]{161876,-73407 ,-2984,"3592802"});
	walks.put("3592802", new Object[]{161795,-75288 ,-3088,"3592803"});
	walks.put("3592803", new Object[]{159678,-77671 ,-3584,"3592804"});
	walks.put("3592804", new Object[]{158917,-78117 ,-3760,"3592805"});
	walks.put("3592805", new Object[]{158989,-77130 ,-3720,"3592806"});
	walks.put("3592806", new Object[]{158757,-75951 ,-3720,"3592807"});
	walks.put("3592807", new Object[]{158157,-74161 ,-3592,"3592808"});
	walks.put("3592808", new Object[]{157547,-73326 ,-3400,"3592809"});
	walks.put("3592809", new Object[]{153815,-71497 ,-3392,"3592810"});
	walks.put("3592810", new Object[]{153086,-70701 ,-3488,"3592811"});
	walks.put("3592811", new Object[]{152262,-70352 ,-3568,"3592812"});
	walks.put("3592812", new Object[]{155193,-69617 ,-3008,"3592813"});
	walks.put("3592813", new Object[]{152262,-70352 ,-3568,"3592814"});
	walks.put("3592814", new Object[]{153086,-70701 ,-3488,"3592815"});
	walks.put("3592815", new Object[]{153815,-71497 ,-3392,"3592816"});
	walks.put("3592816", new Object[]{157547,-73326 ,-3400,"3592817"});
	walks.put("3592817", new Object[]{158157,-74161 ,-3592,"3592818"});
	walks.put("3592818", new Object[]{158757,-75951 ,-3720,"3592819"});
	walks.put("3592819", new Object[]{158989,-77130 ,-3720,"3592820"});
	walks.put("3592820", new Object[]{158917,-78117 ,-3760,"3592821"});
	walks.put("3592821", new Object[]{159678,-77671 ,-3584,"3592822"});
	walks.put("3592822", new Object[]{161795,-75288 ,-3088,"3592823"});
	walks.put("3592823", new Object[]{161876,-73407 ,-2984,"3592801"});
	walks.put("3596601", new Object[]{71436 ,-58182 ,-2904,"3596602"});
	walks.put("3596602", new Object[]{71731 ,-56949 ,-3080,"3596603"});
	walks.put("3596603", new Object[]{72715 ,-56729 ,-3104,"3596604"});
	walks.put("3596604", new Object[]{73277 ,-56055 ,-3104,"3596605"});
	walks.put("3596605", new Object[]{73369 ,-55636 ,-3104,"3596606"});
	walks.put("3596606", new Object[]{74136 ,-54646 ,-3104,"3596607"});
	walks.put("3596607", new Object[]{73408 ,-54422 ,-3104,"3596608"});
	walks.put("3596608", new Object[]{72998 ,-53404 ,-3136,"3596609"});
	walks.put("3596609", new Object[]{71661 ,-52937 ,-3104,"3596610"});
	walks.put("3596610", new Object[]{71127 ,-52304 ,-3104,"3596611"});
	walks.put("3596611", new Object[]{70225 ,-52304 ,-3064,"3596612"});
	walks.put("3596612", new Object[]{69668 ,-52780 ,-3064,"3596613"});
	walks.put("3596613", new Object[]{68422 ,-52407 ,-3240,"3596614"});
	walks.put("3596614", new Object[]{67702 ,-52940 ,-3208,"3596615"});
	walks.put("3596615", new Object[]{67798 ,-52940 ,-3232,"3596616"});
	walks.put("3596616", new Object[]{66667 ,-55841 ,-2840,"3596617"});
	walks.put("3596617", new Object[]{67798 ,-52940 ,-3232,"3596618"});
	walks.put("3596618", new Object[]{67702 ,-52940 ,-3208,"3596619"});
	walks.put("3596619", new Object[]{68422 ,-52407 ,-3240,"3596620"});
	walks.put("3596620", new Object[]{69668 ,-52780 ,-3064,"3596621"});
	walks.put("3596621", new Object[]{70225 ,-52304 ,-3064,"3596622"});
	walks.put("3596622", new Object[]{71127 ,-52304 ,-3104,"3596623"});
	walks.put("3596623", new Object[]{71661 ,-52937 ,-3104,"3596624"});
	walks.put("3596624", new Object[]{72998 ,-53404 ,-3136,"3596625"});
	walks.put("3596625", new Object[]{73408 ,-54422 ,-3104,"3596626"});
	walks.put("3596626", new Object[]{74136 ,-54646 ,-3104,"3596627"});
	walks.put("3596627", new Object[]{73369 ,-55636 ,-3104,"3596628"});
	walks.put("3596628", new Object[]{73277 ,-56055 ,-3104,"3596629"});
	walks.put("3596629", new Object[]{72715 ,-56729 ,-3104,"3596630"});
	walks.put("3596630", new Object[]{71731 ,-56949 ,-3080,"3596631"});
	walks.put("3596631", new Object[]{71436 ,-58182 ,-2904,"3596601"});
	walks.put("3600401", new Object[]{105447,-139845,-3120,"3600402"});
	walks.put("3600402", new Object[]{104918,-140382,-3256,"3600403"});
	walks.put("3600403", new Object[]{105507,-142515,-3648,"3600404"});
	walks.put("3600404", new Object[]{106533,-143107,-3656,"3600405"});
	walks.put("3600405", new Object[]{106714,-143825,-3656,"3600406"});
	walks.put("3600406", new Object[]{107510,-144024,-3656,"3600407"});
	walks.put("3600407", new Object[]{108092,-144888,-3656,"3600408"});
	walks.put("3600408", new Object[]{109499,-145168,-3664,"3600409"});
	walks.put("3600409", new Object[]{110064,-146169,-3456,"3600410"});
	walks.put("3600410", new Object[]{110186,-147427,-3096,"3600411"});
	walks.put("3600411", new Object[]{112389,-147779,-3256,"3600412"});
	walks.put("3600412", new Object[]{110186,-147427,-3096,"3600413"});
	walks.put("3600413", new Object[]{110064,-146169,-3456,"3600414"});
	walks.put("3600414", new Object[]{109499,-145168,-3664,"3600415"});
	walks.put("3600415", new Object[]{108092,-144888,-3656,"3600416"});
	walks.put("3600416", new Object[]{107510,-144024,-3656,"3600417"});
	walks.put("3600417", new Object[]{106714,-143825,-3656,"3600418"});
	walks.put("3600418", new Object[]{106533,-143107,-3656,"3600419"});
	walks.put("3600419", new Object[]{105507,-142515,-3648,"3600420"});
	walks.put("3600420", new Object[]{104918,-140382,-3256,"3600421"});
	walks.put("3600421", new Object[]{105447,-139845,-3120,"3600401"});
	walks.put("3603501", new Object[]{14186 ,149947 ,-3352,"3603502"});
	walks.put("3603502", new Object[]{16180 ,150387 ,-3216,"3603503"});
	walks.put("3603503", new Object[]{18387 ,151874 ,-3317,"3603504"});
	walks.put("3603504", new Object[]{18405 ,154770 ,-3616,"3603505"});
	walks.put("3603505", new Object[]{17655 ,156863 ,-3664,"3603506"});
	walks.put("3603506", new Object[]{12303 ,153937 ,-2680,"3603507"});
	walks.put("3603507", new Object[]{17655 ,156863 ,-3664,"3603508"});
	walks.put("3603508", new Object[]{18405 ,154770 ,-3616,"3603509"});
	walks.put("3603509", new Object[]{18387 ,151874 ,-3317,"3603510"});
	walks.put("3603510", new Object[]{16180 ,150387 ,-3216,"3603511"});
	walks.put("3603511", new Object[]{14186 ,149947 ,-3352,"3603501"});
	walks.put("3607301", new Object[]{-56032,86017  ,-3259,"3607302"});
	walks.put("3607302", new Object[]{-57329,86006  ,-3640,"3607303"});
	walks.put("3607303", new Object[]{-57470,85306  ,-3664,"3607304"});
	walks.put("3607304", new Object[]{-58892,85159  ,-3768,"3607305"});
	walks.put("3607305", new Object[]{-59030,80150  ,-3632,"3607306"});
	walks.put("3607306", new Object[]{-57642,77591  ,-3512,"3607307"});
	walks.put("3607307", new Object[]{-53971,77664  ,-3224,"3607308"});
	walks.put("3607308", new Object[]{-53271,85126  ,-3552,"3607309"});
	walks.put("3607309", new Object[]{-53971,77664  ,-3224,"3607310"});
	walks.put("3607310", new Object[]{-57642,77591  ,-3512,"3607311"});
	walks.put("3607311", new Object[]{-59030,80150  ,-3632,"3607312"});
	walks.put("3607312", new Object[]{-58892,85159  ,-3768,"3607313"});
	walks.put("3607313", new Object[]{-57470,85306  ,-3664,"3607314"});
	walks.put("3607314", new Object[]{-57329,86006  ,-3640,"3607315"});
	walks.put("3607315", new Object[]{-56032,86017  ,-3259,"3607301"});
	walks.put("3611101", new Object[]{58314 ,136319 ,-2000,"3611102"});
	walks.put("3611102", new Object[]{57078 ,137124 ,-2216,"3611103"});
	walks.put("3611103", new Object[]{54644 ,137366 ,-2600,"3611104"});
	walks.put("3611104", new Object[]{58696 ,134202 ,-3096,"3611105"});
	walks.put("3611105", new Object[]{60967 ,134154 ,-3416,"3611106"});
	walks.put("3611106", new Object[]{62813 ,134744 ,-3592,"3611107"});
	walks.put("3611107", new Object[]{65158 ,135007 ,-3728,"3611108"});
	walks.put("3611108", new Object[]{64278 ,139384 ,-3176,"3611109"});
	walks.put("3611109", new Object[]{63711 ,140599 ,-2720,"3611110"});
	walks.put("3611110", new Object[]{63187 ,141192 ,-2440,"3611111"});
	walks.put("3611111", new Object[]{62811 ,142466 ,-2064,"3611112"});
	walks.put("3611112", new Object[]{63187 ,141192 ,-2440,"3611113"});
	walks.put("3611113", new Object[]{63711 ,140599 ,-2720,"3611114"});
	walks.put("3611114", new Object[]{64278 ,139384 ,-3176,"3611115"});
	walks.put("3611115", new Object[]{65158 ,135007 ,-3728,"3611116"});
	walks.put("3611116", new Object[]{62813 ,134744 ,-3592,"3611117"});
	walks.put("3611117", new Object[]{60967 ,134154 ,-3416,"3611118"});
	walks.put("3611118", new Object[]{58696 ,134202 ,-3096,"3611119"});
	walks.put("3611119", new Object[]{54644 ,137366 ,-2600,"3611120"});
	walks.put("3611120", new Object[]{57078 ,137124 ,-2216,"3611121"});
	walks.put("3611121", new Object[]{58314 ,136319 ,-2000,"3611101"});
	walks.put("3614201", new Object[]{9318  ,92253  ,-3536,"3614202"});
	walks.put("3614202", new Object[]{9117  ,91645  ,-3656,"3614203"});
	walks.put("3614203", new Object[]{9240  ,90149  ,-3592,"3614204"});
	walks.put("3614204", new Object[]{11509 ,90093  ,-3720,"3614205"});
	walks.put("3614205", new Object[]{13269 ,90004  ,-3840,"3614206"});
	walks.put("3614206", new Object[]{14812 ,89578  ,-3832,"3614207"});
	walks.put("3614207", new Object[]{14450 ,90636  ,-3680,"3614208"});
	walks.put("3614208", new Object[]{14236 ,91690  ,-3656,"3614209"});
	walks.put("3614209", new Object[]{13636 ,92359  ,-3480,"3614210"});
	walks.put("3614210", new Object[]{14236 ,91690  ,-3656,"3614211"});
	walks.put("3614211", new Object[]{14450 ,90636  ,-3680,"3614212"});
	walks.put("3614212", new Object[]{14812 ,89578  ,-3832,"3614213"});
	walks.put("3614213", new Object[]{13269 ,90004  ,-3840,"3614214"});
	walks.put("3614214", new Object[]{11509 ,90093  ,-3720,"3614215"});
	walks.put("3614215", new Object[]{9240  ,90149  ,-3592,"3614216"});
	walks.put("3614216", new Object[]{9117  ,91645  ,-3656,"3614217"});
	walks.put("3614217", new Object[]{9318  ,92253  ,-3536,"3614201"});
	walks.put("3617301", new Object[]{-80904,94098  ,-3152,"3617302"});
	walks.put("3617302", new Object[]{-81330,93758  ,-3224,"3617303"});
	walks.put("3617303", new Object[]{-82482,92419  ,-3456,"3617304"});
	walks.put("3617304", new Object[]{-84654,91351  ,-3520,"3617305"});
	walks.put("3617305", new Object[]{-85612,89733  ,-3288,"3617306"});
	walks.put("3617306", new Object[]{-83621,88290  ,-3368,"3617307"});
	walks.put("3617307", new Object[]{-81490,86480  ,-3408,"3617308"});
	walks.put("3617308", new Object[]{-79182,86002  ,-3584,"3617309"});
	walks.put("3617309", new Object[]{-78251,85722  ,-3624,"3617310"});
	walks.put("3617310", new Object[]{-78090,86842  ,-3480,"3617311"});
	walks.put("3617311", new Object[]{-78251,85722  ,-3624,"3617312"});
	walks.put("3617312", new Object[]{-79182,86002  ,-3584,"3617313"});
	walks.put("3617313", new Object[]{-81490,86480  ,-3408,"3617314"});
	walks.put("3617314", new Object[]{-83621,88290  ,-3368,"3617315"});
	walks.put("3617315", new Object[]{-85612,89733  ,-3288,"3617316"});
	walks.put("3617316", new Object[]{-84654,91351  ,-3520,"3617317"});
	walks.put("3617317", new Object[]{-82482,92419  ,-3456,"3617318"});
	walks.put("3617318", new Object[]{-81330,93758  ,-3224,"3617319"});
	walks.put("3617319", new Object[]{-80904,94098  ,-3152,"3617301"});
	walks.put("3621101", new Object[]{114221,-18762 ,-1768,"3621102"});
	walks.put("3621102", new Object[]{115920,-19177 ,-2120,"3621103"});
	walks.put("3621103", new Object[]{117105,-19759 ,-2400,"3621104"});
	walks.put("3621104", new Object[]{118417,-20135 ,-2632,"3621105"});
	walks.put("3621105", new Object[]{118881,-20011 ,-2712,"3621106"});
	walks.put("3621106", new Object[]{117210,-18329 ,-1816,"3621107"});
	walks.put("3621107", new Object[]{118881,-20011 ,-2712,"3621108"});
	walks.put("3621108", new Object[]{118417,-20135 ,-2632,"3621109"});
	walks.put("3621109", new Object[]{117105,-19759 ,-2400,"3621110"});
	walks.put("3621110", new Object[]{115920,-19177 ,-2120,"3621111"});
	walks.put("3621111", new Object[]{114221,-18762 ,-1768,"3621101"});
	walks.put("3624901", new Object[]{121072,93215  ,-2736,"3624902"});
	walks.put("3624902", new Object[]{122718,92355  ,-2320,"3624903"});
	walks.put("3624903", new Object[]{126171,91910  ,-2216,"3624904"});
	walks.put("3624904", new Object[]{126353,90422  ,-2296,"3624905"});
	walks.put("3624905", new Object[]{125796,87720  ,-2432,"3624906"});
	walks.put("3624906", new Object[]{124803,85970  ,-2464,"3624907"});
	walks.put("3624907", new Object[]{125036,83836  ,-2376,"3624908"});
	walks.put("3624908", new Object[]{128886,83331  ,-1416,"3624909"});
	walks.put("3624909", new Object[]{129697,84969  ,-1256,"3624910"});
	walks.put("3624910", new Object[]{126291,86712  ,-2240,"3624911"});
	walks.put("3624911", new Object[]{126599,88950  ,-2325,"3624912"});
	walks.put("3624912", new Object[]{126847,90713  ,-2264,"3624913"});
	walks.put("3624913", new Object[]{126599,88950  ,-2325,"3624914"});
	walks.put("3624914", new Object[]{126291,86712  ,-2240,"3624915"});
	walks.put("3624915", new Object[]{129697,84969  ,-1256,"3624916"});
	walks.put("3624916", new Object[]{128886,83331  ,-1416,"3624917"});
	walks.put("3624917", new Object[]{125036,83836  ,-2376,"3624918"});
	walks.put("3624918", new Object[]{124803,85970  ,-2464,"3624919"});
	walks.put("3624919", new Object[]{125796,87720  ,-2432,"3624920"});
	walks.put("3624920", new Object[]{126353,90422  ,-2296,"3624921"});
	walks.put("3624921", new Object[]{126171,91910  ,-2216,"3624922"});
	walks.put("3624922", new Object[]{122718,92355  ,-2320,"3624923"});
	walks.put("3624923", new Object[]{121072,93215  ,-2736,"3624901"});
	walks.put("3628701", new Object[]{71692 ,188004 ,-2616,"3628702"});
	walks.put("3628702", new Object[]{69326 ,187042 ,-3008,"3628703"});
	walks.put("3628703", new Object[]{68627 ,185540 ,-2984,"3628704"});
	walks.put("3628704", new Object[]{69077 ,184566 ,-2976,"3628705"});
	walks.put("3628705", new Object[]{70642 ,182573 ,-2992,"3628706"});
	walks.put("3628706", new Object[]{73647 ,181706 ,-3160,"3628707"});
	walks.put("3628707", new Object[]{74283 ,181756 ,-3152,"3628708"});
	walks.put("3628708", new Object[]{73655 ,182960 ,-2736,"3628709"});
	walks.put("3628709", new Object[]{74283 ,181756 ,-3152,"3628710"});
	walks.put("3628710", new Object[]{73647 ,181706 ,-3160,"3628711"});
	walks.put("3628711", new Object[]{70642 ,182573 ,-2992,"3628712"});
	walks.put("3628712", new Object[]{69077 ,184566 ,-2976,"3628713"});
	walks.put("3628713", new Object[]{68627 ,185540 ,-2984,"3628714"});
	walks.put("3628714", new Object[]{69326 ,187042 ,-3008,"3628715"});
	walks.put("3628715", new Object[]{71692 ,188004 ,-2616,"3628701"});
	walks.put("3631801", new Object[]{104150,-57163 ,-848 ,"3631802"});
	walks.put("3631802", new Object[]{106218,-59401 ,-1344,"3631803"});
	walks.put("3631803", new Object[]{106898,-59553 ,-1664,"3631804"});
	walks.put("3631804", new Object[]{107352,-60168 ,-2000,"3631805"});
	walks.put("3631805", new Object[]{107651,-61177 ,-2400,"3631806"});
	walks.put("3631806", new Object[]{109094,-62678 ,-3248,"3631807"});
	walks.put("3631807", new Object[]{108266,-62657 ,-3104,"3631808"});
	walks.put("3631808", new Object[]{105169,-61226 ,-2616,"3631809"});
	walks.put("3631809", new Object[]{102968,-59982 ,-2384,"3631810"});
	walks.put("3631810", new Object[]{100070,-60173 ,-2792,"3631811"});
	walks.put("3631811", new Object[]{98764 ,-61095 ,-2768,"3631812"});
	walks.put("3631812", new Object[]{94946 ,-60039 ,-2432,"3631813"});
	walks.put("3631813", new Object[]{96103 ,-59078 ,-1992,"3631814"});
	walks.put("3631814", new Object[]{96884 ,-59043 ,-1656,"3631815"});
	walks.put("3631815", new Object[]{97064 ,-57884 ,-1256,"3631816"});
	walks.put("3631816", new Object[]{96884 ,-59043 ,-1656,"3631817"});
	walks.put("3631817", new Object[]{96103 ,-59078 ,-1992,"3631818"});
	walks.put("3631818", new Object[]{94946 ,-60039 ,-2432,"3631819"});
	walks.put("3631819", new Object[]{98764 ,-61095 ,-2768,"3631820"});
	walks.put("3631820", new Object[]{100070,-60173 ,-2792,"3631821"});
	walks.put("3631821", new Object[]{102968,-59982 ,-2384,"3631822"});
	walks.put("3631822", new Object[]{105169,-61226 ,-2616,"3631823"});
	walks.put("3631823", new Object[]{108266,-62657 ,-3104,"3631824"});
	walks.put("3631824", new Object[]{109094,-62678 ,-3248,"3631825"});
	walks.put("3631825", new Object[]{107651,-61177 ,-2400,"3631826"});
	walks.put("3631826", new Object[]{107352,-60168 ,-2000,"3631827"});
	walks.put("3631827", new Object[]{106898,-59553 ,-1664,"3631828"});
	walks.put("3631828", new Object[]{106218,-59401 ,-1344,"3631829"});
	walks.put("3631829", new Object[]{104150,-57163 ,-848 ,"3631801"});
	walks.put("3635601", new Object[]{69553 ,-91746 ,-1488,"3635602"});
	walks.put("3635602", new Object[]{70941 ,-89751 ,-2256,"3635603"});
	walks.put("3635603", new Object[]{71104 ,-89094 ,-2368,"3635604"});
	walks.put("3635604", new Object[]{73471 ,-91462 ,-2024,"3635605"});
	walks.put("3635605", new Object[]{74532 ,-92202 ,-1776,"3635606"});
	walks.put("3635606", new Object[]{74908 ,-93152 ,-1536,"3635607"});
	walks.put("3635607", new Object[]{74532 ,-92202 ,-1776,"3635608"});
	walks.put("3635608", new Object[]{73471 ,-91462 ,-2024,"3635609"});
	walks.put("3635609", new Object[]{71104 ,-89094 ,-2368,"3635610"});
	walks.put("3635610", new Object[]{70941 ,-89751 ,-2256,"3635611"});
	walks.put("3635611", new Object[]{69553 ,-91746 ,-1488,"3635601"});
	walks.put("3262801", new Object[]{-148230,255276,-184,"3262802"});
	walks.put("3262802", new Object[]{-148280,254818,-184,"3262803"});
	walks.put("3262803", new Object[]{-148670,254376,-184,"3262804"});
	walks.put("3262804", new Object[]{-149230,254098,-184,"3262805"});
	walks.put("3262805", new Object[]{-148670,254376,-184,"3262806"});
	walks.put("3262806", new Object[]{-148280,254818,-184,"3262801"});
	walks.put("3262807", new Object[]{-148266,255312,-184,"3262808"});
	walks.put("3262808", new Object[]{-148316,254854,-184,"3262809"});
	walks.put("3262809", new Object[]{-148706,254412,-184,"3262810"});
	walks.put("3262810", new Object[]{-149266,254134,-184,"3262811"});
	walks.put("3262811", new Object[]{-148706,254412,-184,"3262812"});
	walks.put("3262812", new Object[]{-148316,254854,-184,"3262807"});
	walks.put("3262901", new Object[]{-150500,255276,-184,"3262902"});
	walks.put("3262902", new Object[]{-150450,254818,-184,"3262903"});
	walks.put("3262903", new Object[]{-150060,254376,-184,"3262904"});
	walks.put("3262904", new Object[]{-149500,254098,-184,"3262905"});
	walks.put("3262905", new Object[]{-150060,254376,-184,"3262906"});
	walks.put("3262906", new Object[]{-150450,254818,-184,"3262901"});
	walks.put("3262907", new Object[]{-150464,255312,-184,"3262908"});
	walks.put("3262908", new Object[]{-150414,254854,-184,"3262909"});
	walks.put("3262909", new Object[]{-150024,254412,-184,"3262910"});
	walks.put("3262910", new Object[]{-149464,254134,-184,"3262911"});
	walks.put("3262911", new Object[]{-150024,254412,-184,"3262912"});
	walks.put("3262912", new Object[]{-150414,254854,-184,"3262907"});
	}

	public NPC_Walk(int id, String name, String descr)
	{
		super(id,name,descr);
		load();
		suspicious_merchant01 = addSpawn(35659,-55675,157012,-2034,0,false,0);
		suspicious_merchant02 = addSpawn(35690,-28169,216864,-3544,0,false,0);
		suspicious_merchant03 = addSpawn(35728,19408,189422,-3136,0,false,0);
		suspicious_merchant04 = addSpawn(35759,123383,121093,-2864,0,false,0);
		suspicious_merchant05 = addSpawn(35797,74725,1671,-3128,0,false,0);
		suspicious_merchant06 = addSpawn(35828,159377,52403,-3312,0,false,0);
		suspicious_merchant07 = addSpawn(35859,190423,43540,-3656,0,false,0);
		suspicious_merchant08 = addSpawn(35897,114436,202528,-3408,0,false,0);
		suspicious_merchant09 = addSpawn(35928,161876,-73407,-2984,0,false,0);
		suspicious_merchant10 = addSpawn(35966,71436,-58182,-2904,0,false,0);
		suspicious_merchant11 = addSpawn(36004,105447,-139845,-3120,0,false,0);
		suspicious_merchant12 = addSpawn(36035,14186,149947,-3352,0,false,0);
		suspicious_merchant13 = addSpawn(36073,-56032,86017,-3259,0,false,0);
		suspicious_merchant14 = addSpawn(36111,58314,136319,-2000,0,false,0);
		suspicious_merchant15 = addSpawn(36142,9318,92253,-3536,0,false,0);
		suspicious_merchant16 = addSpawn(36173,-80904,94098,-3152,0,false,0);
		suspicious_merchant17 = addSpawn(36211,114221,-18762,-1768,0,false,0);
		suspicious_merchant18 = addSpawn(36249,121072,93215,-2736,0,false,0);
		suspicious_merchant19 = addSpawn(36287,71692,188004,-2616,0,false,0);
		suspicious_merchant20 = addSpawn(36318,104150,-57163,-848,0,false,0);
		suspicious_merchant21 = addSpawn(36356,69553,-91746,-1488,0,false,0);
		wharf_patrol01 = addSpawn(32628,-148230,255276,-184,0,false,0);
		wharf_patrol02 = addSpawn(32628,-148266,255312,-184,0,false,0);
		wharf_patrol03 = addSpawn(32629,-150502,255276,-184,0,false,0);
		wharf_patrol04 = addSpawn(32629,-150466,255312,-184,0,false,0);
		this.startQuestTimer("3565901", 5000, suspicious_merchant01, null);
		this.startQuestTimer("3569001", 5000, suspicious_merchant02, null);
		this.startQuestTimer("3572801", 5000, suspicious_merchant03, null);
		this.startQuestTimer("3575901", 5000, suspicious_merchant04, null);
		this.startQuestTimer("3579701", 5000, suspicious_merchant05, null);
		this.startQuestTimer("3582801", 5000, suspicious_merchant06, null);
		this.startQuestTimer("3585901", 5000, suspicious_merchant07, null);
		this.startQuestTimer("3589701", 5000, suspicious_merchant08, null);
		this.startQuestTimer("3592801", 5000, suspicious_merchant09, null);
		this.startQuestTimer("3596601", 5000, suspicious_merchant10, null);
		this.startQuestTimer("3600401", 5000, suspicious_merchant11, null);
		this.startQuestTimer("3603501", 5000, suspicious_merchant12, null);
		this.startQuestTimer("3607301", 5000, suspicious_merchant13, null);
		this.startQuestTimer("3611101", 5000, suspicious_merchant14, null);
		this.startQuestTimer("3614201", 5000, suspicious_merchant15, null);
		this.startQuestTimer("3617301", 5000, suspicious_merchant16, null);
		this.startQuestTimer("3621101", 5000, suspicious_merchant17, null);
		this.startQuestTimer("3624901", 5000, suspicious_merchant18, null);
		this.startQuestTimer("3628701", 5000, suspicious_merchant19, null);
		this.startQuestTimer("3631801", 5000, suspicious_merchant20, null);
		this.startQuestTimer("3635601", 5000, suspicious_merchant21, null);
		this.startQuestTimer("3262801", 5000, wharf_patrol01, null);
		this.startQuestTimer("3262807", 5000, wharf_patrol02, null);
		this.startQuestTimer("3262904", 5000, wharf_patrol03, null);
		this.startQuestTimer("3262910", 5000, wharf_patrol04, null);
	}

	public String onAdvEvent (String event, L2Npc npc, L2PcInstance player)
	{
		if (walks.containsKey(event))
		{
			int x = (Integer) walks.get(event)[0];
			int y = (Integer) walks.get(event)[1];
			int z = (Integer) walks.get(event)[2];
			String nextEvent = (String) walks.get(event)[3];
			npc.getAI().setIntention(CtrlIntention.AI_INTENTION_MOVE_TO,new L2CharPosition(x,y,z,0));
			if ((npc.getX()-100) <= x && (npc.getX()+100) >= x && (npc.getY()-100) <= y && (npc.getY()+100) >= y)
				this.startQuestTimer(nextEvent, 1000, npc, null);
			else
				this.startQuestTimer(event, 1000, npc, null);
		}
		return super.onAdvEvent(event, npc, player);
	}

	public static void main(String[] args)
	{
		// now call the constructor (starts up the ai)
		new NPC_Walk(-1,"npc_walk","ai");
	}
}