# Update by rocknow
import sys
from net.sf.l2j.gameserver.ai import CtrlIntention
from net.sf.l2j.gameserver.model import L2CharPosition
from net.sf.l2j.gameserver.model.quest.jython import QuestJython as JQuest

WALKS={
"3565901":[-55675,157012 ,-2034,"3565902"],
"3565902":[-55675,157012 ,-2064,"3565903"],
"3565903":[-55675,154797 ,-2680,"3565904"],
"3565904":[-55713,154341 ,-2544,"3565905"],
"3565905":[-52122,151759 ,-2568,"3565906"],
"3565906":[-50343,151559 ,-2768,"3565907"],
"3565907":[-48975,154986 ,-2272,"3565908"],
"3565908":[-50343,151559 ,-2768,"3565909"],
"3565909":[-52122,151759 ,-2568,"3565910"],
"3565910":[-55713,154341 ,-2544,"3565911"],
"3565911":[-55675,154797 ,-2680,"3565912"],
"3565912":[-55675,157012 ,-2064,"3565913"],
"3565913":[-55675,157012 ,-2034,"3565901"],
"3569001":[-28169,216864 ,-3544,"3569002"],
"3569002":[-29028,215089 ,-3672,"3569003"],
"3569003":[-30888,213455 ,-3656,"3569004"],
"3569004":[-31937,211656 ,-3656,"3569005"],
"3569005":[-30880,211006 ,-3552,"3569006"],
"3569006":[-27690,210004 ,-3272,"3569007"],
"3569007":[-25784,210108 ,-3272,"3569008"],
"3569008":[-21682,211459 ,-3272,"3569009"],
"3569009":[-18430,212927 ,-3704,"3569010"],
"3569010":[-16247,212795 ,-3664,"3569011"],
"3569011":[-16868,214267 ,-3648,"3569012"],
"3569012":[-17263,215887 ,-3552,"3569013"],
"3569013":[-18352,216841 ,-3504,"3569014"],
"3569014":[-17263,215887 ,-3552,"3569015"],
"3569015":[-16868,214267 ,-3648,"3569016"],
"3569016":[-16247,212795 ,-3664,"3569017"],
"3569017":[-18430,212927 ,-3704,"3569018"],
"3569018":[-21682,211459 ,-3272,"3569019"],
"3569019":[-25784,210108 ,-3272,"3569020"],
"3569020":[-27690,210004 ,-3272,"3569021"],
"3569021":[-30880,211006 ,-3552,"3569022"],
"3569022":[-31937,211656 ,-3656,"3569023"],
"3569023":[-30888,213455 ,-3656,"3569024"],
"3569024":[-29028,215089 ,-3672,"3569025"],
"3569025":[-28169,216864 ,-3544,"3569001"],
"3572801":[19408 ,189422 ,-3136,"3572802"],
"3572802":[20039 ,187700 ,-3416,"3572803"],
"3572803":[19016 ,185813 ,-3552,"3572804"],
"3572804":[17959 ,181955 ,-3680,"3572805"],
"3572805":[16440 ,181635 ,-3616,"3572806"],
"3572806":[15679 ,182540 ,-3608,"3572807"],
"3572807":[15310 ,182791 ,-3568,"3572808"],
"3572808":[15242 ,184507 ,-3112,"3572809"],
"3572809":[15310 ,182791 ,-3568,"3572810"],
"3572810":[15679 ,182540 ,-3608,"3572811"],
"3572811":[16440 ,181635 ,-3616,"3572812"],
"3572812":[17959 ,181955 ,-3680,"3572813"],
"3572813":[19016 ,185813 ,-3552,"3572814"],
"3572814":[20039 ,187700 ,-3416,"3572815"],
"3572815":[19408 ,189422 ,-3136,"3572801"],
"3575901":[123383,121093 ,-2864,"3575902"],
"3575902":[122670,120890 ,-3088,"3575903"],
"3575903":[124617,119069 ,-3088,"3575904"],
"3575904":[126177,118273 ,-3080,"3575905"],
"3575905":[125979,119528 ,-2728,"3575906"],
"3575906":[126177,118273 ,-3080,"3575907"],
"3575907":[124617,119069 ,-3088,"3575908"],
"3575908":[122670,120890 ,-3088,"3575909"],
"3575909":[123383,121093 ,-2864,"3575901"],
"3579701":[74725 ,1671   ,-3128,"3579702"],
"3579702":[76651 ,1505   ,-3552,"3579703"],
"3579703":[79421 ,4977   ,-3080,"3579704"],
"3579704":[77357 ,7197   ,-3208,"3579705"],
"3579705":[76287 ,9164   ,-3568,"3579706"],
"3579706":[72447 ,8196   ,-3264,"3579707"],
"3579707":[71780 ,7467   ,-3160,"3579708"],
"3579708":[72447 ,8196   ,-3264,"3579709"],
"3579709":[76287 ,9164   ,-3568,"3579710"],
"3579710":[77357 ,7197   ,-3208,"3579711"],
"3579711":[79421 ,4977   ,-3080,"3579712"],
"3579712":[76651 ,1505   ,-3552,"3579713"],
"3579713":[74725 ,1671   ,-3128,"3579701"],
"3582801":[159388,52392  ,-3317,"3582802"],
"3582802":[158407,52708  ,-3264,"3582803"],
"3582803":[159588,52684  ,-3328,"3582804"],
"3582804":[160872,53771  ,-3528,"3582805"],
"3582805":[162518,55063  ,-3672,"3582806"],
"3582806":[159388,52392  ,-3317,"3582801"],
"3585901":[190423,43540  ,-3656,"3585902"],
"3585902":[189579,45949  ,-4240,"3585903"],
"3585903":[187058,43551  ,-4808,"3585904"],
"3585904":[185916,41869  ,-4512,"3585905"],
"3585905":[185292,39403  ,-4200,"3585906"],
"3585906":[185167,38401  ,-4200,"3585907"],
"3585907":[184984,36863  ,-4152,"3585908"],
"3585908":[184377,36425  ,-4080,"3585909"],
"3585909":[185314,35866  ,-3936,"3585910"],
"3585910":[185781,35955  ,-3832,"3585911"],
"3585911":[186686,35667  ,-3752,"3585912"],
"3585912":[185781,35955  ,-3832,"3585913"],
"3585913":[185314,35866  ,-3936,"3585914"],
"3585914":[184377,36425  ,-4080,"3585915"],
"3585915":[184984,36863  ,-4152,"3585916"],
"3585916":[185167,38401  ,-4200,"3585917"],
"3585917":[185292,39403  ,-4200,"3585918"],
"3585918":[185916,41869  ,-4512,"3585919"],
"3585919":[187058,43551  ,-4808,"3585920"],
"3585920":[189579,45949  ,-4240,"3585921"],
"3585921":[190423,43540  ,-3656,"3585901"],
"3589701":[114436,202528 ,-3408,"3589702"],
"3589702":[113809,200514 ,-3720,"3589703"],
"3589703":[116035,199822 ,-3664,"3589704"],
"3589704":[117017,199876 ,-3632,"3589705"],
"3589705":[119959,201032 ,-3608,"3589706"],
"3589706":[121849,200614 ,-3384,"3589707"],
"3589707":[122868,200874 ,-3168,"3589708"],
"3589708":[123130,202427 ,-3128,"3589709"],
"3589709":[122427,204162 ,-3488,"3589710"],
"3589710":[122661,204842 ,-3576,"3589711"],
"3589711":[124051,205402 ,-3576,"3589712"],
"3589712":[124211,206023 ,-3504,"3589713"],
"3589713":[124948,206778 ,-3400,"3589714"],
"3589714":[124483,207777 ,-3200,"3589715"],
"3589715":[124948,206778 ,-3400,"3589716"],
"3589716":[124211,206023 ,-3504,"3589717"],
"3589717":[124051,205402 ,-3576,"3589718"],
"3589718":[122661,204842 ,-3576,"3589719"],
"3589719":[122427,204162 ,-3488,"3589720"],
"3589720":[123130,202427 ,-3128,"3589721"],
"3589721":[122868,200874 ,-3168,"3589722"],
"3589722":[121849,200614 ,-3384,"3589723"],
"3589723":[119959,201032 ,-3608,"3589724"],
"3589724":[117017,199876 ,-3632,"3589725"],
"3589725":[116035,199822 ,-3664,"3589726"],
"3589726":[113809,200514 ,-3720,"3589727"],
"3589727":[114436,202528 ,-3408,"3589701"],
"3592801":[161876,-73407 ,-2984,"3592802"],
"3592802":[161795,-75288 ,-3088,"3592803"],
"3592803":[159678,-77671 ,-3584,"3592804"],
"3592804":[158917,-78117 ,-3760,"3592805"],
"3592805":[158989,-77130 ,-3720,"3592806"],
"3592806":[158757,-75951 ,-3720,"3592807"],
"3592807":[158157,-74161 ,-3592,"3592808"],
"3592808":[157547,-73326 ,-3400,"3592809"],
"3592809":[153815,-71497 ,-3392,"3592810"],
"3592810":[153086,-70701 ,-3488,"3592811"],
"3592811":[152262,-70352 ,-3568,"3592812"],
"3592812":[155193,-69617 ,-3008,"3592813"],
"3592813":[152262,-70352 ,-3568,"3592814"],
"3592814":[153086,-70701 ,-3488,"3592815"],
"3592815":[153815,-71497 ,-3392,"3592816"],
"3592816":[157547,-73326 ,-3400,"3592817"],
"3592817":[158157,-74161 ,-3592,"3592818"],
"3592818":[158757,-75951 ,-3720,"3592819"],
"3592819":[158989,-77130 ,-3720,"3592820"],
"3592820":[158917,-78117 ,-3760,"3592821"],
"3592821":[159678,-77671 ,-3584,"3592822"],
"3592822":[161795,-75288 ,-3088,"3592823"],
"3592823":[161876,-73407 ,-2984,"3592801"],
"3596601":[71436 ,-58182 ,-2904,"3596602"],
"3596602":[71731 ,-56949 ,-3080,"3596603"],
"3596603":[72715 ,-56729 ,-3104,"3596604"],
"3596604":[73277 ,-56055 ,-3104,"3596605"],
"3596605":[73369 ,-55636 ,-3104,"3596606"],
"3596606":[74136 ,-54646 ,-3104,"3596607"],
"3596607":[73408 ,-54422 ,-3104,"3596608"],
"3596608":[72998 ,-53404 ,-3136,"3596609"],
"3596609":[71661 ,-52937 ,-3104,"3596610"],
"3596610":[71127 ,-52304 ,-3104,"3596611"],
"3596611":[70225 ,-52304 ,-3064,"3596612"],
"3596612":[69668 ,-52780 ,-3064,"3596613"],
"3596613":[68422 ,-52407 ,-3240,"3596614"],
"3596614":[67702 ,-52940 ,-3208,"3596615"],
"3596615":[67798 ,-52940 ,-3232,"3596616"],
"3596616":[66667 ,-55841 ,-2840,"3596617"],
"3596617":[67798 ,-52940 ,-3232,"3596618"],
"3596618":[67702 ,-52940 ,-3208,"3596619"],
"3596619":[68422 ,-52407 ,-3240,"3596620"],
"3596620":[69668 ,-52780 ,-3064,"3596621"],
"3596621":[70225 ,-52304 ,-3064,"3596622"],
"3596622":[71127 ,-52304 ,-3104,"3596623"],
"3596623":[71661 ,-52937 ,-3104,"3596624"],
"3596624":[72998 ,-53404 ,-3136,"3596625"],
"3596625":[73408 ,-54422 ,-3104,"3596626"],
"3596626":[74136 ,-54646 ,-3104,"3596627"],
"3596627":[73369 ,-55636 ,-3104,"3596628"],
"3596628":[73277 ,-56055 ,-3104,"3596629"],
"3596629":[72715 ,-56729 ,-3104,"3596630"],
"3596630":[71731 ,-56949 ,-3080,"3596631"],
"3596631":[71436 ,-58182 ,-2904,"3596601"],
"3600401":[105447,-139845,-3120,"3600402"],
"3600402":[104918,-140382,-3256,"3600403"],
"3600403":[105507,-142515,-3648,"3600404"],
"3600404":[106533,-143107,-3656,"3600405"],
"3600405":[106714,-143825,-3656,"3600406"],
"3600406":[107510,-144024,-3656,"3600407"],
"3600407":[108092,-144888,-3656,"3600408"],
"3600408":[109499,-145168,-3664,"3600409"],
"3600409":[110064,-146169,-3456,"3600410"],
"3600410":[110186,-147427,-3096,"3600411"],
"3600411":[112389,-147779,-3256,"3600412"],
"3600412":[110186,-147427,-3096,"3600413"],
"3600413":[110064,-146169,-3456,"3600414"],
"3600414":[109499,-145168,-3664,"3600415"],
"3600415":[108092,-144888,-3656,"3600416"],
"3600416":[107510,-144024,-3656,"3600417"],
"3600417":[106714,-143825,-3656,"3600418"],
"3600418":[106533,-143107,-3656,"3600419"],
"3600419":[105507,-142515,-3648,"3600420"],
"3600420":[104918,-140382,-3256,"3600421"],
"3600421":[105447,-139845,-3120,"3600401"],
"3603501":[14186 ,149947 ,-3352,"3603502"],
"3603502":[16180 ,150387 ,-3216,"3603503"],
"3603503":[18387 ,151874 ,-3317,"3603504"],
"3603504":[18405 ,154770 ,-3616,"3603505"],
"3603505":[17655 ,156863 ,-3664,"3603506"],
"3603506":[12303 ,153937 ,-2680,"3603507"],
"3603507":[17655 ,156863 ,-3664,"3603508"],
"3603508":[18405 ,154770 ,-3616,"3603509"],
"3603509":[18387 ,151874 ,-3317,"3603510"],
"3603510":[16180 ,150387 ,-3216,"3603511"],
"3603511":[14186 ,149947 ,-3352,"3603501"],
"3607301":[-56032,86017  ,-3259,"3607302"],
"3607302":[-57329,86006  ,-3640,"3607303"],
"3607303":[-57470,85306  ,-3664,"3607304"],
"3607304":[-58892,85159  ,-3768,"3607305"],
"3607305":[-59030,80150  ,-3632,"3607306"],
"3607306":[-57642,77591  ,-3512,"3607307"],
"3607307":[-53971,77664  ,-3224,"3607308"],
"3607308":[-53271,85126  ,-3552,"3607309"],
"3607309":[-53971,77664  ,-3224,"3607310"],
"3607310":[-57642,77591  ,-3512,"3607311"],
"3607311":[-59030,80150  ,-3632,"3607312"],
"3607312":[-58892,85159  ,-3768,"3607313"],
"3607313":[-57470,85306  ,-3664,"3607314"],
"3607314":[-57329,86006  ,-3640,"3607315"],
"3607315":[-56032,86017  ,-3259,"3607301"],
"3611101":[58314 ,136319 ,-2000,"3611102"],
"3611102":[57078 ,137124 ,-2216,"3611103"],
"3611103":[54644 ,137366 ,-2600,"3611104"],
"3611104":[58696 ,134202 ,-3096,"3611105"],
"3611105":[60967 ,134154 ,-3416,"3611106"],
"3611106":[62813 ,134744 ,-3592,"3611107"],
"3611107":[65158 ,135007 ,-3728,"3611108"],
"3611108":[64278 ,139384 ,-3176,"3611109"],
"3611109":[63711 ,140599 ,-2720,"3611110"],
"3611110":[63187 ,141192 ,-2440,"3611111"],
"3611111":[62811 ,142466 ,-2064,"3611112"],
"3611112":[63187 ,141192 ,-2440,"3611113"],
"3611113":[63711 ,140599 ,-2720,"3611114"],
"3611114":[64278 ,139384 ,-3176,"3611115"],
"3611115":[65158 ,135007 ,-3728,"3611116"],
"3611116":[62813 ,134744 ,-3592,"3611117"],
"3611117":[60967 ,134154 ,-3416,"3611118"],
"3611118":[58696 ,134202 ,-3096,"3611119"],
"3611119":[54644 ,137366 ,-2600,"3611120"],
"3611120":[57078 ,137124 ,-2216,"3611121"],
"3611121":[58314 ,136319 ,-2000,"3611101"],
"3614201":[9318  ,92253  ,-3536,"3614202"],
"3614202":[9117  ,91645  ,-3656,"3614203"],
"3614203":[9240  ,90149  ,-3592,"3614204"],
"3614204":[11509 ,90093  ,-3720,"3614205"],
"3614205":[13269 ,90004  ,-3840,"3614206"],
"3614206":[14812 ,89578  ,-3832,"3614207"],
"3614207":[14450 ,90636  ,-3680,"3614208"],
"3614208":[14236 ,91690  ,-3656,"3614209"],
"3614209":[13636 ,92359  ,-3480,"3614210"],
"3614210":[14236 ,91690  ,-3656,"3614211"],
"3614211":[14450 ,90636  ,-3680,"3614212"],
"3614212":[14812 ,89578  ,-3832,"3614213"],
"3614213":[13269 ,90004  ,-3840,"3614214"],
"3614214":[11509 ,90093  ,-3720,"3614215"],
"3614215":[9240  ,90149  ,-3592,"3614216"],
"3614216":[9117  ,91645  ,-3656,"3614217"],
"3614217":[9318  ,92253  ,-3536,"3614201"],
"3617301":[-80904,94098  ,-3152,"3617302"],
"3617302":[-81330,93758  ,-3224,"3617303"],
"3617303":[-82482,92419  ,-3456,"3617304"],
"3617304":[-84654,91351  ,-3520,"3617305"],
"3617305":[-85612,89733  ,-3288,"3617306"],
"3617306":[-83621,88290  ,-3368,"3617307"],
"3617307":[-81490,86480  ,-3408,"3617308"],
"3617308":[-79182,86002  ,-3584,"3617309"],
"3617309":[-78251,85722  ,-3624,"3617310"],
"3617310":[-78090,86842  ,-3480,"3617311"],
"3617311":[-78251,85722  ,-3624,"3617312"],
"3617312":[-79182,86002  ,-3584,"3617313"],
"3617313":[-81490,86480  ,-3408,"3617314"],
"3617314":[-83621,88290  ,-3368,"3617315"],
"3617315":[-85612,89733  ,-3288,"3617316"],
"3617316":[-84654,91351  ,-3520,"3617317"],
"3617317":[-82482,92419  ,-3456,"3617318"],
"3617318":[-81330,93758  ,-3224,"3617319"],
"3617319":[-80904,94098  ,-3152,"3617301"],
"3621101":[114221,-18762 ,-1768,"3621102"],
"3621102":[115920,-19177 ,-2120,"3621103"],
"3621103":[117105,-19759 ,-2400,"3621104"],
"3621104":[118417,-20135 ,-2632,"3621105"],
"3621105":[118881,-20011 ,-2712,"3621106"],
"3621106":[117210,-18329 ,-1816,"3621107"],
"3621107":[118881,-20011 ,-2712,"3621108"],
"3621108":[118417,-20135 ,-2632,"3621109"],
"3621109":[117105,-19759 ,-2400,"3621110"],
"3621110":[115920,-19177 ,-2120,"3621111"],
"3621111":[114221,-18762 ,-1768,"3621101"],
"3624901":[121072,93215  ,-2736,"3624902"],
"3624902":[122718,92355  ,-2320,"3624903"],
"3624903":[126171,91910  ,-2216,"3624904"],
"3624904":[126353,90422  ,-2296,"3624905"],
"3624905":[125796,87720  ,-2432,"3624906"],
"3624906":[124803,85970  ,-2464,"3624907"],
"3624907":[125036,83836  ,-2376,"3624908"],
"3624908":[128886,83331  ,-1416,"3624909"],
"3624909":[129697,84969  ,-1256,"3624910"],
"3624910":[126291,86712  ,-2240,"3624911"],
"3624911":[126599,88950  ,-2325,"3624912"],
"3624912":[126847,90713  ,-2264,"3624913"],
"3624913":[126599,88950  ,-2325,"3624914"],
"3624914":[126291,86712  ,-2240,"3624915"],
"3624915":[129697,84969  ,-1256,"3624916"],
"3624916":[128886,83331  ,-1416,"3624917"],
"3624917":[125036,83836  ,-2376,"3624918"],
"3624918":[124803,85970  ,-2464,"3624919"],
"3624919":[125796,87720  ,-2432,"3624920"],
"3624920":[126353,90422  ,-2296,"3624921"],
"3624921":[126171,91910  ,-2216,"3624922"],
"3624922":[122718,92355  ,-2320,"3624923"],
"3624923":[121072,93215  ,-2736,"3624901"],
"3628701":[71692 ,188004 ,-2616,"3628702"],
"3628702":[69326 ,187042 ,-3008,"3628703"],
"3628703":[68627 ,185540 ,-2984,"3628704"],
"3628704":[69077 ,184566 ,-2976,"3628705"],
"3628705":[70642 ,182573 ,-2992,"3628706"],
"3628706":[73647 ,181706 ,-3160,"3628707"],
"3628707":[74283 ,181756 ,-3152,"3628708"],
"3628708":[73655 ,182960 ,-2736,"3628709"],
"3628709":[74283 ,181756 ,-3152,"3628710"],
"3628710":[73647 ,181706 ,-3160,"3628711"],
"3628711":[70642 ,182573 ,-2992,"3628712"],
"3628712":[69077 ,184566 ,-2976,"3628713"],
"3628713":[68627 ,185540 ,-2984,"3628714"],
"3628714":[69326 ,187042 ,-3008,"3628715"],
"3628715":[71692 ,188004 ,-2616,"3628701"],
"3631801":[104150,-57163 ,-848 ,"3631802"],
"3631802":[106218,-59401 ,-1344,"3631803"],
"3631803":[106898,-59553 ,-1664,"3631804"],
"3631804":[107352,-60168 ,-2000,"3631805"],
"3631805":[107651,-61177 ,-2400,"3631806"],
"3631806":[109094,-62678 ,-3248,"3631807"],
"3631807":[108266,-62657 ,-3104,"3631808"],
"3631808":[105169,-61226 ,-2616,"3631809"],
"3631809":[102968,-59982 ,-2384,"3631810"],
"3631810":[100070,-60173 ,-2792,"3631811"],
"3631811":[98764 ,-61095 ,-2768,"3631812"],
"3631812":[94946 ,-60039 ,-2432,"3631813"],
"3631813":[96103 ,-59078 ,-1992,"3631814"],
"3631814":[96884 ,-59043 ,-1656,"3631815"],
"3631815":[97064 ,-57884 ,-1256,"3631816"],
"3631816":[96884 ,-59043 ,-1656,"3631817"],
"3631817":[96103 ,-59078 ,-1992,"3631818"],
"3631818":[94946 ,-60039 ,-2432,"3631819"],
"3631819":[98764 ,-61095 ,-2768,"3631820"],
"3631820":[100070,-60173 ,-2792,"3631821"],
"3631821":[102968,-59982 ,-2384,"3631822"],
"3631822":[105169,-61226 ,-2616,"3631823"],
"3631823":[108266,-62657 ,-3104,"3631824"],
"3631824":[109094,-62678 ,-3248,"3631825"],
"3631825":[107651,-61177 ,-2400,"3631826"],
"3631826":[107352,-60168 ,-2000,"3631827"],
"3631827":[106898,-59553 ,-1664,"3631828"],
"3631828":[106218,-59401 ,-1344,"3631829"],
"3631829":[104150,-57163 ,-848 ,"3631801"],
"3635601":[69553 ,-91746 ,-1488,"3635602"],
"3635602":[70941 ,-89751 ,-2256,"3635603"],
"3635603":[71104 ,-89094 ,-2368,"3635604"],
"3635604":[73471 ,-91462 ,-2024,"3635605"],
"3635605":[74532 ,-92202 ,-1776,"3635606"],
"3635606":[74908 ,-93152 ,-1536,"3635607"],
"3635607":[74532 ,-92202 ,-1776,"3635608"],
"3635608":[73471 ,-91462 ,-2024,"3635609"],
"3635609":[71104 ,-89094 ,-2368,"3635610"],
"3635610":[70941 ,-89751 ,-2256,"3635611"],
"3635611":[69553 ,-91746 ,-1488,"3635601"],
}

