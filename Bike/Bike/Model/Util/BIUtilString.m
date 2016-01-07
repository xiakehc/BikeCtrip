//
//  BIUtilString.h
//  Bike
//
//  Created by Yuki on 4/11/15.
//  Copyright (c) 2015 kyu. All rights reserved.
//

/***
 *  create by andy
 *  
 */

#import "BIUtilString.h"
#import "BILog.h"
#import "BIUtilDate.h"

@implementation BIUtilString

/**
 * 判断字串是否为空
 * @param str
 * @return
 */
+(bool)emptyOrNull:(NSString *)str
{
    return str == nil || (NSNull *)str == [NSNull null] || str.length == 0;
}

/**
 * 将string转为int ，异常时返回-1
 * @param s
 * @return
 */

+(int) toInt:(NSString *)s
{
    int i = 0;
    
    bool bo = [BIUtilString isNumString:s];
    
    if(bo == NO)
    {
        i = -1;
//        CTDigitExceptionLog(s);
        NSString *str = @"";
        
        if(s != nil)
        {
            str = [NSString stringWithFormat:@"%@",s];
        }
        
//        CTDigitExceptionLog(str);
//      BILog(str);
        BILog(@"%@", str);
    }else
    {
        i = [s intValue];
    }
    
    return i;
}

/**
 * 将string 转为long,异常时返回-1
 * @param s
 * @return
 */

+(long long) toLong:(NSString *)s
{
    long long i = 0l;

    bool bo = [BIUtilString isNumString:s];

    if(bo == NO)
    {
        i = -1l;
//      CTDigitExceptionLog(s);
        NSString *str = @"";
        
        if(s != nil)
        {
            str = [NSString stringWithFormat:@"%@",s];
        }

//      BILog(str);
        BILog(@"%@", str);
    }
    else
    {
        i = [s longLongValue];
    }

    return i;
}

/**
 * 将string 转为float,异常时返回-1
 * @param s
 * @return
 */
+(float) toFloat:(NSString *)s 
{
    float i = 0.0f;

    bool valid = [BIUtilString isValidDigitString:s];

    if(valid == NO)
    {
        i = -1;

        NSString *str = @"";

        if(s != nil)
        {
            str = [NSString stringWithFormat:@"%@",s];
        }

//      BILog(str);
        BILog(@"%@", str);
    }
    else
    {
        i = [s floatValue];
    }

    return i;
}

/**
 * 将string 转为double,异常时返回-1
 * @param s
 * @return
 */
+(double) toDouble:(NSString *)s
{
    double i = 0;

    bool valid = [BIUtilString isValidDigitString:s];

    if(valid == NO)
    {
        i = -1;

        NSString *str = @"";

        if(s != nil)
        {
            str = [NSString stringWithFormat:@"%@",s];
        }

//      BILog(str);
        BILog(@"%@", str);
    }
    else
    {
        i = [s doubleValue];
    }
    
    return i;
}

/**
 * 校验字符串是否是浮点类型的字符串
 * @param s 需要校验的字符串
 * @return 是否成功
 */
+ (bool ) isValidDigitString:(NSString *)str
{
    NSString *match=@"[0-9]+|[0-9]+[.]|[.]{1}[0-9]+|[0-9]+|[0-9]+[.]{1}[0-9]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    bool valid = [predicate evaluateWithObject:str];

    return valid;
}

+ (bool) isValidIntegerString:(NSString *)str
{
    NSString *match=@"^[0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    bool valid = [predicate evaluateWithObject:str];
    return valid;
}


/**
 * 取字串小数点前整数
 * 
 * @param s
 * @return
 */

+(NSString *) toIntString:(NSString *)s 
{
    if(s == nil || s.length == 0)
    {
        return @"";
    }

    NSRange range = [s rangeOfString:@"."];
    NSString *intString = @"";

    if(range.length != 0)
    {
        intString = [s substringToIndex:range.location];
    }
    else
    {
        intString = s;
    }

    return intString;
}

/**
 * 将null转为""
 * 
 * @param str
 * @return
 */

+(NSString *) changeNullStr:(NSString *)str 
{
    if (str == nil) 
    {
        return @"";
    }
    else
    {
        return str;
    }
}

/**
 * 判断字串是否是数字
 *
 * @param str
 * @return
 */
+(bool) isNumString:(NSString *)str
{
    NSString *match=@"[0-9]+";
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    bool valid = [predicate evaluateWithObject:str];
    return valid;
}

/**
 * 判断字串是否是数字
 * 
 * @param str
 * @return
 */
+(bool) isPassword:(NSString *)str
{
    NSString *match=@"[A-Za-z0-9\\!\\#\\@\\$\\%\\^\\&\\*\\.\\~\\`\\(\\)\\-\\_\\+\\=\\[\\]\\{\\}\\|\\;\\:\\'\\,\\.\\<\\>\\?\\/]{6,20}$";
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];

    return [predicate evaluateWithObject:str];
}

/**
 * 是否是英文
 * 
 * @param str
 * @return
 */
+(bool) isEnString:(NSString *)str 
{
    NSString *match=@"[\\s]*[A-Za-z]+[\\s]*";
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];

    return [predicate evaluateWithObject:str];
}

/**
 * 是否只有英文或者数字
 *
 * @param str
 * @return
 */
+ (BOOL)isStringOnlyEnOrNum:(NSString *)str
{
	NSString *match = @"[A-Za-z0-9]+";
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
	
    return [predicate evaluateWithObject:str];
}

/**
 * 是否中文
 * 
 * @param name
 * @return
 */
+(bool) isValidCN:(NSString *)name
{
	NSString *match=@"(^[\u4e00-\u9fa5]+$)";
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
 
    return [predicate evaluateWithObject:name];
}

/**
 * 字串是否为繁体
 * 
 * @param name
 * @return
 */
