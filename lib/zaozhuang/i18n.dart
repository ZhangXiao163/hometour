import 'package:flutter/material.dart';

/// ── 全局语言状态 ─────────────────────────────────────────────────
class AppLocale extends ChangeNotifier {
  static final AppLocale instance = AppLocale._();
  AppLocale._();

  String _lang = 'ko';
  String get lang => _lang;
  bool get isZh => _lang == 'zh';
  bool get isKo => _lang == 'ko';

  void setLang(String l) {
    if (_lang != l) {
      _lang = l;
      notifyListeners();
    }
  }

  void toggle() {
    _lang = _lang == 'zh' ? 'ko' : 'zh';
    notifyListeners();
  }

  /// 便捷静态访问（不会触发重建，仅供一次性读取）
  static String get current => instance._lang;
}

/// ── 双语字符串 ──────────────────────────────────────────────────
class L10nString {
  final String zh;
  final String ko;
  const L10nString({required this.zh, required this.ko});

  /// 根据 locale 返回对应语言文本
  String text(String locale) => locale == 'ko' ? ko : zh;

  /// 直接根据当前全局语言返回
  String get t => AppLocale.current == 'ko' ? ko : zh;
}

/// ── 全局 UI 翻译 key ───────────────────────────────────────────
class I18n {
  I18n._();

  // ── main.dart 主页 ──────────────────────────────────────────
  static String searchHint(String l) =>
      l == 'ko' ? '목적지 / 명소 / 호텔 검색' : '搜索目的地 / 景点 / 酒店';
  static String headerLine1(String l) =>
      l == 'ko' ? '학생 기말 과제:' : '学生期末作业：';
  static String headerLine2(String l) =>
      l == 'ko' ? '4대 추천 도시' : '四个精选城市';
  static String exploreMore(String l) => l == 'ko' ? '더 보기' : '探索更多';
  static String exploreSub(String l) =>
      l == 'ko' ? '명소, 호텔, 항공권, 여행 가이드' : '景点、酒店、机票、攻略';
  static String viewDetail(String l) =>
      l == 'ko' ? '상세 보기' : '查看详情';

  // ── 城市数据 ────────────────────────────────────────────────
  static String cityNameZaozhuang(String l) =>
      l == 'ko' ? '짜오좡' : '枣庄';
  static String cityDescZaozhuang(String l) =>
      l == 'ko' ? '고대 운하의 강변, 루난 수향 문화' : '古运河畔 鲁南水乡文化';
  static String cityDetailZaozhuang(String l) => l == 'ko'
      ? '짜오좡은 산둥성 남부에 위치한 유명한 타이얼좡 고성의 소재지입니다. 중국에서 가장 잘 보존된 고대 운하 문화 유적지가 있으며, 수로가 교차하고 고풍스러운 운치가 있습니다. 웨이산호 습지는 경치가 아름답고 봄에는 연꽃이 만발하여 조류 관찰과 휴식에 최적의 장소입니다.'
      : '枣庄位于山东南部，是著名的台儿庄古城所在地。这里有中国保存最完好的古运河文化遗址，水巷交错，古韵悠然。微山湖湿地风光旖旎，春季荷花盛开，是观鸟和休闲的绝佳去处。';

  static String cityNameShanghai(String l) => l == 'ko' ? '상하이' : '上海';
  static String cityDescShanghai(String l) =>
      l == 'ko' ? '현대적인 대도시, 화려한 현대 풍경' : '摩登都市，现代繁华景象';
  static String cityDetailShanghai(String l) => l == 'ko'
      ? '상하이는 중국에서 가장 국제화된 도시로, 와이탄의 만국 건축군과 루자쭈이의 마천루가 서로 어우러집니다. 난징루 보행자 거리는 번화하고 활기차며, 위위안은 고색창연합니다. 밤이 되면 황푸강 양안의 조명이 환상적입니다.'
      : '上海是中国最国际化的都市，外滩的万国建筑群与陆家嘴的摩天大楼交相辉映。南京路步行街繁华热闹，豫园古色古香，夜晚的黄浦江两岸灯火通明，美不胜收。';

