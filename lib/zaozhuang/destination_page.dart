import 'package:flutter/material.dart';
import 'package:hometrour/zaozhuang/animations.dart';
import 'package:hometrour/zaozhuang/i18n.dart';
import 'package:video_player/video_player.dart';

// ── 数据模型 ────────────────────────────────────────────────────────

/// 卡片项（交通 / 特色体验）
class CardItemData {
  final IconData icon;
  final L10nString title;
  final L10nString desc;
  const CardItemData({required this.icon, required this.title, required this.desc});
}

/// 路线卡片
class RouteCardData {
  final L10nString label;
  final Color bgColor;
  final Color tagColor;
  final List<L10nString> steps;
  const RouteCardData({
    required this.label,
    required this.bgColor,
    required this.tagColor,
    required this.steps,
  });
}

/// 图片数据
class PhotoData {
  final String url;
  final L10nString author;
  const PhotoData({required this.url, required this.author});
}

/// 页面配置（一份配置 = 一个目的地的详情页）
class DestinationConfig {
  final L10nString appBarTitle;
  final IconData appBarIcon;
  final L10nString articleTitle;
  final L10nString p1Before;
  final L10nString p1Bold;
  final L10nString p1After;
  final List<PhotoData> photoRow1;
  final L10nString p2Before;
  final L10nString p2Bold;
  final L10nString p2After;
  final L10nString section1Title;
  final List<List<L10nString>> infoTableRows;
  final L10nString section2Title;
  final List<CardItemData> cardItems;
  final L10nString section3Title;
  final List<RouteCardData> routeCards;
  final List<PhotoData> photoRow2;
  final L10nString tipTitle;
  final L10nString tipContent;
  final String? videoUrl;
  final bool videoFromAsset;

  const DestinationConfig({
    required this.appBarTitle,
    required this.appBarIcon,
    required this.articleTitle,
    required this.p1Before,
    required this.p1Bold,
    required this.p1After,
    required this.photoRow1,
    required this.p2Before,
    required this.p2Bold,
    required this.p2After,
    required this.section1Title,
    required this.infoTableRows,
    required this.section2Title,
    required this.cardItems,
    required this.section3Title,
    required this.routeCards,
    required this.photoRow2,
    required this.tipTitle,
    required this.tipContent,
    this.videoUrl,
    this.videoFromAsset = false,
  });
}

// ── 配置常量 ────────────────────────────────────────────────────────

/// 枣庄官方攻略（index 0）
const guanfangConfig = DestinationConfig(
  appBarTitle: const L10nString(zh: '枣庄攻略', ko: '짜오좡 가이드'),
  appBarIcon: Icons.wb_sunny_rounded,
  articleTitle: const L10nString(zh: '枣庄（台儿庄）行前需知：\n概况、交通与路线规划', ko: '짜오좡(타이얼좡) 여행 전 필수 정보:\n개요, 교통 및 일정 계획'),
  p1Before: const L10nString(zh: '位于山东省南部的', ko: '산둥성 남부에 위치한 '),
  p1Bold: const L10nString(zh: '枣庄', ko: '짜오좡'),
  p1After: const L10nString(zh: '，是鲁南重要的历史文化名城。这里拥有中国保存最完好的运河古城——台儿庄，素有"天下第一庄"之美誉，同时也是著名的"石榴之乡"与"冠世榴园"所在地。',
      ko: '은 루난 지역의 중요한 역사문화 도시입니다. 중국에서 가장 잘 보존된 운하 고성인 타이얼좡이 있으며, "천하제일장"이라는 미명을 가지고 있습니다. 또한 유명한 "석류의 고향"이자 "관세석류원"의 소재지이기도 합니다.'),
  photoRow1: const [
    PhotoData(
      url: 'assets/zaozhuang.jpg',
      author: const L10nString(zh: '台儿庄古城', ko: '타이얼좡 고성'),
    ),
    PhotoData(
      url: 'https://images.unsplash.com/photo-1670416826299-f58110eab9a4?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      author: const L10nString(zh: '微山湖湿地', ko: '웨이산호 습지'),
    ),
  ],
  p2Before: const L10nString(zh: '古运河穿城而过，水街相依、桨声灯影，使枣庄有别于其他北方城市，人们也亲切地称它为', ko: '고대 운하가 도시를 가로질러 흐르고, 물길과 거리가 어우러지며 노 젓는 소리와 등불 그림자가 교차하여 짜오좡을 다른 북방 도시들과 차별화합니다. 사람들은 이곳을 친근하게 '),
  p2Bold: const L10nString(zh: '"鲁南水乡"', ko: '"루난 수향"'),
  p2After: const L10nString(zh: '。', ko: '이라고 부릅니다.'),
  section1Title: const L10nString(zh: '城市概况', ko: '도시 개요'),
  infoTableRows: const [
    [const L10nString(zh: '所在省份', ko: '소재 성'), const L10nString(zh: '山东省', ko: '산둥성')],
    [const L10nString(zh: '城市面积', ko: '도시 면적'), const L10nString(zh: '4563 km²', ko: '4563 km²')],
    [const L10nString(zh: '常住人口', ko: '상주 인구'), const L10nString(zh: '约 385 万', ko: '약 385만 명')],
    [const L10nString(zh: '最佳季节', ko: '최적의 계절'), const L10nString(zh: '3–5月 / 9–11月', ko: '3–5월 / 9–11월')],
    [const L10nString(zh: '建议天数', ko: '권장 일정'), const L10nString(zh: '2–3 天', ko: '2–3일')],
  ],
  section2Title: const L10nString(zh: '交通指南', ko: '교통 안내'),
  cardItems: const [
    CardItemData(icon: Icons.train_rounded, title: const L10nString(zh: '高铁', ko: '고속철도'), desc: const L10nString(zh: '枣庄站、滕州东站均有高铁停靠，济南约 1.5h', ko: '짜오좡역, 텅저우 동역에 고속철도 정차, 지난에서 약 1.5시간')),
    CardItemData(icon: Icons.directions_bus_rounded, title: const L10nString(zh: '长途客运', ko: '장거리 버스'), desc: const L10nString(zh: '枣庄汽车总站，覆盖省内主要城市', ko: '짜오좡 버스 터미널, 성 내 주요 도시 연결')),
    CardItemData(icon: Icons.directions_car_rounded, title: const L10nString(zh: '自驾', ko: '자가운전'), desc: const L10nString(zh: '京台高速、日兰高速均经过枣庄', ko: '징타이 고속도로, 르란 고속도로 모두 짜오좡 경유')),
  ],
  section3Title: const L10nString(zh: '路线规划', ko: '일정 계획'),
  routeCards: const [
    RouteCardData(
      label: const L10nString(zh: '2日游路线', ko: '2일 코스'),
      bgColor: Color(0xFFF0F7FF),
      tagColor: Color(0xFF1976D2),
      steps: [
        const L10nString(zh: 'Day 1  台儿庄古城水街游览 → 夜游古城灯会', ko: 'Day 1  타이얼좡 고성 수로 탐방 → 야간 등불 축제'),
        const L10nString(zh: 'Day 2  微山湖湿地观鸟 → 冠世榴园石榴花海', ko: 'Day 2  웨이산호 습지 조류 관찰 → 관세석류원 꽃밭'),
      ],
    ),
    RouteCardData(
      label: const L10nString(zh: '3日游路线', ko: '3일 코스'),
      bgColor: Color(0xFFFFFDF5),
      tagColor: Color(0xFFE6A800),
      steps: [
        const L10nString(zh: 'Day 1  台儿庄古城深度游', ko: 'Day 1  타이얼좡 고성 집중 탐방'),
        const L10nString(zh: 'Day 2  微山湖 + 铁道游击队纪念馆', ko: 'Day 2  웨이산호 + 철도유격대 기념관'),
        const L10nString(zh: 'Day 3  抱犊崮国家森林公园登山', ko: 'Day 3  바오두구 국가삼림공원 등산'),
      ],
    ),
  ],
  photoRow2: const [
    PhotoData(
      url: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=600&auto=format&fit=crop&q=80',
      author: const L10nString(zh: '抱犊崮山景', ko: '바오두구 산 경치'),
    ),
    PhotoData(
      url: 'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=400&auto=format&fit=crop&q=80',
      author: const L10nString(zh: '枣庄美食', ko: '짜오좡 미식'),
    ),
  ],
  tipTitle: const L10nString(zh: '💡 行程小贴士', ko: '💡 여행 팁'),
  tipContent: const L10nString(zh: '台儿庄古城夜景最佳观赏时间为 19:00–21:30，建议傍晚入城，白天游览微山湖，合理安排行程。',
      ko: '타이얼좡 고성 야경은 19:00–21:30 사이에 가장 아름답습니다. 저녁 무렵에 입성하여 낮에는 웨이산호를 관광하는 일정을 추천합니다.'),
  videoUrl: 'assets/zaozhuang.mp4',
  videoFromAsset: true,
);