+(bool) isValidTWCN:(NSString *)name
{
	NSString *regex = @"^[萬與醜專業叢東絲兩嚴喪個爿豐臨為麗舉麼義烏樂喬習鄉書買亂爭虧雲亙亞產畝親褻嚲億僅從侖倉儀們價眾優夥會傴傘偉傳傷倀倫傖偽佇體餘傭僉俠侶僥偵側僑儈儕儂俁儔儼倆儷儉債傾傯僂僨償儻儐儲儺兒兌兗黨蘭關興茲養獸囅內岡冊寫軍農塚馮衝決況凍淨淒涼淩減湊凜幾鳳鳧憑凱擊氹鑿芻劃劉則剛創刪別剗剄劊劌剴劑剮劍剝劇勸辦務勱動勵勁勞勢勳勩勻匭匱區醫華協單賣盧鹵臥衛卻巹廠廳曆厲壓厭厙廁廂厴廈廚廄廝縣參靉靆雙發變敘疊葉號歎嘰籲後嚇呂嗎唚噸聽啟吳嘸囈嘔嚦唄員咼嗆嗚詠哢嚨嚀噝噅鹹呱響啞噠嘵嗶噦嘩噲嚌噥喲嘜嗊嘮啢嗩唕喚嘖嗇囀齧囉嘽嘯噴嘍嚳囁嗬噯噓嚶囑嚕劈囂謔團園囪圍圇國圖圓聖壙場壞塊堅壇壢壩塢墳墜壟壟壚壘墾堊墊埡墶壋塏堖塒塤堝墊垵塹墮壪牆壯聲殼壺壼處備複夠頭誇夾奪奩奐奮獎奧妝婦媽嫵嫗媯姍薑婁婭嬈嬌孌娛媧嫻嫿嬰嬋嬸媼嬡嬪嬙嬤孫學孿寧寶實寵審憲宮寬賓寢對尋導壽將爾塵堯尷屍盡層屭屜屆屬屢屨嶼歲豈嶇崗峴嶴嵐島嶺嶽崠巋嶨嶧峽嶢嶠崢巒嶗崍嶮嶄嶸嶔崳嶁脊巔鞏巰幣帥師幃帳簾幟帶幀幫幬幘幗冪襆幹並廣莊慶廬廡庫應廟龐廢廎廩開異棄張彌弳彎彈強歸當錄彠彥徹徑徠禦憶懺憂愾懷態慫憮慪悵愴憐總懟懌戀懇惡慟懨愷惻惱惲悅愨懸慳憫驚懼慘懲憊愜慚憚慣湣慍憤憒願懾憖懣懶懍戇戔戲戧戰戩戶紮撲扡執擴捫掃揚擾撫摶摳掄搶護報擔擬攏揀擁攔擰撥擇掛摯攣掗撾撻挾撓擋撟掙擠揮撏撈損撿換搗據撚擄摑擲撣摻摜摣攬撳攙擱摟攪攜攝攄擺搖擯攤攖撐攆擷擼攛擻攢敵斂數齋斕鬥斬斷無舊時曠暘曇晝曨顯晉曬曉曄暈暉暫曖劄術樸機殺雜權條來楊榪傑極構樅樞棗櫪梘棖槍楓梟櫃檸檉梔柵標棧櫛櫳棟櫨櫟欄樹棲樣欒棬椏橈楨檔榿橋樺檜槳樁夢檮棶檢欞槨櫝槧欏橢樓欖櫬櫚櫸檟檻檳櫧橫檣櫻櫫櫥櫓櫞簷檁歡歟歐殲歿殤殘殞殮殫殯毆毀轂畢斃氈毿氌氣氫氬氳彙漢汙湯洶遝溝沒灃漚瀝淪滄渢溈滬濔濘淚澩瀧瀘濼瀉潑澤涇潔灑窪浹淺漿澆湞溮濁測澮濟瀏滻渾滸濃潯濜塗濤澇淶漣潿渦溳渙滌潤澗漲澀澱淵淥漬瀆漸澠漁瀋滲溫遊灣濕潰濺漵漊潷滾滯灩灄滿瀅濾濫灤濱灘澦濫瀠瀟瀲濰潛瀦瀾瀨瀕灝滅燈靈災燦煬爐燉煒熗點煉熾爍爛烴燭煙煩燒燁燴燙燼熱煥燜燾煆溜愛爺牘犛牽犧犢強狀獷獁猶狽麅獮獰獨狹獅獪猙獄猻獫獵獼玀豬貓蝟獻獺璣璵瑒瑪瑋環現瑲璽瑉玨琺瓏璫琿璡璉瑣瓊瑤璦璿瓔瓚甕甌電畫暢疇癤療瘧癘瘍鬁瘡瘋皰屙癰痙癢瘂癆瘓癇癡癉瘮瘞瘺癟癱癮癭癩癬癲臒皚皺皸盞鹽監蓋盜盤瞘眥矓睜睞瞼瞞矚矯磯礬礦碭碼磚硨硯碸礪礱礫礎硜碩硤磽磑礄確鹼礙磧磣堿镟滾禮禕禰禎禱禍稟祿禪離禿稈種積稱穢穠穭稅穌穩穡窮竊竅窯竄窩窺竇窶豎競篤筍筆筧箋籠籩築篳篩簹箏籌簽簡籙簀篋籜籮簞簫簣簍籃籬籪籟糴類秈糶糲粵糞糧糝餱緊縶糸糾紆紅紂纖紇約級紈纊紀紉緯紜紘純紕紗綱納紝縱綸紛紙紋紡紵紖紐紓線紺絏紱練組紳細織終縐絆紼絀紹繹經紿綁絨結絝繞絰絎繪給絢絳絡絕絞統綆綃絹繡綌綏絛繼綈績緒綾緓續綺緋綽緔緄繩維綿綬繃綢綯綹綣綜綻綰綠綴緇緙緗緘緬纜緹緲緝縕繢緦綞緞緶線緱縋緩締縷編緡緣縉縛縟縝縫縗縞纏縭縊縑繽縹縵縲纓縮繆繅纈繚繕繒韁繾繰繯繳纘罌網羅罰罷羆羈羥羨翹翽翬耮耬聳恥聶聾職聹聯聵聰肅腸膚膁腎腫脹脅膽勝朧腖臚脛膠脈膾髒臍腦膿臠腳脫腡臉臘醃膕齶膩靦膃騰臏臢輿艤艦艙艫艱豔艸藝節羋薌蕪蘆蓯葦藶莧萇蒼苧蘇檾蘋莖蘢蔦塋煢繭荊薦薘莢蕘蓽蕎薈薺蕩榮葷滎犖熒蕁藎蓀蔭蕒葒葤藥蒞蓧萊蓮蒔萵薟獲蕕瑩鶯蓴蘀蘿螢營縈蕭薩蔥蕆蕢蔣蔞藍薊蘺蕷鎣驀薔蘞藺藹蘄蘊藪槁蘚虜慮虛蟲虯蟣雖蝦蠆蝕蟻螞蠶蠔蜆蠱蠣蟶蠻蟄蛺蟯螄蠐蛻蝸蠟蠅蟈蟬蠍螻蠑螿蟎蠨釁銜補襯袞襖嫋褘襪襲襏裝襠褌褳襝褲襇褸襤繈襴見觀覎規覓視覘覽覺覬覡覿覥覦覯覲覷觴觸觶讋譽謄訁計訂訃認譏訐訌討讓訕訖訓議訊記訒講諱謳詎訝訥許訛論訩訟諷設訪訣證詁訶評詛識詗詐訴診詆謅詞詘詔詖譯詒誆誄試詿詩詰詼誠誅詵話誕詬詮詭詢詣諍該詳詫諢詡譸誡誣語誚誤誥誘誨誑說説誦誒請諸諏諾讀諑誹課諉諛誰諗調諂諒諄誶談誼謀諶諜謊諫諧謔謁謂諤諭諼讒諮諳諺諦謎諞諝謨讜謖謝謠謗諡謙謐謹謾謫譾謬譚譖譙讕譜譎讞譴譫讖穀豶貝貞負貟貢財責賢敗賬貨質販貪貧貶購貯貫貳賤賁貰貼貴貺貸貿費賀貽賊贄賈賄貲賃賂贓資賅贐賕賑賚賒賦賭齎贖賞賜贔賙賡賠賧賴賵贅賻賺賽賾贗讚贇贈贍贏贛赬趙趕趨趲躉躍蹌蹠躒踐躂蹺蹕躚躋踴躊蹤躓躑躡蹣躕躥躪躦軀車軋軌軒軑軔轉軛輪軟轟軲軻轤軸軹軼軤軫轢軺輕軾載輊轎輈輇輅較輒輔輛輦輩輝輥輞輬輟輜輳輻輯轀輸轡轅轄輾轆轍轔辭辯辮邊遼達遷過邁運還這進遠違連遲邇逕跡適選遜遞邐邏遺遙鄧鄺鄔郵鄒鄴鄰鬱郟鄶鄭鄆酈鄖鄲醞醱醬釅釃釀釋裏鉅鑒鑾鏨釓釔針釘釗釙釕釷釺釧釤鈒釩釣鍆釹鍚釵鈃鈣鈈鈦鈍鈔鍾鈉鋇鋼鈑鈐鑰欽鈞鎢鉤鈧鈁鈥鈄鈕鈀鈺錢鉦鉗鈷缽鈳鉕鈽鈸鉞鑽鉬鉭鉀鈿鈾鐵鉑鈴鑠鉛鉚鈰鉉鉈鉍鈹鐸鉶銬銠鉺銪鋏鋣鐃銍鐺銅鋁銱銦鎧鍘銖銑鋌銩銛鏵銓鉿銚鉻銘錚銫鉸銥鏟銃鐋銨銀銣鑄鐒鋪鋙錸鋱鏈鏗銷鎖鋰鋥鋤鍋鋯鋨鏽銼鋝鋒鋅鋶鐦鐧銳銻鋃鋟鋦錒錆鍺錯錨錡錁錕錩錫錮鑼錘錐錦鍁錈錇錟錠鍵鋸錳錙鍥鍈鍇鏘鍶鍔鍤鍬鍾鍛鎪鍠鍰鎄鍍鎂鏤鎡鏌鎮鎛鎘鑷鐫鎳鎿鎦鎬鎊鎰鎔鏢鏜鏍鏰鏞鏡鏑鏃鏇鏐鐔钁鐐鏷鑥鐓鑭鐠鑹鏹鐙鑊鐳鐶鐲鐮鐿鑔鑣鑞鑲長門閂閃閆閈閉問闖閏闈閑閎間閔閌悶閘鬧閨聞闥閩閭闓閥閣閡閫鬮閱閬闍閾閹閶鬩閿閽閻閼闡闌闃闠闊闋闔闐闒闕闞闤隊陽陰陣階際陸隴陳陘陝隉隕險隨隱隸雋難雛讎靂霧霽黴靄靚靜靨韃鞽韉韝韋韌韍韓韙韞韜韻頁頂頃頇項順須頊頑顧頓頎頒頌頏預顱領頗頸頡頰頲頜潁熲頦頤頻頮頹頷頴穎顆題顒顎顓顏額顳顢顛顙顥纇顫顬顰顴風颺颭颮颯颶颸颼颻飀飄飆飆飛饗饜飣饑飥餳飩餼飪飫飭飯飲餞飾飽飼飿飴餌饒餉餄餎餃餏餅餑餖餓餘餒餕餜餛餡館餷饋餶餿饞饁饃餺餾饈饉饅饊饌饢馬馭馱馴馳驅馹駁驢駔駛駟駙駒騶駐駝駑駕驛駘驍罵駰驕驊駱駭駢驫驪騁驗騂駸駿騏騎騍騅騌驌驂騙騭騤騷騖驁騮騫騸驃騾驄驏驟驥驦驤髏髖髕鬢魘魎魚魛魢魷魨魯魴魺鮁鮃鯰鱸鮋鮓鮒鮊鮑鱟鮍鮐鮭鮚鮳鮪鮞鮦鰂鮜鱠鱭鮫鮮鮺鯗鱘鯁鱺鰱鰹鯉鰣鰷鯀鯊鯇鮶鯽鯒鯖鯪鯕鯫鯡鯤鯧鯝鯢鯰鯛鯨鯵鯴鯔鱝鰈鰏鱨鯷鰮鰃鰓鱷鰍鰒鰉鰁鱂鯿鰠鼇鰭鰨鰥鰩鰟鰜鰳鰾鱈鱉鰻鰵鱅鰼鱖鱔鱗鱒鱯鱤鱧鱣鳥鳩雞鳶鳴鳲鷗鴉鶬鴇鴆鴣鶇鸕鴨鴞鴦鴒鴟鴝鴛鴬鴕鷥鷙鴯鴰鵂鴴鵃鴿鸞鴻鵐鵓鸝鵑鵠鵝鵒鷳鵜鵡鵲鶓鵪鶤鵯鵬鵮鶉鶊鵷鷫鶘鶡鶚鶻鶿鶥鶩鷊鷂鶲鶹鶺鷁鶼鶴鷖鸚鷓鷚鷯鷦鷲鷸鷺鸇鷹鸌鸏鸛鸘鹺麥麩黃黌黶黷黲黽黿鼂鼉鞀鼴齇齊齏齒齔齕齗齟齡齙齠齜齦齬齪齲齷龍龔龕龜誌製谘隻裡係範鬆冇嚐嘗鬨麵準鐘彆閒儘臟拚]$";

    NSPredicate *chPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    NSMutableArray *iMutable =[NSMutableArray array];
    
    for(unsigned int i =0 ;i <[name length];i++)
    {
        NSString * iMode = [name substringWithRange:NSMakeRange(i, 1)];
        [iMutable addObject:iMode];
    }
    for (NSString * iString in iMutable)
    {
        if ([chPred evaluateWithObject:iString])
        {
            return YES;
            break;
        } 
    }
    return NO;
}