class NPC_Walk(JQuest) :
  def __init__(self,id,name,descr):
     JQuest.__init__(self,id,name,descr)
     self.addSpawn(31356,-81681,241109,-3712,0,False,0)
     self.addSpawn(31357,-86328,241120,-3734,0,False,0)
     self.addSpawn(31358,47015,51278,-2992,0,False,0)
     self.addSpawn(31359,45744,50561,-3065,0,False,0)
     self.addSpawn(31360,10826,14777,-4240,0,False,0)
     self.addSpawn(31361,22418,10249,-3648,0,False,0)
     self.addSpawn(31362,114847,-180066,-877,0,False,0)
     self.addSpawn(31363,116731,-182477,-1512,0,False,0)
     self.addSpawn(31364,-46506,-109402,-238,0,False,0)
     self.addSpawn(31365,-48807,-113489,-241,0,False,0)
     self.addSpawn(32070,90271,-143869,-1547,0,False,0)
     self.addSpawn(32072,84429,-144065,-1542,0,False,0)
     self.startQuestTimer("fort",1000, None, None)

  def onAdvEvent (self,event,npc,pc) :
    if event == "fort" :
       walk01 = self.addSpawn(35659,-55675,157012,-2034,0,False,0)
       walk02 = self.addSpawn(35690,-28169,216864,-3544,0,False,0)
       walk03 = self.addSpawn(35728,19408,189422,-3136,0,False,0)
       walk04 = self.addSpawn(35759,123383,121093,-2864,0,False,0)
       walk05 = self.addSpawn(35797,74725,1671,-3128,0,False,0)
       walk06 = self.addSpawn(35828,159377,52403,-3312,0,False,0)
       walk07 = self.addSpawn(35859,190423,43540,-3656,0,False,0)
       walk08 = self.addSpawn(35897,114436,202528,-3408,0,False,0)
       walk09 = self.addSpawn(35928,161876,-73407,-2984,0,False,0)
       walk10 = self.addSpawn(35966,71436,-58182,-2904,0,False,0)
       walk11 = self.addSpawn(36004,105447,-139845,-3120,0,False,0)
       walk12 = self.addSpawn(36035,14186,149947,-3352,0,False,0)
       walk13 = self.addSpawn(36073,-56032,86017,-3259,0,False,0)
       walk14 = self.addSpawn(36111,58314,136319,-2000,0,False,0)
       walk15 = self.addSpawn(36142,9318,92253,-3536,0,False,0)
       walk16 = self.addSpawn(36173,-80904,94098,-3152,0,False,0)
       walk17 = self.addSpawn(36211,114221,-18762,-1768,0,False,0)
       walk18 = self.addSpawn(36249,121072,93215,-2736,0,False,0)
       walk19 = self.addSpawn(36287,71692,188004,-2616,0,False,0)
       walk20 = self.addSpawn(36318,104150,-57163,-848,0,False,0)
       walk21 = self.addSpawn(36356,69553,-91746,-1488,0,False,0)
       self.startQuestTimer("3565901",1000, walk01, None)
       self.startQuestTimer("3569001",1000, walk02, None)
       self.startQuestTimer("3572801",1000, walk03, None)
       self.startQuestTimer("3575901",1000, walk04, None)
       self.startQuestTimer("3579701",1000, walk05, None)
       self.startQuestTimer("3582801",1000, walk06, None)
       self.startQuestTimer("3585901",1000, walk07, None)
       self.startQuestTimer("3589701",1000, walk08, None)
       self.startQuestTimer("3592801",1000, walk09, None)
       self.startQuestTimer("3596601",1000, walk10, None)
       self.startQuestTimer("3600401",1000, walk11, None)
       self.startQuestTimer("3603501",1000, walk12, None)
       self.startQuestTimer("3607301",1000, walk13, None)
       self.startQuestTimer("3611101",1000, walk14, None)
       self.startQuestTimer("3614201",1000, walk15, None)
       self.startQuestTimer("3617301",1000, walk16, None)
       self.startQuestTimer("3621101",1000, walk17, None)
       self.startQuestTimer("3624901",1000, walk18, None)
       self.startQuestTimer("3628701",1000, walk19, None)
       self.startQuestTimer("3631801",1000, walk20, None)
       self.startQuestTimer("3635601",1000, walk21, None)
    elif event in WALKS.keys() :
       x,y,z,nextEvent=WALKS[event]
       npc.getAI().setIntention(CtrlIntention.AI_INTENTION_MOVE_TO, L2CharPosition(x,y,z,0))
       if ((npc.getX()-100) <= x and (npc.getX()+100) >= x and (npc.getY()-100) <= y and (npc.getY()+100) >= y) :
          self.startQuestTimer(nextEvent,1000, npc, None)
       else:
          self.startQuestTimer(event,1000, npc, None)
    return


QUEST = NPC_Walk(-1, "NPC_Walk", "ai")