  static String cityNameChengdu(String l) => l == 'ko' ? '청두' : '成都';
  static String cityDescChengdu(String l) =>
      l == 'ko' ? '느긋한 도시, 미식과 판다의 고향' : '休闲慢城，美食熊猫之乡';
  static String cityDetailChengdu(String l) => l == 'ko'
      ? '청두는 서남 지역의 휴식 도시로, 자이언트 판다, 훠궈, 여유로운 라이프스타일로 유명합니다. 콴자이샹쯔는 청나라 시대의 거리 풍경을 보존하고 있으며, 진리 옛 거리는 삼국 문화의 분위기가 가득합니다. 이곳 사람들은 차 마시기와 마작을 즐기며 천천히 아름다운 삶을 누립니다.'
      : '成都是西南地区的休闲之都，以大熊猫、火锅和悠闲的生活方式闻名。宽窄巷子保留了清代的街巷风貌，锦里古街充满三国文化气息，这里的人们爱喝茶、爱打麻将，节奏慢而美好。';

  static String cityNameXian(String l) => l == 'ko' ? '시안' : '西安';
  static String cityDescXian(String l) =>
      l == 'ko' ? '천년 고도, 대당불야성' : '千年古都，大唐不夜城';
  static String cityDetailXian(String l) => l == 'ko'
      ? '시안은 중화 문명의 중요한 발상지로, 13개 왕조의 고도였습니다. 진시황 병마용은 "세계 8대 불가사의"로 불리며, 대안탑은 현장 스님의 경전 구법 여행을 증명합니다. 대당불야성은 밤이면 화려하게 빛나고, 후이민 거리의 양고기 파오모는 잊을 수 없는 맛을 선사합니다.'
      : '西安是中华文明的重要发祥地，曾是十三朝古都。秦始皇兵马俑被誉为"世界第八大奇迹"，大雁塔见证了玄奘取经的历史。大唐不夜城夜晚流光溢彩，回民街的羊肉泡馍令人回味无穷。';

  // ── ZaoZhuang.dart ─────────────────────────────────────────
  static String zaozhuangCity(String l) => l == 'ko' ? '짜오좡시' : '枣庄市';
  static String categoryScenic(String l) => l == 'ko' ? '명소·즐길거리' : '景点玩乐';
  static String categoryGuide(String l) => l == 'ko' ? '가이드' : '攻略';
  static String categoryTravelogue(String l) => l == 'ko' ? '여행기' : '游记';
  static String categoryHotel(String l) => l == 'ko' ? '호텔' : '酒店';
  static String categoryDayTour(String l) => l == 'ko' ? '당일치기' : '一日游';

  static String hotQ1(String l) =>
      l == 'ko' ? '타이얼좡 고성 입장료는?' : '台儿庄古城门票多少';
  static String hotQ2(String l) =>
      l == 'ko' ? '짜오좡 필수 특산품 리스트' : '枣庄必买特产清单';
  static String hotQ3(String l) =>
      l == 'ko' ? '웨이산호 연꽃은 몇 월에 피나요?' : '微山湖荷花几月开';
  static String hotQ4(String l) =>
      l == 'ko' ? '짜오좡 석류원 가는 법' : '枣庄石榴园怎么去';

  static String polarisGuide(String l) =>
      l == 'ko' ? '북극성 가이드' : '北极星攻略';
  static String featuredNotes(String l) =>
      l == 'ko' ? '추천 여행기' : '精选游记';
  static String more(String l) => l == 'ko' ? '더보기' : '更多';
  static String officialGuide(String l) =>
      l == 'ko' ? '공식\n가이드' : '官方\n攻略';
  static String updatedDate(String l) =>
      l == 'ko' ? '2026.04 업데이트' : '2026.04更新';