/**
 * 首字母是否中文
 * 
 * @param name
 * @return
 */
+(bool) isFirstChCnStr:(NSString *)name 
{
    if([BIUtilString emptyOrNull:name])
    {
        return false;
    }
    
    NSString *str = [name substringToIndex:1];
    if([BIUtilString isEnString:str] || [BIUtilString isNumString:str])
    {
        return false;
    }
    return true;
}

/**
 * email是否合法
 * 
 * @param email
 * @return true or false
 */
+(bool) isValidEMail:(NSString *)email 
{
    NSString *match=@"\\S+@(\\S+\\.)+[\\S]{1,6}";
//  NSString *match=@"[a-zA-Z0-9_.-]+@([a-zA-Z0-9]+\\.)+[a-zA-Z]{1,6}";
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    bool valid = [predicate evaluateWithObject:email];
    
    return valid;
}

///**
// * 输入 的字串不包含特殊字符
// * 
// * @param string
// * @return 不包则返回true 否则 返回 false
// */
+(bool) isConSpeCharacters:(NSString *)str 
{
    NSString *match=@"[\u4e00-\u9fa5]*[a-z]*[A-Z]*\\d*-*_*\\s*";
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];

    return [predicate evaluateWithObject:str];
}

/**
 * 是否为中国籍，包含港澳台
 * 
 * @param nationality
 * @return
 */
+(bool) isValidChineseNationality:(NSString *)nationality 
{
    if(nationality == nil || [nationality isEqualToString:@""] || nationality.length > 2)
    {
        return false;
    }

    NSRange range = [@"CNTWHKMO" rangeOfString:nationality];

    if(range.length == 0)
    {
        return false;
    }
    
    return true;
}

/**
 * 邮编是否正确，只验证长度以及是否全为数字
 * 
 * @param code
 * @return
 */
+(bool) isValidPostCode:(NSString *)code 
{
    if(code == nil || [code isEqualToString:@""] || code.length != 6 || ![BIUtilString isNumString:code])
    {
        return false;
    }

    return true;
}

/**
 * 验证输入的手机号是否正确 长度为11位，第一个数字是1
 * 
 * @param mobile
 * @return
 */
+(bool) isMobileNumber:(NSString *) mobile
{
    bool isMobile = false;

    if(mobile != nil && mobile.length == 11)
    {
        if([BIUtilString isNumString:mobile])
        {
            isMobile = true;
        }
    }

    return isMobile;
}

/**
 * 验证输入的手机号是否正确 长度为11位，第一个数字是1
 * @param mobile
 * @return
 */
+(bool) isMobileNumber2:(NSString *) mobile
{
    bool isMobile = false;

    if(mobile != nil && mobile.length == 11)
    {
        NSString *firstStr = [mobile substringToIndex:1];
        
        if([BIUtilString isNumString:firstStr]
           && [BIUtilString isNumString:mobile]
           && [firstStr integerValue] == 1)
        {
            isMobile = true;
        }
    }
    return isMobile;
}

/**
 * 验证输入的手机号是否正确 长度为11位，第一个数字是1
 手机格式验证     移动：134X(0-8)、135-9、150-1、157X(0-79)(TD)、158-9、182 -4、187（3G4G)、188(3G)、147(数据卡）、178（4G）
 联通：130-2、152、155-6、185-6(3G)、145(数据卡）、176（4G）
 电信：180-1(3G)、189(3G)、133、153、（1349卫通） 、177（4G）
 虚拟运营商：170
 * @param mobile
 * @return
 */
+(bool) isMobileNumberTrue:(NSString *) mobile
{
    bool isMobile = false;
    
    if(mobile != nil && mobile.length == 11)
    {
        NSString *numberStr = @"^((13[0-9])|(15[^4,\\D])|(17[0,6-8])|(147)|(145)|(18[0-9]))\\d{8}$";
        
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberStr];
        
        isMobile = [pred evaluateWithObject:mobile];
    }
    return isMobile;
}

/**
 * 身份证合法性验证，15位身份证只验证长度
 * 
 * @param idcard
 * @return
 */
+(bool) verifyID:(NSString *)idcard 
{
    if(idcard == nil || [idcard isEqualToString:@""])
    {
        return false;
    }

    idcard = [idcard stringByReplacingOccurrencesOfString:@" " withString:@""];

    if(idcard.length == 15)
    {
        // 15位时只做长度验证
        return true;
    }

    if (idcard.length != 18) 
    {
        return false;
    }

    NSString *verify = [idcard substringFromIndex:17];//idcard.substring(17, 18);
//  if (verify.equalsIgnoreCase(getVerify(idcard))) 
    verify = [verify uppercaseString];
    if([verify isEqualToString:[BIUtilString getVerify:idcard]])
    {
        return true;
    }

    return false;
}

/**
 * 计算18位身份证明后一位
 * 
 * @param eighteen
 * @return 计算出来的最后一位字串
 */
+(NSString *) getVerify:(NSString *)eighteen 
{
    int remain = 0;
    int ai[18];
    int wi[] = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 };
    char vi[] = { '1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2' };

    if(eighteen == nil || [eighteen isEqualToString:@""])
    {
        return @"";
    }

    if (eighteen.length == 18) 
    {
        eighteen = [eighteen substringToIndex:17];//eighteen.substring(0, 17);
    }

    if (eighteen.length == 17) 
    {
        int sum = 0;
        for (unsigned int i = 0; i < 17; i++)
        {
//            NSString k = eighteen.substring(i, i + 1);
//            NSRange range = NSMakeRange(i, 1);
            NSString *k = [eighteen substringWithRange:NSMakeRange(i, 1)];
//            if (@"-1".equalsIgnoreCase(k)) 
            if(k == nil || [k isEqualToString:@""])
            {
                return @"";
            }

            ai[i] = [k intValue];//toInt(k);
        }

        for (unsigned int i = 0; i < 17; i++) 
        {
            sum += wi[i] * ai[i];
        }

        remain = sum % 11;
    }

    if (remain >= 0) 
    {
//      return remain == 2 ? @"x" : vi[remain];//String.valueOf(vi[remain]);
        return [NSString stringWithFormat:@"%c",vi[remain]];
    }
    else
    {
        return @"";
    }
}