/// 台儿庄古城攻略（index 1）
const guchengConfig = DestinationConfig(
  appBarTitle: const L10nString(zh: '台儿庄攻略', ko: '타이얼좡 가이드'),
  appBarIcon: Icons.nightlight_round,
  articleTitle: const L10nString(zh: '梦回大运河江北水乡：\n台儿庄古城日游与夜景深度指南', ko: '대운하 강북 수향의 꿈:\n타이얼좡 고성 주간 & 야경 완벽 가이드'),
  p1Before: const L10nString(zh: '位于山东省枣庄市台儿庄区的', ko: '산둥성 짜오좡시 타이얼좡구에 위치한 '),
  p1Bold: const L10nString(zh: '台儿庄古城', ko: '타이얼좡 고성'),
  p1After: const L10nString(zh: '，被称为"活着的古运河"。这里是京杭大运河上唯一保存完好的水街水巷，拥有独特的江北水乡风貌，更因"桨声灯影、歌声水声"交织的绝美夜景而闻名遐迩。',
      ko: '은 "살아있는 고대 운하"로 불립니다. 이곳은 징항 대운하에서 유일하게 완전히 보존된 수상 거리와 수로를 가진 곳으로, 독특한 강북 수향의 풍경을 자랑합니다. "노 젓는 소리와 등불 그림자, 노래 소리와 물소리"가 어우러진 환상적인 야경으로 널리 알려져 있습니다.'),
  photoRow1: const [
    PhotoData(
      url: 'assets/gucheng.jpg',
      author: const L10nString(zh: '夜幕古城水街', ko: '야간 고성 수로'),
    ),
    PhotoData(
      url: 'https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=400&auto=format&fit=crop&q=80',
      author: const L10nString(zh: '摇橹船码头', ko: '노 젓는 배 선착장'),
    ),
  ],
  p2Before: const L10nString(zh: '古城内汪塘成片、水网密布，你可以漫步于青石板路上探寻两岸风格迥异的鲁南、闽南及西洋建筑，亦或在入夜后乘一叶扁舟，亲身体验', ko: '고성 내에는 연못이 펼쳐져 있고 수로가 촘촘히 연결되어 있습니다. 청석판 길을 따라 걸으며 루난, 민난 및 서양식 건축물들을 감상하고, 밤이 되면 작은 배를 타고 '),
  p2Bold: const L10nString(zh: '"一品橹歌、梦回江南"', ko: '"노래 소리와 함께 강남의 꿈 속으로"'),
  p2After: const L10nString(zh: '的诗意画卷。', ko: '라는 시적인 풍경을 직접 체험할 수 있습니다.'),
  section1Title: const L10nString(zh: '景区概况', ko: '관광지 개요'),
  infoTableRows: const [
    [const L10nString(zh: '门票参考', ko: '입장료 참고'), const L10nString(zh: '约 118 元/人（常有优惠）', ko: '약 118위안/인 (할인 자주 있음)')],
    [const L10nString(zh: '开放时间', ko: '운영 시간'), const L10nString(zh: '全天 24 小时开放', ko: '24시간 개방')],
    [const L10nString(zh: '核心看点', ko: '주요 볼거리'), const L10nString(zh: '运河水街、建筑博览、非遗表演', ko: '운하 수로, 건축 박람, 무형문화재 공연')],
    [const L10nString(zh: '建议耗时', ko: '권장 소요 시간'), const L10nString(zh: '1 - 2 天（极力推荐留宿）', ko: '1 - 2일 (숙박 강력 추천)')],
    [const L10nString(zh: '最佳赏景', ko: '최적 관람 시간'), const L10nString(zh: '18:30 – 21:30（华灯初上）', ko: '18:30 – 21:30 (야경 시작 시간)')],
  ],
  section2Title: const L10nString(zh: '特色乘船体验', ko: '특별 선박 체험'),
  cardItems: const [
    CardItemData(icon: Icons.sailing_rounded, title: const L10nString(zh: '摇橹船体验', ko: '노젓는 배 체험'), desc: const L10nString(zh: '内河水街的核心项目，听摇橹姑娘唱鲁南小调，穿梭于桨声灯影间', ko: '내륙 수로의 핵심 코스, 뱃사공 아가씨의 루난 민요를 들으며 등불 아래 수로를 누비는 체험')),
    CardItemData(icon: Icons.directions_boat_filled, title: const L10nString(zh: '大运河画舫', ko: '대운하 유람선'), desc: const L10nString(zh: '行驶于古运河主航道，视野极其开阔，适合欣赏两岸全景宏伟建筑', ko: '고대 운하 주요 수로를 따라 운행하며 시야가 매우 넓어 양안의 웅장한 건축물 감상에 최적')),
    CardItemData(icon: Icons.directions_run_rounded, title: const L10nString(zh: '古城步行', ko: '고성 도보'), desc: const L10nString(zh: '核心区域纵横交错，穿舒适的平底鞋或汉服漫步是最佳的摄影方式', ko: '중심 구역이 사통팔달로 연결되어 있으며, 편안한 신발이나 한푸를 입고 산책하며 사진 찍는 것이 최고의 방법')),
  ],
  section3Title: const L10nString(zh: '游览路线推荐', ko: '추천 관광 코스'),
  routeCards: const [
    RouteCardData(
      label: const L10nString(zh: '白天 · 历史文化寻踪路线', ko: '주간 · 역사문화 탐방 코스'),
      bgColor: Color(0xFFF0F7FF),
      tagColor: Color(0xFF1976D2),
      steps: [
        const L10nString(zh: '复兴码头入园 → 参将署（品味古衙门文化）', ko: '푸싱 부두 입장 → 참장서 (옛 관아 문화 체험)'),
        const L10nString(zh: '天后宫（赏闽南精致木雕） → 船形街（大运河奇特建筑）', ko: '톈허우궁 (민난 정교한 목각 감상) → 선형 거리 (대운하 독특한 건축)'),
        const L10nString(zh: '台儿庄大战纪念馆（追寻红色历史记忆）', ko: '타이얼좡 전투 기념관 (혁명 역사의 기억 탐방)'),
      ],
    ),
    RouteCardData(
      label: const L10nString(zh: '夜晚 · 桨声灯影浪漫路线', ko: '야간 · 등불과 노래의 로맨틱 코스'),
      bgColor: Color(0xFFFFFDF5),
      tagColor: Color(0xFFE6A800),
      steps: [
        const L10nString(zh: '18:30 漫步东门顺河街（看两岸红灯笼次第亮起）', ko: '18:30 동문 순허 거리 산책 (양안의 홍등이 하나둘 켜지는 광경)'),
        const L10nString(zh: '19:30 核心广场驻足观赏"火龙钢花（打铁花）"震撼表演', ko: '19:30 중심 광장에서 "화룡강화(쇠물 불꽃놀이)" 감상'),
        const L10nString(zh: '20:30 登摇橹船夜游内河，在歌声水声中梦回江南', ko: '20:30 노 젓는 배로 야간 수로 유람, 노래와 물소리 속에서 강남의 꿈을 꾸다'),
      ],
    ),
  ],
  photoRow2: const [
    PhotoData(
      url: 'https://plus.unsplash.com/premium_photo-1731329153400-78b61896bb60?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      author: const L10nString(zh: '非遗打铁花表演', ko: '무형문화재 타철화 공연'),
    ),
    PhotoData(
      url: 'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=400&auto=format&fit=crop&q=80',
      author: const L10nString(zh: '运河特色美食', ko: '운하 별미 음식'),
    ),
  ],
  tipTitle: const L10nString(zh: '💡 演出与住宿贴士', ko: '💡 공연 & 숙박 팁'),
  tipContent: const L10nString(zh: '古城内的"火龙钢花（打铁花）"和"运河大鼓"等非遗表演通常在傍晚 19:30 左右达到高潮。强烈建议在古城内的客栈留宿一晚（凭客栈房卡通常可在服务中心办理二次入园手续），不仅省去往返奔波，还能在清晨体验到没有喧嚣、静谧如画的古城原貌。',
      ko: '고성 내 "화룡강화(타철화)"와 "운하 대북" 등 무형문화재 공연은 보통 저녁 19:30경에 절정에 달합니다. 고성 내 객잔에서 1박하는 것을 강력히 추천합니다(객잔 룸키로 서비스 센터에서 재입장 수속 가능). 왕복 이동을 줄일 뿐만 아니라, 이른 아침 고요하고 그림 같은 고성의 원래 모습을 체험할 수 있습니다.'),
  videoUrl: 'assets/taierzhuang.mp4',
  videoFromAsset: true,
);