  static String guide0Title(String l) =>
      l == 'ko' ? '짜오좡 완벽 가이드' : '枣庄全攻略';
  static String guide1Title(String l) =>
      l == 'ko' ? '타이얼좡 고성' : '台儿庄古城';
  static String guide2Title(String l) =>
      l == 'ko' ? '웨이산호 습지' : '微山湖湿地';
  static String guide3Title(String l) =>
      l == 'ko' ? '석류원 꽃놀이' : '石榴园赏花';
  static String guide4Title(String l) =>
      l == 'ko' ? '호텔 숙박 가이드' : '酒店住宿指南';
  static String guide5Title(String l) =>
      l == 'ko' ? '짜오좡 미식 지도' : '枣庄美食地图';

  static String microHotelGuide(String l) =>
      l == 'ko' ? '숙박 미니 가이드' : '住宿微攻略';
  static String newBadge(String l) => 'NEW';

  // ── 热门问题 ─────────────────────────────────────────────────
  static String hotQuestionsTitle(String l) =>
      l == 'ko' ? '자주 묻는 질문' : '热门问题';

  static String hotQ1Answer(String l) => l == 'ko'
      ? '약 118위안/인, 할인 행사 자주 있음'
      : '约 118 元/人，常有优惠活动';
  static String hotQ2Answer(String l) => l == 'ko'
      ? '석류주, 산팅 화자오, 웨이산호 염지 오리알'
      : '石榴酒、山亭花椒、微山湖咸鸭蛋';
  static String hotQ3Answer(String l) => l == 'ko'
      ? '7월 중순 – 8월 중순, 7월 말이 절정'
      : '7月中旬 – 8月中旬，7月下旬最盛';
  static String hotQ4Answer(String l) => l == 'ko'
      ? '이청구에 위치, 시내에서 버스 또는 자가용으로 약 30분'
      : '位于峄城区，市区乘公交或自驾约30分钟';

  // ── 住宿微攻略卡片 ────────────────────────────────────────────
  static String hotelCard1Title(String l) =>
      l == 'ko' ? '고성 부티크 객잔' : '古城精品客栈';
  static String hotelCard1Desc(String l) => l == 'ko'
      ? '백년 고택 개조, 수로 전망, 야간 등불 축제 도보 가능'
      : '百年老宅改建，推窗见水巷，步行可达夜灯会';
  static String hotelCard2Title(String l) =>
      l == 'ko' ? '호수 전망 민박' : '湖畔民宿';
  static String hotelCard2Desc(String l) => l == 'ko'
      ? '웨이산호 근처, 새소리와 함께 아침을, 농가 별미 체험'
      : '微山湖畔，清晨伴鸟鸣醒来，农家菜体验';
  static String hotelCard3Title(String l) =>
      l == 'ko' ? '시내 스타 호텔' : '市区舒适酒店';
  static String hotelCard3Desc(String l) => l == 'ko'
      ? '고속철도역 인근, 시설 완비, 비즈니스 여행에 최적'
      : '靠近高铁站，设施齐全，性价比之选';
  static String hotelPriceFrom(String l) =>
      l == 'ko' ? '최저 ' : '¥';
  static String hotelPriceSuffix(String l, String price) =>
      l == 'ko' ? '원부터' : ' 起';
  static String lookHotel(String l) =>
      l == 'ko' ? '보러가기' : '去看看';