/**
 * 验证英文名合法性 符合五种格式中任意一种即可 a/b c| a/b | a b c| a b| a
 * 
 * @param name
 * @return true or false
 */
+(bool) isValidENName:(NSString *)name
{
//  bool valid = false;

    NSString * p1 = @"[\\s]*[A-Za-z]+/[A-Za-z]+[\\s]+[A-Za-z]+[\\s]*";
    NSPredicate *m1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", p1];

    NSString * p2 = @"[\\s]*[A-Za-z]+/[A-Za-z]+[\\s]*";
    NSPredicate *m2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", p2];

    NSString * p3 = @"[\\s]*[A-Za-z]+[\\s]+[A-Za-z]+[\\s]+[A-Za-z]+[\\s]*";
    NSPredicate *m3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", p3];

    NSString * p4 = @"[\\s]*[A-Za-z]+[\\s]+[A-Za-z]+[\\s]*";
    NSPredicate *m4 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", p4];

//  NSString * p5 = @"[\\s]*[A-Za-z]+[\\s]*";
//  NSPredicate *m5 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", p5];

    return [m1 evaluateWithObject:name] || [m2 evaluateWithObject:name] || [m3 evaluateWithObject:name] || [m4 evaluateWithObject:name];// || [m5 evaluateWithObject:name];
}

/**
 * 验证英文名合法性 符合两种格式中任意一种即可 a/b c| a/b
 * 
 * @param name
 * @return
 */
+(bool) isValidENName4Flight:(NSString *)name
{
    NSString * p1 = @"[\\s]*[A-Za-z]+/[A-Za-z]+[\\s]+[A-Za-z]+[\\s]*";
    NSPredicate *m1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", p1];

//  Pattern p1 = Pattern.compile("[\\s]*[A-Za-z]+/[A-Za-z]+[\\s]+[A-Za-z]+[\\s]*");// 格式"a/b c"
//  Matcher m1 = p1.matcher(name);
    NSString * p2 = @"[\\s]*[A-Za-z]+/[A-Za-z]+[\\s]*";
    NSPredicate *m2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", p2];

//  Pattern p2 = Pattern.compile("[\\s]*[A-Za-z]+/[A-Za-z]+[\\s]*");// 格式"a/b"
//  Matcher m2 = p2.matcher(name);
    return [m1 evaluateWithObject:name] || [m2 evaluateWithObject:name];//m1.matches() || m2.matches();
}

/**
 * 常旅客卡校验
 * 
 * @author yrguo
 * @param ffpCardId
 * @return
 */
+(bool) isFFPCardID:(NSString *)ffpCardId 
{
    NSString * p = @"^[A-Za-z0-9]+$";
    NSPredicate *m = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", p];

    return [m evaluateWithObject:ffpCardId];
}

/**
 * 计算EditText中输入字串的长度(按字节计算)
 *   
 * @param temp
 * @return
 */
+(int) strlen:(NSString *)temp 
{
    if(temp == nil || [temp isEqualToString:@""])
    {
        return 0;
    }

    int len = 0;

    char* p = (char*)[temp cStringUsingEncoding:NSUnicodeStringEncoding];
    
    for (unsigned int i = 0 ; i < [temp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding]; i++)
    {
        if (*p)
        {
            p++;
            len++;
        }
        else
        {
            p++;
        }
    }
    
    return len;
}

/**
 * 生日小于等于当前日期
 * 
 * @param birthday
 * @return
 */
+(bool) isValidBirthday:(NSString *)birthday
{
    if([BIUtilDate dateStringBeforeToday:birthday] || [BIUtilDate dateStringEqulsToday:birthday])
    {
        return true; 
    }
    
    return false;
}

/**
 * 证件有效期校验
 * 
 * @param birthday
 * @return
 */
+(bool) isValidCardLimitDate:(NSString *)date
{
    if([BIUtilDate dateStringAfterToday:date])
    {
        return true;
    }
    
    return false;
}

/**
 * 获取时间字串并显示成HH:MM
 * 
 * @param date
 *            不能为空需大于12
 * @return
 */
+(NSString *) getTime:(NSString *)date
{
    if(![BIUtilString emptyOrNull:date] && date.length >= 12)
    {
        while (date.length < 14) 
        {
            date = [NSString stringWithFormat:@"%@0",date];
        }
        NSDate *date1 = [BIUtilDate dateFromString:date formate:BIUtilDate.SIMPLEFORMATTYPESTRING1];
        return [BIUtilDate getCalendarStrBySimpleDateFormat:date1 simpleDateFormatType:SIMPLEFORMATTYPE13];
    }
    return @"";
}

/**
 * 将日期字串转为 2012-3-28
 * 
 * @param date
 * @return
 */
+(NSString *) parseDate:(NSString *)date
{
    NSString *str = @"";
    if(date != nil && date.length >=8)
    {
        if(date.length > 8)
        {
            date = [date substringToIndex:8];
        }
        
        NSDate *date1 = [BIUtilDate dateFromString:date formate:BIUtilDate.SIMPLEFORMATTYPESTRING6];

        str = [BIUtilDate getCalendarStrBySimpleDateFormat:date1 simpleDateFormatType:SIMPLEFORMATTYPE8];
    }
    return str;
}

/**
 * 将年，月，日，时，分，拼成14位长度的字串
 * 
 * @param _year
 *            年
 * @param _month
 *            月
 * @param _day
 *            日
 * @param _hour
 *            时
 * @param _minute
 *            分
 * @return 14位长度的字串
 */
+(NSString *) formatDateStringYear:(int )_year month:(int )_month day:(int )_day hour:(int )_hour minute:(int )_minute
{
    NSString *month = @"";
    NSString *day = @"";
    NSString *hour = @"";
    NSString *minute = @"";

    if(_month < 10)
    {
        month = [NSString stringWithFormat:@"0%d",_month];
    }
    else
    {
        month = [NSString stringWithFormat:@"%d",_month];
    }

    if(_day < 10)
    {
        day = [NSString stringWithFormat:@"0%d",_day];
    }
    else
    {
        day = [NSString stringWithFormat:@"%d",_day];
    }

    if(_hour < 10)
    {
        hour = [NSString stringWithFormat:@"0%d",_hour];
    }
    else
    {
        hour = [NSString stringWithFormat:@"%d",_hour];
    }

    if(_minute < 10)
    {
        minute = [NSString stringWithFormat:@"0%d",_minute];
    }
    else
    {
        minute = [NSString stringWithFormat:@"%d",_minute];
    }

    NSString *value = [NSString stringWithFormat:@"%d%@%@%@%@00",_year,month,day,hour,minute];

    return value;
}

/**
 * 将年，月，日拼成一个8位长的字串
 * 
 * @param year
 *            年
 * @param month
 *            月
 * @param day
 *            日
 * @return 8位长的字串
 */
+(NSString *)formatDateString:(int )_year month:(int )_month day:(int )_day
{
    NSString *year = [NSString stringWithFormat:@"%d",_year];
    NSString *month = @"";
    NSString *day = @"";

    while (year.length < 4)
    {
        year = [NSString stringWithFormat:@"0%@",year];
    }
    
    if (_month < 10)
    {
        month = [NSString stringWithFormat:@"0%d",_month];
    }
    else
    {
        month = [NSString stringWithFormat:@"%d",_month];
    }

    if (_day < 10)
    {
        day = [NSString stringWithFormat:@"0%d",_day];
    }
    else
    {
        day = [NSString stringWithFormat:@"%d",_day];
    }

    NSString *value = [NSString stringWithFormat:@"%@%@%@",year,month,day];

    return value;
}

/**
 * 时间字符串格式转换 20101001082000 -> 2010-10-01 08:20
 * 
 * @param timeStr
 * @return
 */
+(NSString *) formatDateTimeString:(NSString *)timeStr
{
    if(timeStr == nil)
    {
        return nil;
    }
    
    if(timeStr.length < 14)
    {
        return timeStr;
    }

    NSString *str = @"";
    
//  str = [BIUtilDate getStrBySimpleDateFormat:[BIUtilDate getCalendarByDateTimeStr:timeStr] SimpleDateFormatType:SIMPLEFORMATTYPE4];
//  NSDate *date = [BIUtilDate getDateByDateTimeStr:timeStr];
    NSDate *date = [BIUtilDate dateFromString:timeStr formate:BIUtilDate.SIMPLEFORMATTYPESTRING1];
    str = [BIUtilDate getCalendarStrBySimpleDateFormat:date simpleDateFormatType:SIMPLEFORMATTYPE4];
    return str;
}

/**
 * 时间格式转换并截取日期 20101001082000 -> 2010-10-01
 * 
 * @param timeStr
 * @return
 */