// ── ★★★ 微山湖湿地攻略（index 2）─────────────────────────────────────
const weishanhuConfig = DestinationConfig(
  appBarTitle: const L10nString(zh: '微山湖攻略', ko: '웨이산호 가이드'),
  appBarIcon: Icons.water_rounded,
  articleTitle: const L10nString(zh: '荷香水韵间的生态秘境：\n微山湖湿地深度漫游指南', ko: '연꽃 향기와 물의 운치가 있는 생태 비경:\n웨이산호 습지 깊이 있는 여행 가이드'),
  p1Before: const L10nString(zh: '位于山东省南部的', ko: '산둥성 남부에 위치한 '),
  p1Bold: const L10nString(zh: '微山湖', ko: '웨이산호'),
  p1After: const L10nString(zh: '，是中国北方最大的淡水湖，也是南水北调东线工程的重要调蓄水库。万亩荷花、芦苇荡与丰富的水鸟资源，使这里成为华北地区首屈一指的生态旅游目的地。',
      ko: '는 중국 북부 최대의 담수호이자 남수북조 동선 공정의 중요한 저수지입니다. 드넓은 연꽃밭, 갈대 숲과 풍부한 물새 자원으로 인해 화북 지역 최고의 생태 관광지로 손꼽힙니다.'),
  photoRow1: const [
    PhotoData(
      url: 'assets/weishanhu.jpg',
      author: const L10nString(zh: '微山湖湿地风光', ko: '웨이산호 습지 풍경'),
    ),
    PhotoData(
      url: 'assets/hehua.jpg',
      author: const L10nString(zh: '湖心荷花', ko: '호수 중앙 연꽃'),
    ),
  ],
  p2Before: const L10nString(zh: '微山湖不仅自然景观壮美，更因铁道游击队的红色传奇而名扬天下。夏日泛舟湖上，穿行于接天莲叶之间，听船家讲述当年的英雄故事，感受', ko: '웨이산호는 자연 경관이 웅장할 뿐만 아니라 철도유격대의 혁명 전설로도 유명합니다. 여름날 호수에서 배를 타고 하늘을 뒤덮은 연잎 사이를 누비며 뱃사공이 들려주는 영웅 이야기를 듣고 '),
  p2Bold: const L10nString(zh: '"荷香、水韵、红魂"', ko: '"연꽃 향기, 물의 운치, 혁명의 정신"'),
  p2After: const L10nString(zh: '融为一体的独特魅力。', ko: '이 하나로 어우러진 독특한 매력을 느껴보세요.'),
  section1Title: const L10nString(zh: '湿地概况', ko: '습지 개요'),
  infoTableRows: const [
    [const L10nString(zh: '湖区面积', ko: '호수 면적'), const L10nString(zh: '约 1266 km²', ko: '약 1266 km²')],
    [const L10nString(zh: '最佳季节', ko: '최적의 계절'), const L10nString(zh: '6–9月（荷花盛开）', ko: '6–9월 (연꽃 만개)')],
    [const L10nString(zh: '门票参考', ko: '입장료 참고'), const L10nString(zh: '湿地公园约 60 元', ko: '습지공원 약 60위안')],
    [const L10nString(zh: '建议耗时', ko: '권장 소요 시간'), const L10nString(zh: '半天 – 1 天', ko: '반나절 – 1일')],
    [const L10nString(zh: '特色景观', ko: '특별 경관'), const L10nString(zh: '万亩荷花、芦苇迷宫、落日飞鸟', ko: '만무 연꽃, 갈대 미로, 낙조와 새떼')],
  ],
  section2Title: const L10nString(zh: '特色体验', ko: '특별 체험'),
  cardItems: const [
    CardItemData(icon: Icons.remove_red_eye_rounded, title: const L10nString(zh: '观鸟天堂', ko: '조류 관찰 천국'), desc: const L10nString(zh: '微山湖是候鸟迁徙的重要驿站，白鹭、苍鹭、野鸭等数百种鸟类在此栖息，春秋季节最为壮观', ko: '웨이산호는 철새 이동의 중요한 기착지로, 백로, 왜가리, 야생 오리 등 수백 종의 새가 서식하며 봄가을이 가장 장관입니다')),
    CardItemData(icon: Icons.local_florist_rounded, title: const L10nString(zh: '荷花盛宴', ko: '연꽃 축제'), desc: const L10nString(zh: '7–8月万亩荷花竞相绽放，"接天莲叶无穷碧，映日荷花别样红"的诗意画卷在此完美呈现', ko: '7–8월 만무의 연꽃이 앞다투어 피어나며, "하늘에 닿은 연잎은 끝없이 푸르고, 햇살 받은 연꽃은 유난히 붉다"는 시적 풍경이 완벽하게 펼쳐집니다')),
    CardItemData(icon: Icons.directions_boat_rounded, title: const L10nString(zh: '渔家风情', ko: '어촌 정취'), desc: const L10nString(zh: '乘坐渔家木船深入芦苇荡，体验湖上人家的生活。现捕现做的全鱼宴是微山湖不可错过的味觉盛宴', ko: '어부의 나무배를 타고 갈대 숲 깊숙이 들어가 호수 위 사람들의 생활을 체험하세요. 갓 잡아 바로 요리하는 생선 풀코스는 웨이산호에서 놓칠 수 없는 미식 경험입니다')),
  ],
  section3Title: const L10nString(zh: '推荐路线', ko: '추천 코스'),
  routeCards: const [
    RouteCardData(
      label: const L10nString(zh: '半日精华游', ko: '반나절 핵심 코스'),
      bgColor: Color(0xFFF0F7FF),
      tagColor: Color(0xFF1976D2),
      steps: [
        const L10nString(zh: '微山湖湿地公园入口 → 观鸟塔 → 荷花精品园', ko: '웨이산호 습지공원 입구 → 조류 전망대 → 연꽃 정원'),
        const L10nString(zh: '乘船游湖（约 1h）→ 芦苇迷宫探秘', ko: '유람선 호수 투어 (약 1시간) → 갈대 미로 탐험'),
      ],
    ),
    RouteCardData(
      label: const L10nString(zh: '一日深度游', ko: '1일 집중 코스'),
      bgColor: Color(0xFFFFFDF5),
      tagColor: Color(0xFFE6A800),
      steps: [
        const L10nString(zh: '上午 湿地公园观鸟（建议清晨 6:00–8:00 最佳）', ko: '오전  습지공원 조류 관찰 (이른 아침 6:00–8:00 권장)'),
        const L10nString(zh: '中午 渔家全鱼宴午餐', ko: '점심  어부 가정식 생선 요리'),
        const L10nString(zh: '下午 乘船探访微山岛 → 铁道游击队纪念馆', ko: '오후  배로 웨이산 섬 방문 → 철도유격대 기념관'),
      ],
    ),
  ],
  photoRow2: const [
    PhotoData(
      url: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600&auto=format&fit=crop&q=80',
      author: const L10nString(zh: '微山湖日落', ko: '웨이산호 석양'),
    ),
    PhotoData(
      url: 'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=400&auto=format&fit=crop&q=80',
      author: const L10nString(zh: '湖鲜全鱼宴', ko: '호수 생선 요리'),
    ),
  ],
  tipTitle: const L10nString(zh: '💡 观鸟与摄影贴士', ko: '💡 조류 관찰 & 사진 팁'),
  tipContent: const L10nString(zh: '微山湖最佳观鸟时间为清晨日出前后和傍晚日落时分。建议携带望远镜和300mm以上长焦镜头。7月中旬至8月中旬为荷花最佳观赏期，此时湖面温度较高，请做好防晒准备并备足饮用水。',
      ko: '웨이산호 최적의 조류 관찰 시간은 새벽 일출 전후와 저녁 일몰 무렵입니다. 쌍안경과 300mm 이상 망원 렌즈를 지참하는 것을 권장합니다. 7월 중순부터 8월 중순까지가 연꽃 최적 감상 시기이며, 호수 온도가 높으므로 자외선 차단과 충분한 식수를 준비하세요.'),
);