  // ── 景点玩乐页 ────────────────────────────────────────────────
  static String scenicPageTitle(String l) =>
      l == 'ko' ? '짜오좡 명소' : '枣庄景点';
  static String scenicSpot1Name(String l) =>
      l == 'ko' ? '타이얼좡 고성' : '台儿庄古城';
  static String scenicSpot1Desc(String l) => l == 'ko'
      ? '살아있는 고대 운하, 야간 등불과 수로의 환상적인 풍경'
      : '活着的古运河，桨声灯影里的江北水乡';
  static String scenicSpot2Name(String l) =>
      l == 'ko' ? '웨이산호 습지' : '微山湖湿地';
  static String scenicSpot2Desc(String l) => l == 'ko'
      ? '중국 북부 최대 담수호, 연꽃과 철새의 천국'
      : '中国北方最大淡水湖，万亩荷花与候鸟天堂';
  static String scenicSpot3Name(String l) =>
      l == 'ko' ? '관세석류원' : '冠世榴园';
  static String scenicSpot3Desc(String l) => l == 'ko'
      ? '세계 최대 석류 정원, 5월 붉은 꽃이 산야를 물들임'
      : '世界最大石榴园，五月榴花红遍山野';
  static String scenicSpot4Name(String l) =>
      l == 'ko' ? '바오두구 국가삼림공원' : '抱犊崮国家森林公园';
  static String scenicSpot4Desc(String l) => l == 'ko'
      ? '루난 최고봉, 삼림욕과 등산 애호가의 천국'
      : '鲁南第一高峰，森林氧吧与登山胜地';
  static String scenicSpot5Name(String l) =>
      l == 'ko' ? '타이얼좡 전투 기념관' : '台儿庄大战纪念馆';
  static String scenicSpot5Desc(String l) => l == 'ko'
      ? '항일 전쟁 역사를 기억하다, 붉은 문화 명소'
      : '铭记抗战历史，红色文化圣地';
  static String scenicSpot6Name(String l) =>
      l == 'ko' ? '짜오좡 박물관' : '枣庄博物馆';
  static String scenicSpot6Desc(String l) => l == 'ko'
      ? '루난 역사 문화의 정수를 한눈에'
      : '一馆看尽鲁南历史文化精华';

  // ── 游记页 ─────────────────────────────────────────────────
  static String travelNotesTitle(String l) =>
      l == 'ko' ? '여행기' : '游记';
  static String note1Title(String l) =>
      l == 'ko' ? '타이얼좡 고성 2일 여행기' : '台儿庄古城两日漫游记';
  static String note1Date(String l) =>
      l == 'ko' ? '2026년 5월' : '2026年5月';
  static String note1Day1(String l) => l == 'ko'
      ? '아침 일찍 지난에서 출발, 1.5시간 만에 짜오좡에 도착. 짐을 맡기고 바로 타이얼좡 고성으로 향했다. 입구에 들어서자마자 마치 시공간을 초월한 듯한 느낌! 고풍스러운 석판길 양옆으로 명청 시대 건축물이 즐비하고, 수로의 푸른 물결에 잔잔한 물결이 일었다. 저녁 무렵 홍등이 하나둘 켜지자 고성 전체가 꿈같은 분위기에 휩싸였다.'
      : '清晨从济南出发，1.5 小时高铁抵达枣庄。寄存行李后直奔台儿庄古城。踏入城门的那一刻，仿佛穿越了时空！青石板路两侧是鳞次栉比的明清建筑，水巷悠悠，碧波荡漾。傍晚时分，两岸红灯笼次第亮起，整座古城笼罩在梦幻般的灯火之中。';
  static String note1Day2(String l) => l == 'ko'
      ? '둘째 날 아침 일찍 일어나 인파가 몰리기 전 고성을 산책했다. 아침 햇살이 수면에 비치고, 배를 젓는 소리와 새소리가 어우러지는 평화로운 풍경이 인상적이었다. 오전에는 전쟁 기념관을 참관했고, 오후에는 특산품 거리에서 석류주와 산팅 화자오를 구매했다. 이번 여행은 정말 값진 경험이었다!'
      : '第二天起了个大早，趁游客尚未涌入，独自漫步在静谧的古城小巷。清晨的阳光洒在水面上，渔船缓缓划过，船夫的歌声和鸟鸣交织在一起。上午参观了台儿庄大战纪念馆，下午在特产街买了石榴酒和山亭花椒，满载而归！';
  static String note2Title(String l) =>
      l == 'ko' ? '웨이산호 조류 관찰 일기' : '微山湖观鸟日记';
  static String note2Date(String l) =>
      l == 'ko' ? '2026년 7월' : '2026年7月';
  static String note2Day1(String l) => l == 'ko'
      ? '연꽃이 만개하는 7월, 나는 망원 렌즈를 챙겨 웨이산호로 향했다. 오전 6시, 해가 막 떠오르는 호숫가에서 수천 마리의 새떼가 하늘을 뒤덮는 광경은 그야말로 장관이었다. 백로, 왜가리, 가마우지... 이곳은 조류 애호가들의 천국임에 틀림없다.'
      : '七月的微山湖，万亩荷花盛开。我带着长焦镜头，凌晨五点就来到了湖边。日出时分，数以千计的候鸟从芦苇荡中飞起，白鹭、苍鹭、野鸭在晨光中盘旋的画面，美得令人窒息。这里是鸟类爱好者的天堂！';
  static String note2Day2(String l) => l == 'ko'
      ? '오전에는 어부의 배를 타고 호수 깊숙이 들어가 갈대 숲을 탐험했고, 점심에는 호수에서 갓 잡은 생선으로 만든 풀코스 요리를 맛보았다. 오후에는 철도유격대 기념관을 방문해 이곳의 혁명 역사를 이해할 수 있었다.'
      : '上午乘坐渔家木船深入湖心芦苇荡，船老大一边撑船一边讲述微山湖的故事。中午品尝了地道的全鱼宴，鲜美的湖鱼让人回味无穷。下午参观了铁道游击队纪念馆，感受这片湖水背后的红色记忆。';
  static String note3Title(String l) =>
      l == 'ko' ? '오월 석류꽃 불보다 붉다' : '五月榴花红胜火——石榴园游记';
  static String note3Date(String l) =>
      l == 'ko' ? '2026년 5월' : '2026年5月';
  static String note3Day1(String l) => l == 'ko'
      ? '5월 중순, 마침내 진정한 석류꽃 바다를 보았다! 이청구에 위치한 관세석류원에 들어서자, 산야 전체가 불타는 듯한 붉은 석류꽃으로 뒤덮여 있었다. 500만 그루의 석류나무, 50여 종의 품종... 규모가 정말 어마어마하다. 추천 꽃놀이 루트: 남문 입장 → 백년 고목 구역 → 석류 문화 박물관.'
      : '五月中旬，我终于见到了真正的石榴花海！走进位于峄城区的冠世榴园，漫山遍野的石榴花如火焰般在枝头燃烧。500万株石榴树，50多个品种，规模之大令人震撼。推荐赏花路线：南门入园 → 百年古树区 → 石榴文化博物馆。';
  static String noteAuthor(String l) =>
      l == 'ko' ? '여행 애호가 · 샤오밍' : '旅行爱好者 · 小明';
  static String likeCount(String l, int n) =>
      l == 'ko' ? '$n 좋아요' : '$n 赞';
  static String commentCount(String l, int n) =>
      l == 'ko' ? '댓글 $n' : '$n 评论';
  static String dayLabel(String l, int d) =>
      l == 'ko' ? 'Day $d' : 'Day $d';