+(NSString *) formatDateString:(NSString *)timeStr 
{
//  if (timeStr == null)
//  {   return null;    }
    NSString *dateStr = nil;

    if(timeStr == nil)
    {
        return nil;
    }
    else if(timeStr.length < 14)
    {
        return timeStr;
    }
    else
    {
        dateStr = [[BIUtilString formatDateTimeString:timeStr] substringToIndex:10];//formatDateTimeString(timeStr).substring(0, 10);
    }
    return dateStr;
}

/**
 * 处理特殊要求字符串，将顿号换成换行符
 */
+(NSString *) processString:(NSString *)s
{
    NSString *r = @"";

    if(s != nil && ![s isEqualToString:@""])
    {
        r = [s stringByReplacingOccurrencesOfString:@"、" withString:@"\n"];
    }

    return r;
}

/**
 * 将字串中换行符(BR)替换成\n,空格替换为 " "
 * 
 * @param str
 * @return
 */
+(NSString *) formatInfo:(NSString *)str 
{
//    String strInfo = str.replace("<BR/>", "\n");
//    strInfo = strInfo.replace("<br/>", "\n");
//    strInfo = strInfo.replace("<br>", "\n");
//    strInfo = strInfo.replace("&nbsp", "");
//    strInfo = strInfo.replace("<t>", "    ");
    NSString *strInfo = [str stringByReplacingOccurrencesOfString:@"<BR/>" withString:@"\n"];
    strInfo = [strInfo stringByReplacingOccurrencesOfString:@"<br/>" withString:@"\n"];
    strInfo = [strInfo stringByReplacingOccurrencesOfString:@"<br>" withString:@"\n"];
    strInfo = [strInfo stringByReplacingOccurrencesOfString:@"&nbsp" withString:@""];
    strInfo = [strInfo stringByReplacingOccurrencesOfString:@"<t>" withString:@"    "];

    return strInfo;
}

/**
 * 将str中含有src的替换成aim str与src 不能为空。
 * 
 * @param str
 * @param src
 * @param aim
 * @return
 */
+(NSString *) replaceStr:(NSString *)str src:(NSString *)src aim:(NSString *)aim
{
    if(str == nil || str.length == 0 || src == nil || src.length == 0)
    {
        return @"";
    }

    NSRange range = [str rangeOfString:src];
    if(range.length != 0)
    {
        return [str stringByReplacingOccurrencesOfString:src withString:aim];
    }
    
    return str;
}

/**
 * 返现值
 * 
 * @param giftValue
 * @return
 */

+(NSString *) getBackMoneyString:(NSString *)giftValue 
{
    float value = [giftValue floatValue];

    if (value > 1.0f) 
    {
        return [NSString stringWithFormat:@"%.0f元",value];
    }
    else if(value > 0)
    {
        return [NSString stringWithFormat:@"%.0f%%",value * 100 ];
    }

    return @"";
}

+(int) getSeekBarProgress:(int )value minValue:(int )minValue midValue:(int )midValue maxValue:(int )maxValue
{
//    if (value < 0)
//        return 0;
    if(value < 0)
    {
        return 0;
    }
    
    if (value <= midValue)
    {
        return 50 * (value - minValue) / (midValue - minValue);
    }
    else
    {
        return 50 + 50 * (value - midValue) / (maxValue - midValue);
    }
}

+(int) getSeekBarValue:(int )progress minValue:(int )minValue midValue:(int )midValue maxValue:(int )maxValue
{
    if (progress < 0)
    {
        return 0;
    }

    if (progress <= 50) 
    {
        return (int) ((midValue - minValue) * (progress / 50.00)) + minValue;
    }
    else
    {
        int overValue = (int) ((progress - 50) * (maxValue - midValue) / 50.00);
        return midValue + overValue;
    }
}

/**
 * 姓名是否合法 姓名格式 中文|a/b c|a/b
 * 
 * @param name
 * @return
 */
+(bool) isHaveSymbolForName:(NSString *)name
{
    NSString * p = @"^[\u4e00-\u9fa5]{0,}$";
//  Pattern p = Pattern.compile("^[\u4e00-\u9fa5]{0,}$");
    NSPredicate *m = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", p];
    

    NSString * p1 = @"[\\s]*[A-Za-z]+/[A-Za-z]+[\\s]+[A-Za-z]+[\\s]*";
//  Pattern p1 = Pattern.compile("[\\s]*[A-Za-z]+/[A-Za-z]+[\\s]+[A-Za-z]+[\\s]*");// 格式"a/b c"
    NSPredicate *m1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", p1];

    
    NSString * p2 = @"[\\s]*[A-Za-z]+/[A-Za-z]+[\\s]*";
//  Pattern p2 = Pattern.compile("[\\s]*[A-Za-z]+/[A-Za-z]+[\\s]*");// 格式"a/b"
    NSPredicate *m2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", p2];

//  Matcher m = p.matcher(name);
//  Matcher m2 = p2.matcher(name);
//  Matcher m1 = p1.matcher(name);
    return [m evaluateWithObject:name] || [m1 evaluateWithObject:name] || [m2 evaluateWithObject:name];//m.matches() || m1.matches() || m2.matches();
}

/**
 * string是否有效
 * 
 * @param inputStr
 * @return
 */

+(bool) isValidStr:(NSString *)inputStr
{
    if(inputStr == nil || [inputStr isEqualToString:@""])
    {
        return false;
    }

    for (unsigned int i = 0; i < inputStr.length; i++) 
    {
        char ch = [inputStr characterAtIndex:i];

        if (!(ch >= '0' && ch <= '9') && !(ch >= 'A' && ch <= 'z') && ch != '_')
        {
            return false;
        }
    }

    return true;
}

///**
// * 返回一个中间有线的SpannableString
// * 
// * @param s
// * @return
// */
//public static SpannableString getMidLineStr(String s) {
//    SpannableString ss = new SpannableString(s);
//    ss.setSpan(new StrikethroughSpan(), 0, s.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
//    return ss;
//}
//
/**
 * 
 * @param firstStr
 * @param secondStr
 * @return
 */