// ── ★★★ 石榴园赏花攻略（index 3）─────────────────────────────────────
const shiliuyuanConfig = DestinationConfig(
  appBarTitle: const L10nString(zh: '石榴园攻略', ko: '석류원 가이드'),
  appBarIcon: Icons.local_florist_rounded,
  articleTitle: const L10nString(zh: '万花争艳的火红五月：\n冠世榴园赏花采摘全攻略', ko: '만화가 다투어 피는 붉은 5월:\n관세석류원 꽃놀이 & 수확 완벽 가이드'),
  p1Before: const L10nString(zh: '位于枣庄市峄城区的', ko: '짜오좡시 이청구에 위치한 '),
  p1Bold: const L10nString(zh: '冠世榴园（万亩石榴园）', ko: '관세석류원 (만무 석류원)'),
  p1After: const L10nString(zh: '，是中国最大的石榴园林，被列入吉尼斯世界纪录。园内种植石榴树超过 500 万株，品种多达 50 余种，每年5月花开时节，漫山遍野的石榴花如火焰般绽放，蔚为壮观。',
      ko: '은 중국 최대의 석류 정원으로 기네스 세계 기록에 등재되어 있습니다. 500만 그루 이상의 석류나무가 심어져 있으며 50여 종의 다양한 품종이 있습니다. 매년 5월 개화 시기에는 온 산야에 석류꽃이 불꽃처럼 피어나 장관을 이룹니다.'),
  photoRow1: const [
    PhotoData(
      url: 'assets/shiliuyuan.jpg',
      author: const L10nString(zh: '石榴花海全景', ko: '석류꽃밭 파노라마'),
    ),
    PhotoData(
      url: 'assets/shiliu2.jpeg',
      author: const L10nString(zh: '石榴花特写', ko: '석류꽃 클로즈업'),
    ),
  ],
  p2Before: const L10nString(zh: '石榴在中华文化中象征多子多福、团圆美满。漫步于古树参天、花香四溢的石榴园中，品一盏石榴茶，尝一口石榴汁，感受', ko: '석류는 중화 문화에서 다산과 복, 원만한 가정을 상징합니다. 고목이 하늘을 찌르고 꽃 향기가 가득한 석류원을 거닐며 석류차 한 잔과 석류 주스 한 모금으로 '),
  p2Bold: const L10nString(zh: '"五月榴花红胜火"', ko: '"오월 석류꽃 불보다 붉다"'),
  p2After: const L10nString(zh: '的诗意画卷。9–10月石榴成熟时节，游客还可以亲自体验采摘之乐。', ko: '라는 시적인 풍경을 느껴보세요. 9–10월 석류 수확 철에는 방문객이 직접 수확 체험도 할 수 있습니다.'),
  section1Title: const L10nString(zh: '园区概况', ko: '공원 개요'),
  infoTableRows: const [
    [const L10nString(zh: '园区面积', ko: '공원 면적'), const L10nString(zh: '约 8000 公顷', ko: '약 8000 헥타르')],
    [const L10nString(zh: '石榴品种', ko: '석류 품종'), const L10nString(zh: '50+ 种（大青皮、大红袍等）', ko: '50종 이상 (대청피, 대홍포 등)')],
    [const L10nString(zh: '最佳花期', ko: '최적 개화 시기'), const L10nString(zh: '5月中旬 – 6月中旬', ko: '5월 중순 – 6월 중순')],
    [const L10nString(zh: '采摘季节', ko: '수확 계절'), const L10nString(zh: '9月 – 10月', ko: '9월 – 10월')],
    [const L10nString(zh: '门票参考', ko: '입장료 참고'), const L10nString(zh: '30 – 50 元', ko: '30 – 50위안')],
  ],
  section2Title: const L10nString(zh: '赏花体验', ko: '꽃놀이 체험'),
  cardItems: const [
    CardItemData(icon: Icons.photo_camera_rounded, title: const L10nString(zh: '拍照胜地', ko: '사진 명소'), desc: const L10nString(zh: '火红的石榴花海是绝佳的拍照背景。推荐穿上浅色系衣装，在清晨或傍晚柔和光线下拍摄，效果最佳', ko: '붉은 석류꽃밭은 최고의 사진 배경입니다. 밝은 색상의 옷을 입고 이른 아침이나 저녁 부드러운 빛 아래서 촬영하면 최상의 결과물을 얻을 수 있습니다')),
    CardItemData(icon: Icons.coffee_rounded, title: const L10nString(zh: '石榴茶品鉴', ko: '석류차 시음'), desc: const L10nString(zh: '园内设有茶室，可品尝以石榴花、石榴叶制成的特色石榴茶，甘甜清香，具有养颜功效', ko: '공원 내 다실에서 석류꽃과 석류 잎으로 만든 특별한 석류차를 맛볼 수 있으며, 달콤하고 은은한 향이 일품이며 미용 효과도 있습니다')),
    CardItemData(icon: Icons.shopping_bag_rounded, title: const L10nString(zh: '特产采购', ko: '특산품 구매'), desc: const L10nString(zh: '石榴汁、石榴酒、石榴蜜等深加工产品可在园区商店购买，是馈赠亲友的绝佳伴手礼', ko: '석류 주스, 석류주, 석류 꿀 등 가공 제품을 공원 상점에서 구매할 수 있으며, 친지 선물용으로 최고의 선택입니다')),
  ],
  section3Title: const L10nString(zh: '游览路线推荐', ko: '추천 관광 코스'),
  routeCards: const [
    RouteCardData(
      label: const L10nString(zh: '半日赏花路线', ko: '반나절 꽃놀이 코스'),
      bgColor: Color(0xFFFFF0F5),
      tagColor: Color(0xFFD44B6A),
      steps: [
        const L10nString(zh: '冠世榴园南门入园 → 百年古树区 → 精品盆景园', ko: '관세석류원 남문 입장 → 백년 고목 구역 → 분재 정원'),
        const L10nString(zh: '石榴花海主景区 → 茶室小憩 → 特产商店', ko: '석류꽃밭 주요 구역 → 다실 휴식 → 특산품 상점'),
      ],
    ),
    RouteCardData(
      label: const L10nString(zh: '一日赏花+采摘路线', ko: '1일 꽃놀이+수확 코스'),
      bgColor: Color(0xFFFFFDF5),
      tagColor: Color(0xFFE6A800),
      steps: [
        const L10nString(zh: '上午 石榴花海赏花拍照 → 参观石榴文化博物馆', ko: '오전  석류꽃밭 관람 & 사진 촬영 → 석류 문화 박물관 관람'),
        const L10nString(zh: '中午 园内农家乐午餐（推荐石榴鸡）', ko: '점심  공원 내 농가 레스토랑 (석류 닭요리 추천)'),
        const L10nString(zh: '下午 石榴采摘体验 → 石榴酒庄品鉴', ko: '오후  석류 수확 체험 → 석류 와이너리 시음'),
      ],
    ),
  ],
  photoRow2: const [
    PhotoData(
      url: 'assets/shiliu3.jpeg',
      author: const L10nString(zh: '石榴园小径', ko: '석류원 오솔길'),
    ),
    PhotoData(
      url: 'assets/shiliu4.jpeg',
      author: const L10nString(zh: '石榴采摘', ko: '석류 수확'),
    ),
  ],
  tipTitle: const L10nString(zh: '💡 赏花与采摘贴士', ko: '💡 꽃놀이 & 수확 팁'),
  tipContent: const L10nString(zh: '石榴花期为5月中旬至6月中旬，建议选择晴朗天气前往，穿舒适的平底鞋（园区多为山路）。9–10月石榴成熟季可参与采摘活动，一般按斤收费。园区内蚊虫较多，请提前做好防蚊准备。',
      ko: '석류꽃 개화 시기는 5월 중순부터 6월 중순까지이며, 맑은 날씨에 방문하는 것을 권장합니다. 편안한 운동화를 착용하세요(공원 내 대부분 산길). 9–10월 석류 수확 시즌에는 수확 체험에 참여할 수 있으며, 보통 무게 단위로 요금이 부과됩니다. 공원 내 모기가 많으므로 방충 준비를 미리 하세요.'),
);