  // ── 酒店列表页 ────────────────────────────────────────────────
  static String hotelListTitle(String l) =>
      l == 'ko' ? '짜오좡 숙박' : '枣庄住宿';
  static String hotelArea1(String l) =>
      l == 'ko' ? '타이얼좡 고성 내' : '台儿庄古城内';
  static String hotelArea2(String l) =>
      l == 'ko' ? '짜오좡 시내' : '枣庄市区';
  static String hotelArea3(String l) =>
      l == 'ko' ? '웨이산호 근처' : '微山湖畔';
  static String hotelName1(String l) =>
      l == 'ko' ? '고성 수향 객잔' : '古城水乡客栈';
  static String hotelName2(String l) =>
      l == 'ko' ? '운하 인문 호텔' : '运河人家精品酒店';
  static String hotelName3(String l) =>
      l == 'ko' ? '타이얼좡 청년 호스텔' : '台儿庄国际青年旅舍';
  static String hotelName4(String l) =>
      l == 'ko' ? '짜오좡 쉐라톤 호텔' : '枣庄喜来登酒店';
  static String hotelName5(String l) =>
      l == 'ko' ? '전흥로 비즈니스 호텔' : '振兴路商务酒店';
  static String hotelName6(String l) =>
      l == 'ko' ? '고속철도역 체인 호텔' : '高铁站连锁酒店';
  static String hotelName7(String l) =>
      l == 'ko' ? '호숫가 별빛 민박' : '湖畔星光民宿';
  static String hotelName8(String l) =>
      l == 'ko' ? '웨이산호 낚시터 민박' : '微山湖渔家乐民宿';
  static String hotelDesc1(String l) => l == 'ko'
      ? '백년 고택 개조, 수로 전망, 야간 등불 축제 도보 가능'
      : '百年老宅改建，推窗见水巷，步行可达夜灯会';
  static String hotelDesc2(String l) => l == 'ko'
      ? '운하변 부티크 호텔, 루난식 조식 포함, 무료 고성 입장'
      : '运河边精品酒店，含鲁南风味早餐，免费古城入园';
  static String hotelDesc3(String l) => l == 'ko'
      ? '저예산 여행객에게 최적, 공용 공간에서 다양한 여행자와 교류'
      : '背包客首选，公共空间可结识各地旅友';
  static String hotelDesc4(String l) => l == 'ko'
      ? '시내 중심, 수영장·피트니스 시설 완비, 비즈니스 여행 최적'
      : '市中心地段，泳池健身房齐全，商务出行首选';
  static String hotelDesc5(String l) => l == 'ko'
      ? '미식 거리와 인접, 주변 맛집 도보 가능, 가성비 최고'
      : '紧邻美食街，周边餐馆林立，性价比之选';
  static String hotelDesc6(String l) => l == 'ko'
      ? '고속철도역 도보 5분, 조식 포함, 조기 체크인 가능'
      : '高铁站步行5分钟，含早餐，可提前办理入住';
  static String hotelDesc7(String l) => l == 'ko'
      ? '호수 전망 테라스 보유, 조식 제공, 낚시 체험 가능'
      : '湖景露台房，含农家早餐，可预约垂钓体验';
  static String hotelDesc8(String l) => l == 'ko'
      ? '호숫가 독립 마당, 바비큐 가능, 반려동물 동반 가능'
      : '临湖独院，可自助烧烤，宠物友好';
  static String hotelTagView(String l) =>
      l == 'ko' ? '수로 전망' : '水巷景观';
  static String hotelTagBreakfast(String l) =>
      l == 'ko' ? '조식 포함' : '含早餐';
  static String hotelTagPool(String l) =>
      l == 'ko' ? '수영장' : '泳池';
  static String hotelTagBudget(String l) =>
      l == 'ko' ? '가성비' : '超高性价比';