+(bool) stringCompare:(NSString *)firstStr secondStr:(NSString *)secondStr
{
    if(firstStr == nil || firstStr.length == 0)
    {
        return false;
    }

    NSComparisonResult result = [firstStr compare:secondStr];

    if(result == 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

+(NSString *) getDateMessage:(NSMutableArray *)sa
{
    NSString *s = @"";
    
    if (sa != nil && sa.count >= 4) 
    {
//      s += sa[0];
        s = [NSString stringWithFormat:@"%@",[sa objectAtIndex:0]];
//      if (toInt(sa[1]) < 10)
        if([BIUtilString toInt:[sa objectAtIndex:1]] < 10)
        {
//          s += "0" + sa[1];
            s = [NSString stringWithFormat:@"%@0%@",s,[sa objectAtIndex:1]];
        }
        else
        {
//          s += sa[1];
//          s = [NSString stringWithFormat:@"%@",[sa objectAtIndex:0]];
            s = [NSString stringWithFormat:@"%@%@",s,[sa objectAtIndex:1]];
        }

//      if (toInt(sa[2]) < 10) 
        if([BIUtilString toInt:[sa objectAtIndex:2]] < 10)
        {
//          s += "0" + sa[2];
            s = [NSString stringWithFormat:@"%@0%@",s,[sa objectAtIndex:2]];
        }
        else
        {
//          s += sa[2];
            s = [NSString stringWithFormat:@"%@%@",s,[sa objectAtIndex:2]];
        }
    }

    return s;
}

/**
 * 超过四位的字串前两位后加上:
 * 
 * @param str
 * @return
 */
+(NSString *) processTimeStr:(NSString *)str
{
    NSString *s = @"";
    
//  if (str != null && str.length() >= 4) 
    if(str != nil && str.length >= 4)
    {
//      s = str.substring(0, 2) + ":" + str.substring(2, str.length());
        s = [NSString stringWithFormat:@"%@:%@",[str substringToIndex:2],[str substringFromIndex:2]];
        //str.substring(0, 2) + ":" + str.substring(2, str.length());
    }
    
    return s;
}

+ (NSString*) clipString:(NSString*)inputStr length:(int)length
{
    if (inputStr.length==0) return inputStr;
    if ([self byteLengthOfString:inputStr]<=length) return inputStr;

    int curLength = 0;
    NSMutableString* result = [NSMutableString stringWithCapacity:inputStr.length];
    for (unsigned int i=0; i<inputStr.length; i++)
    {
        NSString* string = [inputStr substringWithRange:NSMakeRange(i, 1)];
        NSInteger temp = [self byteLengthOfString:string];
        if (curLength+temp>length) { return result; }

        curLength +=temp ;
        [result appendString:string] ;
    }

    return result ;
}

/**
 * 将日期拆分并将年月日存入数组中
 * 
 * @param date
 * @return
 */
+(NSMutableArray *) getDateField:(NSString *)date
{
    NSMutableArray *fields = [NSMutableArray array];
    
    if (date != nil && date.length >= 8 )
    {
        [fields addObject:[date substringToIndex:4]];

        NSRange range = NSMakeRange(4, 2);
        [fields addObject:[date substringWithRange:range]];

        range = NSMakeRange(6, 2);
        [fields addObject:[date substringWithRange:range]];

        return fields;
    }

    return nil;
}

/**
 * 返回 日期格式 yyyyMMdd
 * 
 * @param c
 * @return
 */
+(NSString *) getDateString:(NSDate *)c 
{
    NSString *s = @"";
    if (c != nil) 
    {
       s = [BIUtilDate getCalendarStrBySimpleDateFormat:c simpleDateFormatType:SIMPLEFORMATTYPE6];
    }
    return s;
}

/**
 * 将8位的日期字串与4位的时间字串组成14位长的字串
 * 
 * @param dateStr
 * @param timeStr
 * @return
 */
+(NSString *) formatDateTimeString:(NSString *)dateStr timeStr:(NSString *)timeStr
{
    if (dateStr ==nil || timeStr == nil)
    {
        return @"";
    }

    if (dateStr.length != 8 || timeStr.length != 4)
    {
        return @"";
    }
    NSString *preStr = [NSString stringWithFormat:@"%@%@00",dateStr,timeStr];

    return preStr;//[BIUtilString formatDateTimeString:preStr];
}


/**
 * 将年，月，日 ，三个值拼成 YYYY-MM-DD
 * 
 * @param year
 * @param month
 * @param day
 * @return
 */
+(NSString *) dateToStringYear:(int)year month:(int)month day:(int)day
{
    NSString *date = @"";
    NSString *monthStr = @"";
    NSString *dayStr = @"";

    if (year < 0 || month < 0 || day < 0)
    {
        return @"";
    }

    if(month < 10)
    {
        monthStr = [NSString stringWithFormat:@"0%d",month];
    }
    else
    {
        monthStr = [NSString stringWithFormat:@"%d",month];
    }

    if(day < 10)
    {
        dayStr = [NSString stringWithFormat:@"0%d",day];
    }
    else
    {
        dayStr = [NSString stringWithFormat:@"%d",day];
    }

    date = [NSString stringWithFormat:@"%d-%@-%@",year,monthStr,dayStr];

    return date;
}


/**
 * 将字串中的两个:替换成.
 * 
 * @param d
 * @return
 */
+(NSString *) parseTude:(NSString *)d
{
    NSString *r = [d stringByReplacingOccurrencesOfString:@":" withString:@"."];

    return r;
}

/**
 * 在srcStr的position位置，插入insertStr
 * 
 * @author liuwj 2012-6-5
 * @param srcStr
 * @param insertStr
 * @param position
 * @return
 */
+(NSString *) insertSymbolInStrPotion:(NSString *)srcStr insertStr:(NSString *)insertStr position:(int )position 
{
//    if (emptyOrNull(srcStr)) {
    if(srcStr == nil || srcStr.length == 0 || insertStr == nil)
    {
        return @"";
    }

    NSString *str = @"";

    if (position > srcStr.length) 
    {
        return str;
    }

    NSMutableString *src = [NSMutableString string];
    [src appendString:srcStr];
    [src insertString:insertStr atIndex:position];

    return src;
}

/**
 * 校验yyyyMMdd日期是否合法
 * 
 * @author liuwj 2012-7-19下午3:21:59
 * @param date
 * @return 八位的年月日
 */

+(bool) isDateRight:(NSString *)date 
{
    if(date != nil && date.length == 8)
    {
        int year = -1;
        int month = -1;
        int day = -1;
        bool isLeapYear = false;//闰年
        year = [[date substringToIndex:4] intValue];
        month = [[date substringWithRange:NSMakeRange(4, 2)] intValue];
        day = [[date substringWithRange:NSMakeRange(6, 2)] intValue];
        
        if (year / 4 == 0 && year / 100 != 0) 
        {
            isLeapYear = true;//闰年
        }
        
        if (year / 400 == 0) 
        {
            isLeapYear = true;//闰年
        }
        
        switch (month) 
        {
			case 1:
			case 3:
			case 5:
			case 7:
			case 8:
			case 10:
			case 12:
				if (day <= 31 && day >= 1) 
                {
					return true;
				}
				break;
			case 2:
				if (isLeapYear) 
                {
					if (day <= 29 && day >= 1) 
                    {
						return true;
					}
				} else 
                {
					if (day <= 28 && day >= 1) 
                    {
						return true;
					}
				}
				break;
			case 4:
			case 6:
			case 9:
			case 11:
				if (day <= 30 && day >= 1) 
                {
					return true;
				}
				break;
			default:
				return false;
        }
        return false;
    }
    
    return false;
}

/**
 * 计算yyyyMMdd与yyyyMMdd之间差多少天
 * 
 * @author liuwj 2012-5-31
 * @param dateStr1
 * @param dateStr2
 * @return
 * @throws ParseException
 */
+(NSInteger) calcTwoDate:(NSString *)dateStr1 dateStr2:(NSString *)dateStr2
{
//    inttimeOffset
//    = [date2 timeIntervalSinceDate:date1]; //
//    这个是得出两个日期间相差的秒数.注意时区的问题.
//    
//    intdays
//    = timeOffset/3600/24;
    
    if(![BIUtilString isDateRight:dateStr1])
    {
        return 0;
    }

    if(![BIUtilString isDateRight:dateStr2])
    {
        return 0;
    }

//    NSDate *date1 = [];
//    NSDate *date2 = [];
    
//    SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
    long nd = 24 * 60 * 60;// 一天的秒数
//    long diff;
    
    NSDate *date1 = [BIUtilDate dateFromString:dateStr1 formate:@"yyyyMMdd"];
    NSDate *date2 = [BIUtilDate dateFromString:dateStr2 formate:@"yyyyMMdd"];
    
    // 获得两个时间的毫秒时间差异
//    diff = sd.parse(dateStr2).getTime() - sd.parse(dateStr1).getTime();
    long diff = [date2 timeIntervalSinceDate:date1];
    
    long day = diff / nd;// 计算差多少天

    if(day < 0)
    {
        day *= -1;
    }
//    return (int) (day);
    return day;
}

/**
 * 计算yyyyMMddHHmm与yyyyMMddHHmm之间差多少分钟
 * 
 * @author liuwj 2012-5-31
 * @param dateStr1
 * @param dateStr2
 * @return
 * @throws ParseException
 */
+(NSInteger ) calcTwoDateTime:(NSString *)dateStr1 dateStr2:(NSString *)dateStr2
{
    if(dateStr1 == nil || dateStr2 == nil || dateStr1.length != 12 || dateStr2.length != 12)
    {
        return 0;
    }
    
    //    SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmm");
    long nd = 24 * 60 * 60;// 一天的秒数
    long nh = 60 * 60;// 一小时的秒数
    long nm = 60;// 一分钟的秒数
    long diff;
    
    NSDate *date1 = [BIUtilDate dateFromString:dateStr1 formate:@"yyyyMMddHHmm"];
    NSDate *date2 = [BIUtilDate dateFromString:dateStr2 formate:@"yyyyMMddHHmm"];
    // 获得两个时间的毫秒时间差异
//    diff = sd.parse(dateStr2).getTime() - sd.parse(dateStr1).getTime();
    diff = [date1 timeIntervalSinceDate:date2];
    long day = diff / nd;// 计算差多少天
    long hour = diff % nd / nh;// 计算差多少小时
    long min = diff % nd % nh / nm;// 计算差多少分钟
//    return Math.abs((int) (min + hour * 60 + day * 3600));
    long num = min + hour * 60 + day * 3600;
    
    if(num < 0)
    {
        num *= -1;
    }
    
    return num;
}

/**
 * 计算两个日期
 * 
 * @author liuwj 2012-6-6
 * @param dateStr1
 * @param dateStr2
 * @param minusPlus
 * @return
 */
+(NSInteger) calcGlobalTwoTime:(NSString *)dateStr1 dateStr2:(NSString *)dateStr2
{
    if(dateStr1 == nil || dateStr2 == nil || dateStr1.length != 8 || dateStr2.length != 8)
    {
        return 0;
    }
    
    long nd = 24 * 60 * 60;// 一天的秒数
    long diff;
    
    // 获得两个时间的毫秒时间差异
    NSDate *date1 = [BIUtilDate dateFromString:dateStr1 formate:@"yyyyMMdd"];
    NSDate *date2 = [BIUtilDate dateFromString:dateStr2 formate:@"yyyyMMdd"];
    diff = [date1 timeIntervalSinceDate:date2];

    long day = diff / nd;// 计算差多少天

    if(day < 0)
    {
        day *= -1;
    }
    
    return day;
}

/**
 * 计算两个String类型的时间之和
 * 
 * @author liuwj 2012-7-17下午6:09:44
 * @param time1
 * @param time2
 * @return
 */

+(int) plusGlobalTwoTime:(NSString *)time1 time2:(NSString *)time2 
{
    int timeA = 0, timeB = 0;
    
//    if (!emptyOrNull(time1)) 
    if (![BIUtilString emptyOrNull:time1]) 
    {
        timeA = [BIUtilString toInt:time1];//toInt(time1);
    }
    
    if (![BIUtilString emptyOrNull:time2]) 
    {
        timeB = [BIUtilString toInt:time2];//toInt(time2);
    }
    
    return timeA + timeB;
}

/**
 * 公里转化米
 * 支持小数
 * @return
 */
+(NSString *) kilometreToMetre:(NSString *)kilometre
{
    NSString *retStr = @"";
    
    if([BIUtilString emptyOrNull:kilometre])
    {
        return retStr;
    }
    
    float floatData = [BIUtilString toFloat:kilometre] * 1000;
    
    if(floatData == -1000.0f)
    {
        return retStr;
    }
    
    retStr = [NSString stringWithFormat:@"%.0f",floatData];
    
    return retStr;
}

/**
 * 米 转化 公里
 * 最多保留一位小数
 * @parm  metre 数字
 * @return 
 */
+(NSString *) metreToKilometre:(NSString *)metre
{
    NSString *retStr = @"";
    if([BIUtilString emptyOrNull:metre])
    {
        return retStr;
    }
    
    if([BIUtilString toInt:metre] == -1)
    {
        return retStr;
    }

    float floatData = [BIUtilString toInt:metre]/(1000.0f);

    retStr = [NSString stringWithFormat:@"%.1f",floatData];
    
    return retStr;
}

/**
 * 字符串的字节数，一个汉字是2个字节
 * @string 被检测的字符串
 * @return 字节数
 */
+(NSInteger) byteLengthOfString:(NSString *)string
{
    if (string.length==0) return 0 ;
    char *problem_char = (char *)[string cStringUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)] ;
    return strlen(problem_char) ;
}

#pragma mark 按符号分割字符串

+(NSMutableArray *)separatedByDot:(NSString *)str Dot:(NSString *)dot
{
    NSMutableArray *separatedList = [[NSMutableArray alloc] init];
    if([BIUtilString emptyOrNull:str] || [BIUtilString emptyOrNull:dot])
    {
        return separatedList;
    }
    
    NSArray *arrayByDot = [str componentsSeparatedByString:dot];
    
    for (unsigned int i = 0 ; i < [arrayByDot count]; i++)
    {
        NSString *stringItem = [arrayByDot objectAtIndex:i];
        stringItem = [stringItem stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if(![BIUtilString emptyOrNull:stringItem]){
            [separatedList addObject:stringItem];
        }
    }
    return separatedList;
}
#pragma mark 将string list根据符号拼接   list1 dot list2 dot 去掉最前面的dot
+(NSString *)splicedByDot:(NSMutableArray *)list Dot:(NSString *)dot
{
    NSMutableString *mutableStr = [[NSMutableString alloc] init];
    if ([list count]>0)
    {
        [mutableStr setString:[list objectAtIndex:0]];
    }
    for(unsigned int i = 1 ; i < [list count]; i++)
    {
        NSString *stringItem = [list objectAtIndex:i];
        if(![BIUtilString emptyOrNull:stringItem])
        {
            [mutableStr appendFormat:@"%@%@",dot,stringItem];
        }
    }
    return mutableStr;
}


+(bool ) validIsPicture:(NSString *)urlStr
{
    NSString * regex        = @"([\"(]+[\\S]+[.pngjgf]{4}$)";
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    bool isMatch            = [pred evaluateWithObject:@"(a.png"];
    
    return isMatch;
}

+(NSMutableArray *) capturePictureUrl:(NSString *)content
{
    NSMutableArray *retArray = [NSMutableArray array];
    
    NSArray *array = [content componentsSeparatedByString:@"\""];
    
    for(unsigned int i = 0; i < [array count]; i++)
    {
        NSString *sub = [array objectAtIndex:i];
        
        if(sub != nil &&([sub hasSuffix:@".png"] || [sub hasSuffix:@".gif"] || [sub hasSuffix:@".jpeg"]))
        {
            [retArray addObject:sub];
        }
    }
    
    content = [content stringByReplacingOccurrencesOfString:@")" withString:@"("];
    
    NSArray *array1 = [content componentsSeparatedByString:@"("];
    
    for(unsigned int i = 0; i < [array1 count]; i++)
    {
        NSString *sub = [array1 objectAtIndex:i];
        
        if(sub != nil &&([sub hasSuffix:@".png"] || [sub hasSuffix:@".gif"] || [sub hasSuffix:@".jpeg"]) && [BIUtilString isContainUrlStr:sub array:array1])
        {
            [retArray addObject:sub];
        }
    }
    
    return  retArray;
}

+ (bool )isContainUrlStr:(NSString *)url array:(NSArray *)array
{
    bool isContain = NO;
    
    for(unsigned int i = 0; i < [array count]; i++)
    {
        NSString *urlstr = [array objectAtIndex:i];

        if(urlstr != nil && [urlstr isEqualToString:url])
        {
            isContain = YES;
            break;
        }
    }
    
    return isContain;
}


/******
 删除身份证中所有非X和非数字的的字符
 @param idCardNo 判断的身份证号码
 */
+ (NSString *) handleWithIdCardNumber:(NSString *)idCardNo
{
    NSString *retStr = @"";
    
    if(idCardNo == nil || idCardNo == nil)
    {
        return retStr;
    }
    else
    {
        bool isContain = NO;

        for(unsigned int i = 0; i < [idCardNo length]; i++)
        {
            NSRange range = NSMakeRange(i, 1);
            NSString *str = [idCardNo substringWithRange:range];
            
            if(![str isEqualToString:@"X"] &&![str isEqualToString:@"x"] && ![BIUtilString isNumString:str])
            {
                isContain = YES;
                break;
            }
        }

        if(isContain == YES)
        {
            while(isContain)
            {
                NSInteger index = 0;

                isContain = NO;

                for(unsigned int i = 0; i < [idCardNo length]; i++)
                {
                    NSRange range = NSMakeRange(i, 1);
                    NSString *str = [idCardNo substringWithRange:range];
                    
                    if(![str isEqualToString:@"X"] &&![str isEqualToString:@"x"] && ![BIUtilString isNumString:str])
                    {
                        isContain = YES;
                        index = i;
                        break;
                    }
                }

                if(isContain)
                {
                    NSRange range = NSMakeRange(index, 1);
                    idCardNo = [idCardNo stringByReplacingCharactersInRange:range withString:@""];
                }
            }

            retStr = idCardNo;
        }
        else
        {
            retStr = idCardNo;
        }
    }
    
    return retStr;
}


#pragma mark
#pragma mark 添加处理 double,float类型数据到字符串的方法

/**
 使用double 或者是 float 类型的数据到字符串(如果是 6.00000 转化成 6 ,6.01300 还是转化成 6.013)
 @param decimalfraction 浮点型数据
 */
+ (NSString *) convertMoneyFromDoubleValue:(double )doubleValue
{
    NSString *retStr = @"-1";

    if(doubleValue < 0)
    {
        NSString *s = [NSString stringWithFormat:@"%f",doubleValue];
        BILog(@"%@", s);
    }else
    {
        // 检测小数点后面有几位不是0
        NSString *str = [NSString stringWithFormat:@"%lf",doubleValue];

        NSRange range = [str rangeOfString:@"."];

        // 如果是0
        if(range.length > 0)
        {
            NSRange subRange = NSMakeRange(range.location, str.length - range.location);

            retStr = [str substringWithRange:subRange];

            int a = 0;

            for(unsigned int i = 0; i < [retStr length]; i++)
            {
                NSRange ran = NSMakeRange(i, 1);
                
                NSString *subIndex = [retStr substringWithRange:ran];

                if([subIndex intValue] != 0)
                {
                    a = i;
                }
            }
            
            NSMutableString *s = [[NSMutableString alloc] initWithString:@"%."];
            [s appendString:[NSString stringWithFormat:@"%df",a]];
            retStr = [NSString stringWithFormat:[s description],retStr];
        }else
        {
            retStr = [NSString stringWithFormat:@"%.0f",doubleValue];
        }
    }
    return retStr;
}

+ (NSString *) convertRMBDisplayString:(NSInteger)rmbCents
{
    if(rmbCents == 0) return @"0";
    if(rmbCents < 0) {
#ifdef InDev
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"转换金额出错" message:@"金额不能为负数。这个提示只是在开发环境提示，给你带来的困扰，敬请谅解！" delegate:nil cancelButtonTitle:@"没关系" otherButtonTitles:nil] ;
        [alert show] ;
         ;
#endif
        return @"";
    }
    NSDecimalNumber *priceNumber = nil;
    if(rmbCents % 100 == 0)
    {
        priceNumber = [[NSDecimalNumber alloc] initWithInteger:rmbCents/100];
    }
    else
    {
        priceNumber = [[NSDecimalNumber alloc] initWithMantissa:rmbCents exponent:-2 isNegative:NO];
    }    
    return [priceNumber stringValue];
}

+ (NSString *) convertRMBIntDisplayString:(NSInteger)rmbCents
{
    if(rmbCents == 0) { return @"0"; }
    if(rmbCents < 0)
    {
#ifdef InDev
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"转换金额出错" message:@"金额不能为负数。这个提示只是在开发环境提示，给你带来的困扰，敬请谅解！" delegate:nil cancelButtonTitle:@"没关系" otherButtonTitles:nil] ;
        [alert show] ;
         ;
#endif
        return @"";
    }

    return [NSString stringWithFormat:@"%ld", (rmbCents + 50)/100];
}