// ── ★★★ 酒店住宿指南（index 4）───────────────────────────────────────
const jiudianConfig = DestinationConfig(
  appBarTitle: const L10nString(zh: '住宿指南', ko: '숙박 가이드'),
  appBarIcon: Icons.hotel_rounded,
  articleTitle: const L10nString(zh: '从古城客栈到湖景美宿：\n枣庄住宿选择全攻略', ko: '고성 객잔부터 호수 전망 숙소까지:\n짜오좡 숙박 선택 완벽 가이드'),
  p1Before: const L10nString(zh: '', ko: ''),
  p1Bold: const L10nString(zh: '枣庄', ko: '짜오좡'),
  p1After: const L10nString(zh: '的住宿选择丰富多样，从台儿庄古城内的精品客栈，到市区现代化的星级酒店，再到微山湖畔的湖景民宿，每一种住宿都能为你的旅程增添不同的色彩。',
      ko: '의 숙박 옵션은 다양합니다. 타이얼좡 고성 내 부티크 객잔부터 시내의 현대적인 스타 호텔, 웨이산호 근처의 호수 전망 민박까지, 각 숙박 유형이 여행에 색다른 매력을 더해줍니다.'),
  photoRow1: const [
    PhotoData(
      url: 'assets/jiudian.jpeg',
      author: const L10nString(zh: '古城精品客栈', ko: '고성 부티크 객잔'),
    ),
    PhotoData(
      url: 'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=400&auto=format&fit=crop&q=80',
      author: const L10nString(zh: '湖景民宿', ko: '호수 전망 민박'),
    ),
  ],
  p2Before: const L10nString(zh: '台儿庄古城内的客栈是多数游客的首选——住进百年老宅改建的精品酒店，推窗即见运河水巷，枕水而眠。如果偏爱现代舒适，市区星级酒店设施齐全、交通便利；而微山湖畔的民宿则更适合', ko: '타이얼좡 고성 내 객잔은 대부분 여행객의 첫 번째 선택입니다. 백년 된 고택을 개조한 부티크 호텔에 머물며 창밖으로 운하 수로를 바라보고 물소리를 들으며 잠들 수 있습니다. 현대적인 편안함을 선호한다면 시내 스타 호텔이 시설이 완비되어 있고 교통이 편리합니다. 웨이산호 근처 민박은 '),
  p2Bold: const L10nString(zh: '享受宁静湖畔时光', ko: '조용한 호숫가 시간을 즐기기에'),
  p2After: const L10nString(zh: '的旅行者。', ko: '더 적합합니다.'),
  section1Title: const L10nString(zh: '住宿选择概览', ko: '숙박 옵션 개요'),
  infoTableRows: const [
    [const L10nString(zh: '古城客栈', ko: '고성 객잔'), const L10nString(zh: '¥200 – ¥800 / 晚', ko: '¥200 – ¥800 / 박')],
    [const L10nString(zh: '市区星级酒店', ko: '시내 스타 호텔'), const L10nString(zh: '¥150 – ¥600 / 晚', ko: '¥150 – ¥600 / 박')],
    [const L10nString(zh: '湖景民宿', ko: '호수 전망 민박'), const L10nString(zh: '¥100 – ¥400 / 晚', ko: '¥100 – ¥400 / 박')],
    [const L10nString(zh: '经济连锁酒店', ko: '이코노미 체인 호텔'), const L10nString(zh: '¥80 – ¥200 / 晚', ko: '¥80 – ¥200 / 박')],
    [const L10nString(zh: '旺季提醒', ko: '성수기 안내'), const L10nString(zh: '五一/十一/荷花节价格上浮', ko: '노동절/국경절/연꽃 축제 기간 가격 인상')],
  ],
  section2Title: const L10nString(zh: '各区域住宿特色', ko: '지역별 숙박 특징'),
  cardItems: const [
    CardItemData(icon: Icons.castle_rounded, title: const L10nString(zh: '台儿庄古城内', ko: '타이얼좡 고성 내'), desc: const L10nString(zh: '最具特色的住宿区域。百年老宅改建的客栈，推窗即水巷，夜可观灯会。推荐提前1-2周预订，节假日需提前1个月', ko: '가장 특색 있는 숙박 지역. 백년 고택을 개조한 객잔으로 창문 너머 수로가 보이고 밤에는 등불 축제를 감상할 수 있습니다. 1-2주 전 예약 권장, 공휴일은 1개월 전 필수')),
    CardItemData(icon: Icons.business_rounded, title: const L10nString(zh: '枣庄市区', ko: '짜오좡 시내'), desc: const L10nString(zh: '交通最便利，靠近高铁站和汽车站。品牌酒店云集，适合商务出行或作为中转住宿。周边餐饮选择丰富', ko: '교통이 가장 편리하며 고속철도역과 버스 터미널에 가깝습니다. 브랜드 호텔이 밀집되어 있어 비즈니스 여행이나 중간 숙박지로 적합합니다. 주변 식사 옵션이 풍부합니다')),
    CardItemData(icon: Icons.water_rounded, title: const L10nString(zh: '微山湖畔', ko: '웨이산호 주변'), desc: const L10nString(zh: '适合自然爱好者的湖景民宿。清晨在鸟鸣中醒来，推窗即是湖光山色。多数民宿提供农家菜和垂钓体验', ko: '자연 애호가에게 적합한 호수 전망 민박. 새소리와 함께 아침을 맞이하고 창밖으로 호수와 산 경치를 감상할 수 있습니다. 대부분의 민박에서 농가 요리와 낚시 체험을 제공합니다')),
  ],
  section3Title: const L10nString(zh: '住宿选择路线', ko: '숙박 선택 가이드'),
  routeCards: const [
    RouteCardData(
      label: const L10nString(zh: '预算有限 · 高性价比路线', ko: '저예산 · 가성비 코스'),
      bgColor: Color(0xFFF0F7FF),
      tagColor: Color(0xFF1976D2),
      steps: [
        const L10nString(zh: '经济之选 → 市区连锁酒店（如家、汉庭等）¥100–150/晚', ko: '이코노미 선택 → 시내 체인 호텔 (여가, 한팅 등) ¥100–150/박'),
        const L10nString(zh: '体验之选 → 古城内青旅床位 ¥60–100/人', ko: '체험 선택 → 고성 내 게스트하우스 도미토리 ¥60–100/인'),
        const L10nString(zh: '贴士：提前 2 周在旅行 APP 预订可享额外折扣', ko: '팁: 2주 전 여행 앱에서 예약하면 추가 할인 혜택'),
      ],
    ),
    RouteCardData(
      label: const L10nString(zh: '深度体验 · 品质住宿路线', ko: '집중 체험 · 프리미엄 숙박 코스'),
      bgColor: Color(0xFFFFFDF5),
      tagColor: Color(0xFFE6A800),
      steps: [
        const L10nString(zh: 'Day 1  入住古城精品客栈 → 夜游古城灯会 → 客栈庭院品茶', ko: 'Day 1  고성 부티크 객잔 체크인 → 야간 등불 축제 → 객잔 정원에서 차 한잔'),
        const L10nString(zh: 'Day 2  转住微山湖畔民宿 → 湖边日落 → 农家晚餐', ko: 'Day 2  웨이산호 민박으로 이동 → 호수 석양 감상 → 농가 저녁 식사'),
      ],
    ),
  ],
  photoRow2: const [
    PhotoData(
      url: 'assets/jiudian.jpeg',
      author: const L10nString(zh: '酒店大堂', ko: '호텔 로비'),
    ),
    PhotoData(
      url: 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?w=400&auto=format&fit=crop&q=80',
      author: const L10nString(zh: '客栈庭院', ko: '객잔 정원'),
    ),
  ],
  tipTitle: const L10nString(zh: '💡 预订与入住贴士', ko: '💡 예약 & 체크인 팁'),
  tipContent: const L10nString(zh: '五一、十一黄金周及微山湖荷花节（7–8月）期间枣庄酒店需求旺盛，建议至少提前 2–4 周预订。古城内客栈客房数量有限，节假日务必提前 1 个月预订。大多数客栈提供免费接送服务，预订时可主动询问。',
      ko: '노동절, 국경절 연휴 및 웨이산호 연꽃 축제(7–8월) 기간에는 짜오좡 호텔 수요가 급증하므로 최소 2–4주 전에 예약하세요. 고성 내 객잔은 객실 수가 한정되어 있어 공휴일에는 반드시 1개월 전에 예약해야 합니다. 대부분의 객잔에서 무료 픽업 서비스를 제공하므로 예약 시 문의하세요.'),
);