  // ── 一日游页 ─────────────────────────────────────────────────
  static String dayTourTitle(String l) =>
      l == 'ko' ? '당일치기 코스' : '一日游';
  static String tour1Title(String l) =>
      l == 'ko' ? '고성 문화 당일 코스' : '古城文化一日游';
  static String tour1Desc(String l) => l == 'ko'
      ? '타이얼좡 고성의 역사와 문화를 깊이 체험하는 당일 코스'
      : '深度体验台儿庄古城的历史底蕴与运河文化';
  static String tour2Title(String l) =>
      l == 'ko' ? '자연 생태 당일 코스' : '自然生态一日游';
  static String tour2Desc(String l) => l == 'ko'
      ? '웨이산호 습지의 자연 풍경과 조류 관찰 체험'
      : '感受微山湖湿地的自然风光与观鸟体验';
  static String tour3Title(String l) =>
      l == 'ko' ? '미식 탐방 당일 코스' : '美食探店一日游';
  static String tour3Desc(String l) => l == 'ko'
      ? '짜오좡의 대표 음식을 하루 만에 모두 맛보는 미식 여행'
      : '一天吃遍枣庄特色美食，从早到晚不停筷';
  static String tourDuration(String l) =>
      l == 'ko' ? '소요 시간' : '预计耗时';
  static String tourTransport(String l) =>
      l == 'ko' ? '교통 수단' : '交通方式';
  static String tourBudget(String l) =>
      l == 'ko' ? '예상 경비' : '预计花费';
  static String tourTipLabel(String l) =>
      l == 'ko' ? '팁' : '贴士';

  // ── 返回顶部 ─────────────────────────────────────────────────
  static String backToTop(String l) =>
      l == 'ko' ? '맨 위로' : '回到顶部';

  // ── 语言切换按钮 ─────────────────────────────────────────────
  static String langLabel(String l) => l == 'ko' ? '中' : '한';
}