+ (NSString *) convertRMBMaxIntDisplayString:(NSInteger)rmbCents
{
    if(rmbCents == 0) { return @"0"; }
    if(rmbCents < 0)
    {
#ifdef InDev
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"转换金额出错" message:@"金额不能为负数。这个提示只是在开发环境提示，给你带来的困扰，敬请谅解！" delegate:nil cancelButtonTitle:@"没关系" otherButtonTitles:nil] ;
        [alert show] ;
        ;
#endif
        return @"";
    }

    if (rmbCents % 100 > 0) {
        rmbCents += 100;
    }

    return [NSString stringWithFormat:@"%ld", rmbCents/100];
}

#pragma mark 将字符串缩至特定长度并替换指定字符
+ (NSString *)convertString:(NSString *)oldStr toLength:(int)length replace:(NSString *)replaceStr to:(NSString *)toStr
{
    NSString *tempStr = oldStr;
    if (![replaceStr isEqualToString:@""]||![toStr isEqualToString:@""])
    {
        tempStr = [tempStr stringByReplacingOccurrencesOfString:replaceStr withString:toStr];
    }
    if ([tempStr length]>length)
    {
        tempStr = [tempStr substringToIndex:length];
    }
    return tempStr;
}

/**
 货币符号转换
 @param NSString *currency 需要转换的货币三字码
 @return NSString* 货币符号
 */