// ── ★★★ 枣庄美食地图（index 5）───────────────────────────────────────
const meishiConfig = DestinationConfig(
  appBarTitle: const L10nString(zh: '美食攻略', ko: '미식 가이드'),
  appBarIcon: Icons.restaurant_rounded,
  articleTitle: const L10nString(zh: '舌尖上的枣庄：\n不可错过的鲁南味道', ko: '짜오좡 미식 지도:\n놓쳐서는 안 될 루난의 맛'),
  p1Before: const L10nString(zh: '地处鲁南的', ko: '루난 지역에 위치한 '),
  p1Bold: const L10nString(zh: '枣庄', ko: '짜오좡'),
  p1After: const L10nString(zh: '，美食文化融合了齐鲁饮食的精髓与运河带来的南北风味。这里既有让人辣得过瘾的枣庄辣子鸡，也有汤鲜味醇的羊肉汤，更有独具特色的菜煎饼，是一座被低估了的美食之城。',
      ko: '의 음식 문화는 제나라와 노나라 요리의 정수에 운하가 가져온 남북의 풍미가 융합되어 있습니다. 매콤한 짜오좡 라쯔지(매운 닭볶음)부터 진한 양고기 국물의 양러우탕, 독특한 차이젠빙(야채 전병)까지, 저평가된 미식 도시입니다.'),
  photoRow1: const [
    PhotoData(
      url: 'assets/meishi.jpg',
      author: const L10nString(zh: '菜煎饼', ko: '차이젠빙'),
    ),
    PhotoData(
      url: 'assets/meishi2.jpg',
      author: const L10nString(zh: '大肉面', ko: '대육면'),
    ),
  ],
  p2Before: const L10nString(zh: '枣庄人对吃从不含糊。清晨的一碗羊肉汤配上刚出炉的烧饼，是当地人最熨帖的早餐；午后的菜煎饼外酥里嫩，是街头巷尾的烟火气息；夜晚一盆辣子鸡配上山亭花椒，则诠释了鲁南人', ko: '짜오좡 사람들은 먹는 것에 결코 소홀하지 않습니다. 이른 아침 갓 구운 소빙과 함께하는 양러우탕 한 그릇은 현지인들에게 가장 따뜻한 아침 식사입니다. 오후의 바삭하고 부드러운 차이젠빙은 골목골목 삶의 온기를 담고 있습니다. 저녁의 라쯔지와 산팅 화자오는 루난 사람들의 '),
  p2Bold: const L10nString(zh: '"无辣不欢、无鲜不食"', ko: '"맵지 않으면 즐겁지 않고, 신선하지 않으면 먹지 않는다"'),
  p2After: const L10nString(zh: '的饮食哲学。', ko: '라는 식사 철학을 보여줍니다.'),
  section1Title: const L10nString(zh: '美食概况', ko: '미식 개요'),
  infoTableRows: const [
    [const L10nString(zh: '代表菜系', ko: '대표 요리 계열'), const L10nString(zh: '鲁南菜（鲁菜分支）', ko: '루난 요리 (산둥 요리 계열)')],
    [const L10nString(zh: '口味特点', ko: '맛의 특징'), const L10nString(zh: '鲜、辣、香、醇', ko: '신선함, 매콤함, 향긋함, 깊은 맛')],
    [const L10nString(zh: '人均消费', ko: '1인당 비용'), const L10nString(zh: '正餐 ¥30–80，小吃 ¥5–15', ko: '식사 ¥30–80, 간식 ¥5–15')],
    [const L10nString(zh: '美食街区', ko: '미식 거리'), const L10nString(zh: '台儿庄美食街、市中区振兴路', ko: '타이얼좡 미식 거리, 스중구 전흥로')],
    [const L10nString(zh: '特产伴手礼', ko: '특산품 선물'), const L10nString(zh: '石榴酒、山亭花椒、微山湖咸鸭蛋', ko: '석류주, 산팅 화자오, 웨이산호 염지 오리알')],
  ],
  section2Title: const L10nString(zh: '必吃美食', ko: '꼭 먹어야 할 음식'),
  cardItems: const [
    CardItemData(icon: Icons.local_fire_department_rounded, title: const L10nString(zh: '枣庄辣子鸡', ko: '짜오좡 라쯔지'), desc: const L10nString(zh: '枣庄最具代表性的美食名片。选用本地土鸡，配以山亭花椒和干红辣椒爆炒，鸡肉鲜嫩、麻辣回甘。被誉为"中国辣子鸡之乡"的招牌菜', ko: '짜오좡의 가장 대표적인 미식 명함. 현지 토종닭과 산팅 화자오, 건고추를 넣어 볶아내며, 닭고기가 부드럽고 매콤하면서도 감칠맛이 납니다. "중국 라쯔지의 고향"이라는 대표 요리입니다')),
    CardItemData(icon: Icons.soup_kitchen_rounded, title: const L10nString(zh: '枣庄羊肉汤', ko: '짜오좡 양러우탕'), desc: const L10nString(zh: '鲁南名吃，汤色奶白、肉质酥烂。每天清晨现宰现熬，保留羊肉最原始的鲜美。配上芝麻烧饼，是枣庄人一天的开始', ko: '루난의 유명한 음식으로 국물이 우윳빛이고 고기가 부드럽습니다. 매일 새벽 갓 잡아 푹 고아 양고기 본연의 깊은 맛을 살렸습니다. 참깨 소빙과 함께하면 짜오좡 사람들의 하루가 시작됩니다')),
    CardItemData(icon: Icons.breakfast_dining_rounded, title: const L10nString(zh: '菜煎饼', ko: '차이젠빙'), desc: const L10nString(zh: '街头巷尾的经典小吃。薄如蝉翼的煎饼裹上时令蔬菜，外皮酥脆、内馅清爽。现做现吃，是枣庄最具烟火气的美食', ko: '골목골목의 클래식 간식. 날개처럼 얇은 전병에 제철 채소를 싸서 겉은 바삭하고 속은 산뜻합니다. 즉석에서 만들어 바로 먹는, 짜오좡에서 가장 생활감 넘치는 음식입니다')),
  ],
  section3Title: const L10nString(zh: '美食探索路线', ko: '미식 탐방 코스'),
  routeCards: const [
    RouteCardData(
      label: const L10nString(zh: '一日美食之旅', ko: '1일 미식 여행'),
      bgColor: Color(0xFFFFF5F0),
      tagColor: Color(0xFFE8652D),
      steps: [
        const L10nString(zh: '早餐（7:00） 西集羊肉汤 + 芝麻烧饼', ko: '아침 (7:00)  시지 양러우탕 + 참깨 소빙'),
        const L10nString(zh: '午餐（12:00） 枣庄辣子鸡 + 石榴叶茶', ko: '점심 (12:00)  짜오좡 라쯔지 + 석류잎 차'),
        const L10nString(zh: '晚餐（18:30） 台儿庄古城美食街 → 运河鲤鱼 + 菜煎饼', ko: '저녁 (18:30)  타이얼좡 고성 미식 거리 → 운하 잉어 요리 + 차이젠빙'),
      ],
    ),
    RouteCardData(
      label: const L10nString(zh: '特产采购路线', ko: '특산품 쇼핑 코스'),
      bgColor: Color(0xFFFFFDF5),
      tagColor: Color(0xFFE6A800),
      steps: [
        const L10nString(zh: '石榴酒 → 冠世榴园景区商店或市区特产店', ko: '석류주 → 관세석류원 상점 또는 시내 특산품점'),
        const L10nString(zh: '山亭花椒 → 山亭区农贸市场', ko: '산팅 화자오 → 산팅구 농산물 시장'),
        const L10nString(zh: '微山湖咸鸭蛋 & 松花蛋 → 微山湖景区出口商店', ko: '웨이산호 염지 오리알 & 송화단 → 웨이산호 관광지 출구 상점'),
      ],
    ),
  ],
  photoRow2: const [
    PhotoData(
      url: 'assets/meishi.jpg',
      author: const L10nString(zh: '菜煎饼', ko: '차이젠빙'),
    ),
    PhotoData(
      url: 'assets/meishi2.jpg',
      author: const L10nString(zh: '美食街区夜市', ko: '미식 거리 야시장'),
    ),
  ],
  tipTitle: const L10nString(zh: '💡 美食贴士', ko: '💡 미식 팁'),
  tipContent: const L10nString(zh: '枣庄辣子鸡辣度较高，不习惯重辣的朋友可以提前告知店家"少辣"。台儿庄古城美食街的店铺价格略高于市区，但胜在品类齐全、夜景氛围好。正宗的西集羊肉汤往往清晨 5–6 点就开始营业，想尝最鲜美的头锅汤需要早起哦！',
      ko: '짜오좡 라쯔지는 매운 정도가 높으므로, 매운 음식에 익숙하지 않은 분은 미리 "덜 맵게" 요청하세요. 타이얼좡 고성 미식 거리의 가게들은 시내보다 약간 비싸지만 종류가 다양하고 야경 분위기가 좋습니다. 정통 시지 양러우탕은 보통 새벽 5–6시부터 영업을 시작하므로, 가장 신선한 첫 국물을 맛보려면 일찍 일어나야 합니다!'),
);

// ── ★★★ 所有攻略配置的索引列表 ─────────────────────────────────────
const List<DestinationConfig> allConfigs = [
  guanfangConfig,   // 0
  guchengConfig,    // 1
  weishanhuConfig,  // 2
  shiliuyuanConfig, // 3
  jiudianConfig,    // 4
  meishiConfig,     // 5
];

// ── 通用详情页组件 ──────────────────────────────────────────────────

class DestinationPage extends StatelessWidget {
  final DestinationConfig config;
  final String locale;
  final String? heroTag;
  const DestinationPage({
    Key? key,
    required this.config,
    required this.locale,
    this.heroTag,
  }) : super(key: key);

  /// 辅助：从 L10nString 获取当前语言文本
  String t(L10nString s) => s.text(locale);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFFF7F6F2),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  _buildArticleTitle(),
                  const SizedBox(height: 20),
                  if (config.videoUrl != null) ...[
                    _VideoPlayerWidget(
                      url: config.videoUrl!,
                      fromAsset: config.videoFromAsset,
                    ),
                    const SizedBox(height: 24),
                  ],
                  _buildParagraph(config.p1Before, bold: config.p1Bold, after: config.p1After),
                  const SizedBox(height: 24),
                  _buildPhotoRow(config.photoRow1),
                  const SizedBox(height: 24),
                  _buildParagraph(config.p2Before, bold: config.p2Bold, after: config.p2After),
                  const SizedBox(height: 32),
                  _buildSectionTitle(config.section1Title),
                  const SizedBox(height: 16),
                  _buildInfoTable(),
                  const SizedBox(height: 32),
                  _buildSectionTitle(config.section2Title),
                  const SizedBox(height: 16),
                  _buildCardList(),
                  const SizedBox(height: 32),
                  _buildSectionTitle(config.section3Title),
                  const SizedBox(height: 16),
                  _buildRouteCards(),
                  const SizedBox(height: 24),
                  _buildPhotoRow(config.photoRow2),
                  const SizedBox(height: 32),
                  _buildTip(config.tipTitle, config.tipContent),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── 顶部导航栏 ──────────────────────────────────────────────────
  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: const Color(0xFFF7F6F2),
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: Colors.black87),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFD600), Color(0xFFFFB300)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(config.appBarIcon, size: 14, color: Colors.white),
          ),
          const SizedBox(width: 8),
          Text(
            t(config.appBarTitle),
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.star_border_rounded, size: 22, color: Colors.black87),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz_rounded, size: 22, color: Colors.black87),
          onPressed: () {},
        ),
        const SizedBox(width: 4),
      ],
    );
  }

  // ── 文章大标题 ─────────────────────────────────────────────────
  Widget _buildArticleTitle() {
    return Text(
      t(config.articleTitle),
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        color: Colors.black87,
        height: 1.3,
        letterSpacing: 0.5,
      ),
    );
  }

  // ── 段落文本 ────────────────────────────────────────────────────
  Widget _buildParagraph(L10nString before, {L10nString? bold, L10nString? after}) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 16, color: Color(0xFF4A4A4A), height: 1.8, letterSpacing: 0.3),
        children: [
          if (t(before).isNotEmpty) TextSpan(text: t(before)),
          if (bold != null && t(bold).isNotEmpty)
            TextSpan(text: t(bold), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          if (after != null) TextSpan(text: t(after)),
        ],
      ),
    );
  }

  // ── 图片横排 ────────────────────────────────────────────────────
  Widget _buildPhotoRow(List<PhotoData> photos) {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: _PhotoCard(
                url: photos[0].url,
                label: t(photos[0].author),
                heroTag: heroTag),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: _PhotoCard(url: photos[1].url, label: t(photos[1].author)),
          ),
        ],
      ),
    );
  }

  // ── 小节标题 ────────────────────────────────────────────────────
  Widget _buildSectionTitle(L10nString title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: const Color(0xFFFFD600),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          t(title),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87, letterSpacing: 0.5),
        ),
      ],
    );
  }

  // ── 信息表 ──────────────────────────────────────────────────────
  Widget _buildInfoTable() {
    final rows = config.infoTableRows;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: List.generate(rows.length, (i) {
          final isLast = i == rows.length - 1;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              border: isLast ? null : const Border(bottom: BorderSide(color: Color(0xFFF0F0F0), width: 0.5)),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 90,
                  child: Text(t(rows[i][0]), style: const TextStyle(fontSize: 15, color: Colors.black54)),
                ),
                Text(
                  t(rows[i][1]),
                  style: const TextStyle(fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  // ── 卡片列表（交通 / 特色体验）─────────────────────────────────
  Widget _buildCardList() {
    return Column(
      children: config.cardItems.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF9E0),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(item.icon, size: 24, color: const Color(0xFFE6A800)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t(item.title), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                    const SizedBox(height: 4),
                    Text(t(item.desc), style: const TextStyle(fontSize: 14, color: Colors.black54, height: 1.4)),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ── 路线卡片 ────────────────────────────────────────────────────
  Widget _buildRouteCards() {
    return Column(
      children: config.routeCards.map((r) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: r.bgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  t(r.label),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: r.tagColor),
                ),
              ),
              const SizedBox(height: 16),
              ...r.steps.map((s) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: CircleAvatar(radius: 3.5, backgroundColor: r.tagColor),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(t(s), style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.5)),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        );
      }).toList(),
    );
  }

  // ── 小贴士 ──────────────────────────────────────────────────────
  Widget _buildTip(L10nString title, L10nString content) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFFFE082), width: 1),
        boxShadow: [
          BoxShadow(color: const Color(0xFFFFD600).withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t(title), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFD48B00))),
          const SizedBox(height: 8),
          Text(t(content), style: const TextStyle(fontSize: 15, color: Colors.black87, height: 1.6)),
        ],
      ),
    );
  }
}