+ (NSString *)changeCurrency:(NSString *)currency
{
  NSString *retCurrency = @"";
  
  if(currency != nil && [currency isEqualToString:@"RMB"])
  {
      retCurrency = @"￥";
  }
  else if(currency != nil)
  {
    retCurrency = currency;
  }
  
  return retCurrency;
}

#pragma mark - 英文名 lastname/firstname midname 区分为3个name
/**
 英文名拆分
 @param lastname/firstname midname
 @return 数组 lastname firstname midname
 */
+(NSMutableArray*)separateEnglishName:(NSString*)englishName
{
    NSMutableArray* englishNameArray = [[NSMutableArray alloc] initWithCapacity:1];
    
    NSArray* lastName = [englishName componentsSeparatedByString:@" "];
    
    if ([lastName count] >= 1)
    {
        NSArray* firstName = [[lastName objectAtIndex:0] componentsSeparatedByString:@"/"];
        
        if ([firstName count] >= 1)
        {
            [englishNameArray addObject:[firstName objectAtIndex:0]];
        }
        else
        {
            [englishNameArray addObject:@""];
        }
        
        if ([firstName count] == 2)
        {
            [englishNameArray addObject:[firstName objectAtIndex:1]];
        }else
        {
            [englishNameArray addObject:@""];
        }
    }
    else
    {
        [englishNameArray addObject:@""];
        [englishNameArray addObject:@""];
    }

    if ([lastName count] == 2)
    {
        [englishNameArray addObject:[lastName objectAtIndex:1]];
    }
    else
    {
        [englishNameArray addObject:@""];
    }
    
    return englishNameArray;
}

#pragma mark - 服务 统一转码

/**
 返回服务端的encoding类型
 @param 
 @return NSStringEncoding
 */
+(NSStringEncoding)getServerEncode
{
    return CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
}

/**
 返回特殊服务编码类型: utf-8
 @param
 @return NSStringEncoding
 */
+(NSStringEncoding)getUTF8Encode
{
    return NSUTF8StringEncoding;
}

/**
 将char*类型按照gbk编码格式转换为NSString
 @param char* 
 @return string
 */
+(NSString *)getStrFromCharArrayByServerEncode:(char *) charArray
                                  encodingCode:(NSStringEncoding) encodingCode
{
    NSString *str = [[NSString alloc] initWithCString:charArray encoding:encodingCode];
    if(str == nil){
        str = [[NSString alloc] init];
    }
    return str;
}

/**
 将NSdata类型按照gbk编码格式转换为NSString
 @param data
 @param encoding
 @return string
 */
+(NSString *)getStrFromNSDataByServerEncode:(NSData *) data
                               encodingCode:(NSStringEncoding) encodingCode
{
    NSString *str = [[NSString alloc] initWithData:data encoding:encodingCode];
    if(str == nil){
        str = [[NSString alloc] init];
    }
    return str;
}

/**
 将NSString类型按照gbk编码格式转换为NSData
 @param string
 @param encoding
 @return data
 */
+(NSData *)getNSDataFromStrByServerEncode:(NSString *) str
                             encodingCode:(NSStringEncoding) encodingCode
{
    NSData *data = [str dataUsingEncoding:encodingCode];
    if(data == nil){
        data = [NSData data];
    }
    return data;
}

/**
 将char类型按照给定编码格式转换为NSString
 @param char
 @param encoding
 @return string
 */
+(NSString *)getStrFromCharByEncode:(char*) strChar
                           encoding:(NSStringEncoding) encodingCode
{
    NSString *encodingStr = @"";
    if (strChar)
    {
        NSInteger len = strlen((char *)strChar);
        if (len > 0)
        {
            encodingStr = [NSString stringWithCString:strChar encoding:encodingCode];
        }
    }
    return encodingStr;
}

/**
 * 保留一位小数，第二位小数四舍五入.
 * 如果value为非数字，返回0.0
 * @param value
 * @return
 */
+(NSString* )toOneDecimal:(NSString *)value
{
    return [NSString stringWithFormat:@"%.1f",(double)[value doubleValue]];
}

/**
 *	@brief	返回传入字符串的拼音首字母
 *
 *	@param 	 	str 传入字符
 *
 *	@return	NSString 首位拼音字母
 */
+(NSString *)firstLatter:(NSString *)str
{
    if (!str) {
        return @"";
    }
    NSMutableString *newStr = [NSMutableString stringWithString:str];
    CFRange range = CFRangeMake(0, newStr.length);
    CFStringTransform((CFMutableStringRef)newStr, &range, kCFStringTransformMandarinLatin, NO);
    CFStringTransform((CFMutableStringRef)newStr, &range, kCFStringTransformStripCombiningMarks, NO);
    return [newStr substringToIndex:1];//获取中文拼音的首字母
}


+ (NSString *)getTheEnclosedStringFrom:(NSString *)string wiithLeftBand:(NSString *)leftBand rightBand:(NSString *)rightBand
{
    NSString *str = nil;
    
    NSRange leftRange = [string rangeOfString:leftBand];
    
    NSRange rightRange = [string rangeOfString:rightBand];
    
    if (leftRange.length == 0 || rightRange.length == 0) {
        return string;
    }
    
    NSString *tmp = [string substringToIndex:rightRange.location];
    
    str = [tmp substringFromIndex:leftRange.location + leftRange.length];
    
    return str;
}

+ (NSString *)trimXSSString:(NSString *)string
{
    NSString *tmpString = [string stringByReplacingOccurrencesOfString:@"<" withString:@""];
    tmpString = [tmpString stringByReplacingOccurrencesOfString:@">" withString:@""];
    return tmpString;
}

@end