// ── 图片卡片组件 ─────────────────────────────────────────────────
class _PhotoCard extends StatelessWidget {
  final String url;
  final String label;
  final String? heroTag;
  const _PhotoCard({
    required this.url,
    required this.label,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    final isAsset = url.startsWith('assets/');
    final image = isAsset
        ? Image.asset(
            url,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => ShimmerBox(
              borderRadius: 12,
              child: const Icon(Icons.broken_image_rounded,
                  color: Color(0xFFCCCCCC), size: 28),
            ),
          )
        : Image.network(
            url,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => ShimmerBox(
              borderRadius: 12,
              child: const Icon(Icons.broken_image_rounded,
                  color: Color(0xFFCCCCCC), size: 28),
            ),
          );
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (heroTag != null)
            Hero(tag: heroTag!, child: image)
          else
            image,
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(0xFFFFD600),
                    child: Icon(Icons.location_on_rounded, size: 12, color: Colors.white),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      label,
                      style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── 视频播放器组件 ─────────────────────────────────────────────────
class _VideoPlayerWidget extends StatefulWidget {
  final String url;
  final bool fromAsset;
  const _VideoPlayerWidget({required this.url, this.fromAsset = false});

  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late final VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.fromAsset
        ? VideoPlayerController.asset(widget.url)
        : VideoPlayerController.networkUrl(Uri.parse(widget.url));
    _controller.initialize().then((_) {
      if (mounted) {
        setState(() => _isInitialized = true);
        _controller.setLooping(true);
        _controller.play(); // 自动播放
      }
    });
    _controller.addListener(() {
      if (mounted) {
        setState(() => _isPlaying = _controller.value.isPlaying);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlay() {
    if (_isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (_isInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          else
            const AspectRatio(
              aspectRatio: 16 / 9,
              child: ShimmerBox(),
            ),
          if (_isInitialized)
            GestureDetector(
              onTap: _togglePlay,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: _isPlaying
                      ? Colors.transparent
                      : Colors.black.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child: _isPlaying
                    ? const SizedBox.shrink()
                    : const Icon(Icons.play_arrow_rounded,
                        size: 36, color: Colors.white),
              ),
            ),
          if (_isInitialized && _isPlaying)
            Positioned(
              bottom: 8,
              right: 12,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _formatDuration(_controller.value.position),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    final mm = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final ss = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$mm:$ss';
  }
}
