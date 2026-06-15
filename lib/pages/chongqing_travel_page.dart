import 'package:flutter/material.dart';

enum AppLanguage { zh, ko }

class L {
  const L(this.zh, this.ko);

  final String zh;
  final String ko;

  String of(AppLanguage language) => language == AppLanguage.zh ? zh : ko;
}

class ChongqingTravelPage extends StatelessWidget {
  const ChongqingTravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        scaffoldBackgroundColor: AppColors.background,
      ),
      child: const TravelShell(),
    );
  }
}

class AppColors {
  static const primary = Color(0xffd62828);
  static const orange = Color(0xffff6b00);
  static const teal = Color(0xff2a9d8f);
  static const blue = Color(0xff2196f3);
  static const ink = Color(0xff1d1d1d);
  static const muted = Color(0xff6b7280);
  static const background = Color(0xfff5f5f7);
  static const line = Color(0xffe7e9ef);
}

class Assets {
  static const hongya = 'assets/chongqing/hongya_hero.png';
  static const cableway = 'assets/chongqing/cableway.png';
  static const route = 'assets/chongqing/route_city.png';
  static const mapCoreCity = 'assets/chongqing/map_core_city_reference.jpg';
  static const mapRegion =
      'assets/chongqing/map_chongqing_region_reference.png';
  static const routeMap = 'assets/chongqing/route_map_realistic.png';
  static const hongyaDetail = 'assets/chongqing/hongya_detail.png';
  static const lizibaDetail = 'assets/chongqing/liziba_detail.png';
  static const ciqikouDetail = 'assets/chongqing/ciqikou_detail.png';
  static const cablewayDetail = 'assets/chongqing/cableway_detail.png';
  static const jiefangbeiDetail = 'assets/chongqing/jiefangbei_detail.png';
  static const nanshanDetail = 'assets/chongqing/nanshan_detail.png';
  static const shibatiDetail = 'assets/chongqing/shibati_detail.png';
  static const elingDetail = 'assets/chongqing/eling_detail.png';
  static const chaotianmenDetail = 'assets/chongqing/chaotianmen_detail.png';
  static const museumDetail = 'assets/chongqing/museum_detail.png';
  static const dazuDetail = 'assets/chongqing/dazu_detail.png';
  static const wulongDetail = 'assets/chongqing/wulong_detail.png';
  static const hotpotDetail = 'assets/chongqing/hotpot_detail.png';
  static const xiaomianDetail = 'assets/chongqing/xiaomian_detail.png';
  static const suanlafenDetail = 'assets/chongqing/suanlafen_detail.png';
  static const maoxuewangDetail = 'assets/chongqing/maoxuewang_detail.png';
  static const lazijiDetail = 'assets/chongqing/laziji_detail.png';
  static const kaonaohuaDetail = 'assets/chongqing/kaonaohua_detail.png';
  static const bingfenDetail = 'assets/chongqing/bingfen_detail.png';
  static const kaoshaopiDetail = 'assets/chongqing/kaoshaopi_detail.png';
}

class S {
  static const home = L('首页', '홈');
  static const attractions = L('景点', '관광지');
  static const food = L('美食', '맛집');
  static const travel = L('旅游', '여행');
  static const cloudy = L('多云 26°C · 山城之旅', '흐림 26°C · 산성 여행');
  static const heroBadge = L('8D 魔幻之城', '8D 마법 같은 도시');
  static const heroTitle = L('山城重庆', '산성 충칭');
  static const heroSub = L('遇见山城之美，开启一段精彩旅程', '산성의 아름다움을 만나 특별한 여행을 시작하세요');
  static const intro = L('重庆简介', '충칭 소개');
  static const introShort = L(
    '重庆，山城、江城、雾都，独特的地理造就了8D魔幻城市。点击卡片了解重庆历史文化。',
    '충칭은 산성, 강의 도시, 안개의 도시로 불립니다. 독특한 지형이 8D 같은 도시 풍경을 만들었습니다. 카드를 눌러 역사와 문화를 알아보세요.',
  );
  static const historyTitle = L('重庆历史文化', '충칭 역사 문화');
  static const historyBody = L(
    '重庆是一座依山傍水的历史文化名城，巴渝文化在这里延续千年。两江交汇形成了码头文化，山地地形造就了层层叠叠的街巷和独特的立体交通。抗战时期，重庆曾作为陪都，留下丰富的历史记忆。今天的重庆既有洪崖洞、磁器口这样的传统风貌，也有解放碑、长江索道和跨江大桥构成的现代山城气质。火锅、小面、江湖菜则把重庆人的豪爽、热情和烟火气留在了味觉里。',
    '충칭은 산과 강이 어우러진 역사 문화 도시이며, 파위 문화가 천 년 이상 이어져 왔습니다. 양쯔강과 자링강이 만나는 지형은 부두 문화를 만들었고, 산지 도시는 겹겹이 이어지는 골목과 입체 교통을 낳았습니다. 항전 시기에는 임시 수도로서 깊은 역사 기억을 남겼습니다. 오늘의 충칭은 홍야동과 츠치커우 같은 전통 풍경, 제팡베이와 장강 케이블카 같은 현대적 산성 매력을 함께 품고 있습니다.',
  );
  static const hotAttractions = L('热门景点', '인기 관광지');
  static const specialFood = L('特色美食', '대표 음식');
  static const travelRecommend = L('旅游推荐', '여행 추천');
  static const all = L('全部', '전체');
  static const popular = L('热门', '인기');
  static const nature = L('自然风光', '자연 풍경');
  static const culture = L('人文古迹', '역사 문화');
  static const checkin = L('网红打卡', '핫플');
  static const landmark = L('城市地标', '도시 랜드마크');
  static const attractionSub = L('精选山城代表景点', '산성 충칭의 대표 명소');
  static const foodSub = L('品味地道重庆味', '진짜 충칭의 맛');
  static const routeTitle = L('推荐旅游路线', '추천 여행 코스');
  static const routeSub = L('精选路线，畅游重庆', '엄선한 코스로 충칭 즐기기');
  static const hotpotJianghu = L('火锅江湖菜', '훠궈·향토요리');
  static const noodleSnack = L('面食小吃', '면·간식');
  static const nightMarket = L('夜市烧烤', '야시장·구이');
  static const dessertDrink = L('甜品饮品', '디저트·음료');
  static const oneDay = L('一日游', '당일 코스');
  static const twoDay = L('两日游', '1박 2일');
  static const threeDay = L('三日游', '2박 3일');
  static const nearby = L('周边游', '근교 여행');
  static const rating = L('评分', '평점');
  static const spicy = L('辣度', '매운맛');
  static const cool = L('清凉解辣', '매운맛 완화');
  static const attractionIntro = L('景点介绍', '명소 소개');
  static const reason = L('推荐理由', '추천 이유');
  static const taste = L('口味说明', '맛 설명');
  static const pairing = L('推荐搭配', '추천 조합');
  static const suitable = L('适合人群', '추천 대상');
  static const duration = L('建议时长', '추천 소요 시간');
  static const routeType = L('路线类型', '코스 유형');
  static const routeAdvice = L('路线建议', '코스 팁');
  static const mapTitle = L('地图路线示意图', '지도 경로 안내');
  static const stepsTitle = L('分站点行程', '구간별 일정');
  static const detail = L('详情', '상세');
  static const gotIt = L('知道了', '확인');
}

class Attraction {
  const Attraction({
    required this.name,
    required this.subtitle,
    required this.area,
    required this.rating,
    required this.category,
    required this.image,
    required this.detail,
    required this.reason,
  });

  final L name;
  final L subtitle;
  final L area;
  final double rating;
  final L category;
  final String image;
  final L detail;
  final L reason;
}

class FoodItem {
  const FoodItem({
    required this.name,
    required this.subtitle,
    required this.category,
    required this.rating,
    required this.heat,
    required this.image,
    required this.detail,
    required this.pairing,
    required this.suitableFor,
  });

  final L name;
  final L subtitle;
  final L category;
  final double rating;
  final int heat;
  final String image;
  final L detail;
  final L pairing;
  final L suitableFor;
}

class RoutePlan {
  const RoutePlan({
    required this.title,
    required this.category,
    required this.badge,
    required this.scenes,
    required this.duration,
    required this.mapAsset,
    required this.image,
    required this.steps,
    required this.pins,
    required this.suggestion,
  });

  final L title;
  final L category;
  final L badge;
  final L scenes;
  final L duration;
  final String mapAsset;
  final String image;
  final List<L> steps;
  final List<Offset> pins;
  final L suggestion;
}

const attractions = <Attraction>[
  Attraction(
    name: L('洪崖洞', '홍야동'),
    subtitle: L('巴渝吊脚楼群，夜晚灯火层叠', '파위식 전통 건축과 화려한 야경'),
    area: L('渝中区', '위중구'),
    rating: 4.8,
    category: S.popular,
    image: Assets.hongyaDetail,
    detail: L(
      '洪崖洞依山临江而建，吊脚楼、江景和灯火夜景结合，是重庆最具辨识度的城市名片之一。',
      '홍야동은 산과 강을 따라 지어진 전통 건축과 강변 야경이 어우러진 충칭의 대표 명소입니다.',
    ),
    reason: L(
      '傍晚到江边等待开灯，适合拍摄夜景和体验重庆层层叠叠的城市空间。',
      '해질 무렵 방문하면 불빛이 켜지는 순간과 입체적인 산성 풍경을 함께 볼 수 있습니다.',
    ),
  ),
  Attraction(
    name: L('李子坝轻轨站', '리즈바 경전철역'),
    subtitle: L('轻轨穿楼，网红打卡地', '건물을 통과하는 경전철 핫플'),
    area: L('渝中区', '위중구'),
    rating: 4.7,
    category: S.checkin,
    image: Assets.lizibaDetail,
    detail: L(
      '列车从居民楼中穿过，是重庆立体交通的代表场景，也展示了山地城市因地制宜的空间智慧。',
      '열차가 건물을 통과하는 장면은 충칭 입체 교통의 상징입니다.',
    ),
    reason: L(
      '白天视线更清楚，在观景平台等待几分钟就能看到轻轨穿楼。',
      '낮에 전망대에서 기다리면 선명하게 경전철 통과 장면을 볼 수 있습니다.',
    ),
  ),
  Attraction(
    name: L('磁器口古镇', '츠치커우 고진'),
    subtitle: L('千年古镇，巴渝文化缩影', '천년 고진과 파위 문화'),
    area: L('沙坪坝区', '사핑바구'),
    rating: 4.6,
    category: S.culture,
    image: Assets.ciqikouDetail,
    detail: L(
      '磁器口保留老街、茶馆、码头文化和巴渝民居风貌，是了解老重庆生活方式的窗口。',
      '츠치커우는 옛 골목, 찻집, 부두 문화를 간직한 오래된 거리입니다.',
    ),
    reason: L(
      '上午慢逛更舒服，可以尝陈麻花、喝盖碗茶，从小巷避开主街人流。',
      '오전에 천천히 걷고 전통 간식과 차를 즐기기 좋습니다.',
    ),
  ),
  Attraction(
    name: L('长江索道', '장강 케이블카'),
    subtitle: L('空中观景，俯瞰山城', '공중에서 보는 산성 풍경'),
    area: L('渝中区', '위중구'),
    rating: 4.6,
    category: S.nature,
    image: Assets.cablewayDetail,
    detail: L(
      '长江索道横跨长江，乘坐时能看到江面、桥梁、楼群和山地坡坎，是城市交通与观景体验的结合。',
      '장강 케이블카는 강과 다리, 산지 도시를 공중에서 볼 수 있는 충칭의 대표 체험입니다.',
    ),
    reason: L('从北站坐到南岸，再沿南滨路散步，体验更完整。', '북쪽에서 남안으로 이동한 뒤 강변 산책을 더하면 좋습니다.'),
  ),
  Attraction(
    name: L('解放碑', '제팡베이'),
    subtitle: L('重庆地标商圈', '충칭 중심 랜드마크'),
    area: L('渝中区', '위중구'),
    rating: 4.7,
    category: S.landmark,
    image: Assets.jiefangbeiDetail,
    detail: L(
      '解放碑是重庆中心城区的地标，也代表了城市商业活力和现代化发展。',
      '제팡베이는 충칭 중심 상권과 현대 도시 활력을 대표합니다.',
    ),
    reason: L(
      '适合作为一日游起点，步行可连接八一路好吃街和洪崖洞。',
      '당일 코스 출발점으로 좋고 주변 먹거리 거리와 홍야동을 걸어서 연결할 수 있습니다.',
    ),
  ),
  Attraction(
    name: L('南山一棵树观景台', '난산 일과수 전망대'),
    subtitle: L('俯瞰两江夜景', '두 강의 야경 전망'),
    area: L('南岸区', '난안구'),
    rating: 4.6,
    category: S.nature,
    image: Assets.nanshanDetail,
    detail: L(
      '南山一棵树可以俯瞰重庆半岛、两江和桥梁，是欣赏山城夜景的经典地点。',
      '난산 전망대는 충칭 반도와 두 강, 다리를 내려다보는 야경 명소입니다.',
    ),
    reason: L('日落前上山，既能看黄昏，也能等到城市灯光亮起。', '일몰 전에 올라가면 노을과 야경을 모두 볼 수 있습니다.'),
  ),
  Attraction(
    name: L('十八梯', '스바티'),
    subtitle: L('老街梯坎，山城记忆', '계단 골목과 산성의 기억'),
    area: L('渝中区', '위중구'),
    rating: 4.6,
    category: S.culture,
    image: Assets.shibatiDetail,
    detail: L(
      '十八梯用梯坎、老街和市井空间记录了老重庆的山城生活，是历史街区更新后的代表。',
      '스바티는 계단과 옛 골목으로 오래된 충칭의 생활감을 보여줍니다.',
    ),
    reason: L('适合傍晚散步，边走边感受山城坡坎和老街灯火。', '저녁 산책으로 산성 골목과 불빛을 느끼기 좋습니다.'),
  ),
  Attraction(
    name: L('鹅岭二厂', '어링 제2공장'),
    subtitle: L('文创园区，城市天台', '문화 창의 공원과 도시 전망'),
    area: L('渝中区', '위중구'),
    rating: 4.5,
    category: S.checkin,
    image: Assets.elingDetail,
    detail: L(
      '鹅岭二厂由老厂房改造而来，融合文创店铺、涂鸦、天台视野和青年文化。',
      '오래된 공장을 개조한 문화 공간으로 카페, 그래피티, 전망이 어우러집니다.',
    ),
    reason: L('适合拍照、喝咖啡，也能从高处眺望重庆城市层次。', '사진과 카페, 도심 전망을 함께 즐기기 좋습니다.'),
  ),
  Attraction(
    name: L('朝天门来福士', '차오톈먼 래플스'),
    subtitle: L('两江交汇，现代地标', '두 강이 만나는 현대 랜드마크'),
    area: L('渝中区', '위중구'),
    rating: 4.7,
    category: S.landmark,
    image: Assets.chaotianmenDetail,
    detail: L(
      '朝天门位于长江与嘉陵江交汇处，来福士建筑群是重庆现代滨江天际线的重要符号。',
      '차오톈먼은 두 강의 합류 지점이며 래플스는 현대적 스카이라인의 상징입니다.',
    ),
    reason: L(
      '适合看两江交汇和城市天际线，可与洪崖洞、解放碑串联。',
      '두 강의 합류와 스카이라인을 보며 홍야동, 제팡베이와 함께 둘러보기 좋습니다.',
    ),
  ),
  Attraction(
    name: L('重庆中国三峡博物馆', '충칭 중국 삼협박물관'),
    subtitle: L('城市历史与三峡文化', '도시 역사와 삼협 문화'),
    area: L('渝中区', '위중구'),
    rating: 4.6,
    category: S.culture,
    image: Assets.museumDetail,
    detail: L(
      '三峡博物馆展示重庆历史、巴渝文化、三峡工程和城市变迁，是理解重庆文化脉络的好去处。',
      '삼협박물관은 충칭 역사와 삼협 문화, 도시 변화를 이해하기 좋은 곳입니다.',
    ),
    reason: L('适合安排半天慢慢参观，和人民大礼堂一起游览。', '반나절 정도 천천히 관람하고 인민대례당과 함께 둘러보면 좋습니다.'),
  ),
  Attraction(
    name: L('大足石刻', '다쭈 석각'),
    subtitle: L('世界遗产，石窟艺术', '세계유산 석굴 예술'),
    area: L('大足区', '다쭈구'),
    rating: 4.8,
    category: S.culture,
    image: Assets.dazuDetail,
    detail: L(
      '大足石刻以精美佛教造像闻名，是重庆重要的世界文化遗产，兼具艺术和历史价值。',
      '다쭈 석각은 정교한 불교 조각으로 유명한 세계문화유산입니다.',
    ),
    reason: L(
      '适合周边一日游，建议预留充足时间看宝顶山石刻。',
      '근교 당일 코스로 좋으며 보정산 석각 관람 시간을 넉넉히 잡는 것이 좋습니다.',
    ),
  ),
  Attraction(
    name: L('武隆天生三桥', '우룽 천생삼교'),
    subtitle: L('喀斯特奇观，山水大片', '카르스트 절경'),
    area: L('武隆区', '우룽구'),
    rating: 4.8,
    category: S.nature,
    image: Assets.wulongDetail,
    detail: L(
      '武隆天生三桥以喀斯特天坑、峡谷和天然石桥闻名，是重庆周边自然风光代表。',
      '우룽 천생삼교는 카르스트 협곡과 천연 다리로 유명한 자연 명소입니다.',
    ),
    reason: L('适合三日游或周边游，和仙女山组合体验更丰富。', '2박 3일 또는 근교 코스로 선녀산과 함께 둘러보면 좋습니다.'),
  ),
];

const foods = <FoodItem>[
  FoodItem(
    name: L('重庆火锅', '충칭 훠궈'),
    subtitle: L('麻辣鲜香，越吃越上瘾', '얼얼하고 매운 대표 음식'),
    category: S.hotpotJianghu,
    rating: 4.9,
    heat: 5,
    image: Assets.hotpotDetail,
    detail: L('重庆火锅以牛油锅底、花椒和辣椒为灵魂，越煮越香。', '충칭 훠궈는 소기름 육수와 산초, 고추의 향이 핵심입니다.'),
    pairing: L('推荐搭配：毛肚、鸭肠、黄喉、冰粉。', '추천 조합: 소 천엽, 오리 창자, 황후, 빙펀.'),
    suitableFor: L('适合想体验重庆烟火气和重口味美食的游客。', '진한 충칭의 맛을 경험하고 싶은 여행자에게 좋습니다.'),
  ),
  FoodItem(
    name: L('重庆小面', '충칭 소면'),
    subtitle: L('劲道爽滑，香辣过瘾', '쫄깃하고 매콤한 면'),
    category: S.noodleSnack,
    rating: 4.7,
    heat: 4,
    image: Assets.xiaomianDetail,
    detail: L(
      '重庆小面讲究佐料，辣椒油、花椒面、酱油、葱花和榨菜粒调出山城味道。',
      '충칭 소면은 고추기름, 산초, 파, 장아찌가 어우러진 로컬 면 요리입니다.',
    ),
    pairing: L('推荐搭配：煎蛋、豌杂、豆浆。', '추천 조합: 달걀프라이, 완자, 두유.'),
    suitableFor: L('适合早餐或短暂停留时快速体验本地味道。', '아침이나 짧은 일정에 현지 맛을 빠르게 느끼기 좋습니다.'),
  ),
  FoodItem(
    name: L('酸辣粉', '쏸라펀'),
    subtitle: L('酸辣开胃，口感爽滑', '새콤매콤한 고구마면'),
    category: S.noodleSnack,
    rating: 4.6,
    heat: 4,
    image: Assets.suanlafenDetail,
    detail: L(
      '酸辣粉用红薯粉搭配醋、辣椒油、花生和香菜，酸辣开胃。',
      '쏸라펀은 고구마 전분면에 식초와 고추기름을 더한 새콤매콤한 간식입니다.',
    ),
    pairing: L('推荐搭配：锅盔、冰汤圆。', '추천 조합: 궈쿠이, 차가운 탕위안.'),
    suitableFor: L('适合喜欢酸辣口味和街头小吃的人。', '새콤하고 매운 길거리 음식을 좋아하는 사람에게 좋습니다.'),
  ),
  FoodItem(
    name: L('毛血旺', '마오쉐왕'),
    subtitle: L('麻辣鲜香，食材丰富', '매콤하고 재료가 풍부한 요리'),
    category: S.hotpotJianghu,
    rating: 4.8,
    heat: 5,
    image: Assets.maoxuewangDetail,
    detail: L(
      '毛血旺有鸭血、毛肚、午餐肉、豆芽和宽粉，红油厚重，是江湖菜代表。',
      '마오쉐왕은 오리피, 천엽, 햄, 콩나물, 넓은 면을 매운 기름에 끓인 향토요리입니다.',
    ),
    pairing: L('推荐搭配：米饭、凉拌黄瓜。', '추천 조합: 밥, 오이무침.'),
    suitableFor: L(
      '适合多人分享，尤其适合喜欢江湖菜的人。',
      '여러 명이 나눠 먹기 좋고 향토요리를 좋아하는 사람에게 잘 맞습니다.',
    ),
  ),
  FoodItem(
    name: L('辣子鸡', '라즈지'),
    subtitle: L('香辣酥脆，回味无穷', '바삭하고 향긋한 매운 닭요리'),
    category: S.hotpotJianghu,
    rating: 4.6,
    heat: 5,
    image: Assets.lazijiDetail,
    detail: L(
      '辣子鸡用干辣椒、花椒和鸡块爆炒，鸡肉外酥里嫩，香气浓烈。',
      '라즈지는 말린 고추와 산초, 닭고기를 강하게 볶아 바삭하고 향이 진합니다.',
    ),
    pairing: L('推荐搭配：米饭、山城啤酒。', '추천 조합: 밥, 맥주.'),
    suitableFor: L('适合喜欢香辣干锅口感的游客。', '바삭하고 매운 볶음 요리를 좋아하는 여행자에게 좋습니다.'),
  ),
  FoodItem(
    name: L('山城烤脑花', '산성 구운 뇌화'),
    subtitle: L('外焦里嫩，香麻入味', '부드럽고 매콤한 야시장 음식'),
    category: S.nightMarket,
    rating: 4.5,
    heat: 3,
    image: Assets.kaonaohuaDetail,
    detail: L(
      '烤脑花是重庆夜市特色，蒜蓉、辣椒和葱花让口感细腻浓郁。',
      '구운 뇌화는 마늘, 고추, 파가 어우러진 충칭 야시장 특색 음식입니다.',
    ),
    pairing: L('推荐搭配：烤苕皮、冰粉。', '추천 조합: 구운 고구마피, 빙펀.'),
    suitableFor: L('适合想挑战重庆夜市特色的人。', '충칭 야시장 특색을 도전해보고 싶은 사람에게 좋습니다.'),
  ),
  FoodItem(
    name: L('冰粉', '빙펀'),
    subtitle: L('清凉解辣，甜香爽口', '매운맛을 달래는 디저트'),
    category: S.dessertDrink,
    rating: 4.7,
    heat: 0,
    image: Assets.bingfenDetail,
    detail: L(
      '冰粉常搭配红糖、花生、葡萄干和水果，是吃完火锅后的解辣甜品。',
      '빙펀은 흑설탕, 땅콩, 건포도, 과일을 곁들인 시원한 디저트입니다.',
    ),
    pairing: L('推荐搭配：火锅、辣子鸡、酸辣粉。', '추천 조합: 훠궈, 라즈지, 쏸라펀.'),
    suitableFor: L('适合怕辣但又想体验重庆美食节奏的人。', '매운 음식을 먹은 뒤 입안을 달래기 좋습니다.'),
  ),
  FoodItem(
    name: L('烤苕皮', '구운 고구마피'),
    subtitle: L('糯叽叽夜市小吃', '쫀득한 야시장 간식'),
    category: S.nightMarket,
    rating: 4.6,
    heat: 2,
    image: Assets.kaoshaopiDetail,
    detail: L(
      '烤苕皮外层微焦，内里软糯，刷上辣酱后夹入酸萝卜和葱花，口感很有层次。',
      '구운 고구마피는 바삭하고 쫀득한 식감에 매운 소스와 파, 절임무가 어우러집니다.',
    ),
    pairing: L('推荐搭配：烤脑花、冰粉。', '추천 조합: 구운 뇌화, 빙펀.'),
    suitableFor: L('适合夜市边走边吃，体验重庆街头烟火气。', '야시장에서 걸으며 먹기 좋은 간식입니다.'),
  ),
];

const routes = <RoutePlan>[
  RoutePlan(
    title: L('重庆经典一日游', '충칭 클래식 당일 코스'),
    category: S.oneDay,
    badge: S.popular,
    scenes: L('4个景点', '명소 4곳'),
    duration: L('约8-9小时', '약 8-9시간'),
    mapAsset: Assets.mapCoreCity,
    image: Assets.route,
    steps: [
      L('解放碑', '제팡베이'),
      L('洪崖洞', '홍야동'),
      L('长江索道', '장강 케이블카'),
      L('南山一棵树', '난산 일과수'),
    ],
    pins: [
      Offset(.39, .54),
      Offset(.41, .53),
      Offset(.44, .57),
      Offset(.48, .62),
    ],
    suggestion: L(
      '适合第一次来重庆的游客，重点体验地标、江景、索道和夜景。长江索道单程很短，但建议为排队、拍照和转场预留充足时间。',
      '처음 충칭을 방문하는 여행자에게 적합하며 랜드마크, 강 풍경, 케이블카와 야경을 한 번에 경험합니다.',
    ),
  ),
  RoutePlan(
    title: L('山城文化两日游', '산성 문화 1박 2일'),
    category: S.twoDay,
    badge: S.twoDay,
    scenes: L('7个景点', '명소 7곳'),
    duration: L('2天1夜，日均约6-7小时', '1박 2일, 하루 약 6-7시간'),
    mapAsset: Assets.mapCoreCity,
    image: Assets.hongya,
    steps: [
      L('磁器口', '츠치커우'),
      L('李子坝', '리즈바'),
      L('鹅岭二厂', '어링 제2공장'),
      L('洪崖洞夜景', '홍야동 야경'),
      L('解放碑', '제팡베이'),
    ],
    pins: [
      Offset(.32, .56),
      Offset(.38, .50),
      Offset(.39, .48),
      Offset(.41, .53),
      Offset(.39, .54),
    ],
    suggestion: L(
      '适合想了解老街文化、交通奇观和夜景摄影的游客。每天控制在6-7小时游览，更适合慢节奏体验。',
      '옛 거리 문화, 입체 교통, 야경 촬영을 즐기고 싶은 여행자에게 좋습니다.',
    ),
  ),
  RoutePlan(
    title: L('山水休闲三日游', '산수 휴식 2박 3일'),
    category: S.threeDay,
    badge: S.threeDay,
    scenes: L('9个景点', '명소 9곳'),
    duration: L('3天2夜，含武隆往返与景区游览', '2박 3일, 우룽 왕복 및 관광 포함'),
    mapAsset: Assets.mapRegion,
    image: Assets.cableway,
    steps: [
      L('长江索道', '장강 케이블카'),
      L('南山', '난산'),
      L('武隆天生三桥', '우룽 천생삼교'),
      L('仙女山', '선녀산'),
      L('洪崖洞', '홍야동'),
    ],
    pins: [
      Offset(.42, .55),
      Offset(.46, .61),
      Offset(.58, .64),
      Offset(.86, .68),
      Offset(.43, .55),
    ],
    suggestion: L(
      '适合时间充裕、想把城市景观和周边自然风光一起体验的人。武隆景区游览建议预留3-5小时，往返交通需单独安排。',
      '도시 풍경과 근교 자연을 함께 보고 싶은 여행자에게 좋습니다. 우룽 관광은 3-5시간 정도를 잡는 것이 좋습니다.',
    ),
  ),
  RoutePlan(
    title: L('世界遗产周边游', '세계유산 근교 코스'),
    category: S.nearby,
    badge: S.nearby,
    scenes: L('5个景点', '명소 5곳'),
    duration: L('约9-10小时，含大足往返与石刻游览', '약 9-10시간, 다쭈 왕복 및 관람 포함'),
    mapAsset: Assets.mapRegion,
    image: Assets.dazuDetail,
    steps: [
      L('重庆主城', '충칭 도심'),
      L('大足石刻', '다쭈 석각'),
      L('宝顶山', '보정산'),
      L('北山石刻', '북산 석각'),
      L('返回主城', '도심 복귀'),
    ],
    pins: [
      Offset(.42, .55),
      Offset(.20, .40),
      Offset(.18, .38),
      Offset(.20, .36),
      Offset(.42, .55),
    ],
    suggestion: L(
      '适合喜欢历史文化和石窟艺术的游客。大足距主城较远，建议早出发，按约1.5小时单程交通和石刻游览时间规划。',
      '역사 문화와 석굴 예술을 좋아하는 여행자에게 좋습니다. 다쭈는 도심에서 떨어져 있어 아침 일찍 출발하는 것이 좋습니다.',
    ),
  ),
];

class TravelShell extends StatefulWidget {
  const TravelShell({super.key});

  @override
  State<TravelShell> createState() => _TravelShellState();
}

class _TravelShellState extends State<TravelShell> {
  int _currentIndex = 0;
  AppLanguage _language = AppLanguage.zh;

  void _toggleLanguage() {
    setState(() {
      _language = _language == AppLanguage.zh ? AppLanguage.ko : AppLanguage.zh;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            HomePage(language: _language, onToggleLanguage: _toggleLanguage),
            AttractionsPage(language: _language),
            FoodPage(language: _language),
            RoutesPage(language: _language),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        height: 68,
        indicatorColor: AppColors.primary.withValues(alpha: 0.12),
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: S.home.of(_language),
          ),
          NavigationDestination(
            icon: const Icon(Icons.landscape_outlined),
            selectedIcon: const Icon(Icons.landscape),
            label: S.attractions.of(_language),
          ),
          NavigationDestination(
            icon: const Icon(Icons.ramen_dining_outlined),
            selectedIcon: const Icon(Icons.ramen_dining),
            label: S.food.of(_language),
          ),
          NavigationDestination(
            icon: const Icon(Icons.map_outlined),
            selectedIcon: const Icon(Icons.map),
            label: S.travel.of(_language),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.language,
    required this.onToggleLanguage,
  });

  final AppLanguage language;
  final VoidCallback onToggleLanguage;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
      children: [
        _HomeHeader(language: language, onToggleLanguage: onToggleLanguage),
        const SizedBox(height: 18),
        _HeroCard(language: language),
        const SizedBox(height: 24),
        PlainSectionTitle(S.intro.of(language)),
        const SizedBox(height: 10),
        _IntroCard(
          language: language,
          onTap: () => _showHistoryDialog(context, language),
        ),
        const SizedBox(height: 22),
        PlainSectionTitle(S.hotAttractions.of(language)),
        const SizedBox(height: 12),
        SizedBox(
          height: 128,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = attractions[index];
              return _MiniImageCard(
                title: item.name.of(language),
                subtitle: item.area.of(language),
                image: item.image,
                onTap: () => _openAttraction(context, item, language),
              );
            },
          ),
        ),
        const SizedBox(height: 22),
        PlainSectionTitle(S.specialFood.of(language)),
        const SizedBox(height: 12),
        SizedBox(
          height: 104,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) =>
                _FoodBubble(item: foods[index], language: language),
          ),
        ),
        const SizedBox(height: 22),
        PlainSectionTitle(S.travelRecommend.of(language)),
        const SizedBox(height: 12),
        SizedBox(
          height: 148,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: routes.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) =>
                _HomeRouteCard(route: routes[index], language: language),
          ),
        ),
      ],
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({required this.language, required this.onToggleLanguage});

  final AppLanguage language;
  final VoidCallback onToggleLanguage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    L('重庆', '충칭').of(language),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.ink,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.location_on,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Text(
                S.cloudy.of(language),
                style: const TextStyle(color: AppColors.muted, fontSize: 13),
              ),
            ],
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 18,
                color: Colors.black.withValues(alpha: 0.08),
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: IconButton(
            tooltip: language == AppLanguage.zh ? '切换韩文' : '중국어로 전환',
            onPressed: onToggleLanguage,
            icon: Text(
              language == AppLanguage.zh ? '한' : '中',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.language});

  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 304,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            blurRadius: 24,
            color: const Color(0xff0c1530).withValues(alpha: 0.18),
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Assets.hongya, fit: BoxFit.cover),
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x88081a3a),
                  Color(0x11081a3a),
                  Color(0xaa081a3a),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    S.heroBadge.of(language),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  S.heroTitle.of(language),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  S.heroSub.of(language),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IntroCard extends StatelessWidget {
  const _IntroCard({required this.language, required this.onTap});

  final AppLanguage language;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  S.introShort.of(language),
                  style: const TextStyle(
                    height: 1.55,
                    color: Color(0xff3f4756),
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  Assets.route,
                  width: 78,
                  height: 92,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttractionsPage extends StatefulWidget {
  const AttractionsPage({super.key, required this.language});

  final AppLanguage language;

  @override
  State<AttractionsPage> createState() => _AttractionsPageState();
}

class _AttractionsPageState extends State<AttractionsPage> {
  L _selectedCategory = S.all;

  List<Attraction> get _visibleAttractions {
    if (_selectedCategory == S.all) return attractions;
    return attractions
        .where((item) => item.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    const categories = [
      S.all,
      S.popular,
      S.nature,
      S.culture,
      S.checkin,
      S.landmark,
    ];
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
      children: [
        PageHeader(
          icon: Icons.landscape,
          iconColor: AppColors.blue,
          title: S.attractions.of(widget.language),
          subtitle: S.attractionSub.of(widget.language),
        ),
        const SizedBox(height: 16),
        FilterBar(
          categories: categories,
          selected: _selectedCategory,
          language: widget.language,
          onSelected: (value) => setState(() => _selectedCategory = value),
        ),
        const SizedBox(height: 16),
        ..._visibleAttractions.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: AttractionTile(
              item: item,
              language: widget.language,
              onTap: () => _openAttraction(context, item, widget.language),
            ),
          ),
        ),
      ],
    );
  }
}

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.language});

  final AppLanguage language;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  L _selectedCategory = S.all;

  List<FoodItem> get _visibleFoods {
    if (_selectedCategory == S.all) return foods;
    return foods.where((item) => item.category == _selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    const categories = [
      S.all,
      S.hotpotJianghu,
      S.noodleSnack,
      S.nightMarket,
      S.dessertDrink,
    ];
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
      children: [
        PageHeader(
          icon: Icons.ramen_dining,
          iconColor: AppColors.primary,
          title: S.food.of(widget.language),
          subtitle: S.foodSub.of(widget.language),
        ),
        const SizedBox(height: 16),
        FilterBar(
          categories: categories,
          selected: _selectedCategory,
          language: widget.language,
          onSelected: (value) => setState(() => _selectedCategory = value),
        ),
        const SizedBox(height: 12),
        ..._visibleFoods.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 13),
            child: FoodTile(
              item: item,
              language: widget.language,
              onTap: () => _openFood(context, item, widget.language),
            ),
          ),
        ),
      ],
    );
  }
}

class RoutesPage extends StatefulWidget {
  const RoutesPage({super.key, required this.language});

  final AppLanguage language;

  @override
  State<RoutesPage> createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  L _selectedCategory = S.all;

  List<RoutePlan> get _visibleRoutes {
    if (_selectedCategory == S.all) return routes;
    return routes
        .where((route) => route.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    const categories = [S.all, S.oneDay, S.twoDay, S.threeDay, S.nearby];
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
      children: [
        PageHeader(
          icon: Icons.map,
          iconColor: AppColors.orange,
          title: S.routeTitle.of(widget.language),
          subtitle: S.routeSub.of(widget.language),
        ),
        const SizedBox(height: 16),
        FilterBar(
          categories: categories,
          selected: _selectedCategory,
          language: widget.language,
          onSelected: (value) => setState(() => _selectedCategory = value),
        ),
        const SizedBox(height: 16),
        ..._visibleRoutes.map(
          (route) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: RouteCard(
              route: route,
              language: widget.language,
              onTap: () => _openRoute(context, route, widget.language),
            ),
          ),
        ),
      ],
    );
  }
}

class AttractionDetailPage extends StatelessWidget {
  const AttractionDetailPage({
    super.key,
    required this.item,
    required this.language,
  });

  final Attraction item;
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return DetailScaffold(
      title: item.name.of(language),
      image: item.image,
      children: [
        _MetaRow(
          items: [
            '${S.rating.of(language)} ${item.rating}',
            item.area.of(language),
            item.category.of(language),
          ],
        ),
        const SizedBox(height: 18),
        DetailSection(
          title: S.attractionIntro.of(language),
          body: item.detail.of(language),
        ),
        DetailSection(
          title: S.reason.of(language),
          body: item.reason.of(language),
        ),
      ],
    );
  }
}

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({super.key, required this.item, required this.language});

  final FoodItem item;
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return DetailScaffold(
      title: item.name.of(language),
      image: item.image,
      children: [
        _MetaRow(
          items: [
            '${S.rating.of(language)} ${item.rating}',
            item.category.of(language),
            item.heat == 0
                ? S.cool.of(language)
                : '${S.spicy.of(language)} ${item.heat}/5',
          ],
        ),
        const SizedBox(height: 18),
        DetailSection(
          title: S.taste.of(language),
          body: item.detail.of(language),
        ),
        DetailSection(
          title: S.pairing.of(language),
          body: item.pairing.of(language),
        ),
        DetailSection(
          title: S.suitable.of(language),
          body: item.suitableFor.of(language),
        ),
      ],
    );
  }
}

class RouteDetailPage extends StatelessWidget {
  const RouteDetailPage({
    super.key,
    required this.route,
    required this.language,
  });

  final RoutePlan route;
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return DetailScaffold(
      title: route.title.of(language),
      image: route.image,
      children: [
        _MetaRow(
          items: [
            '${S.duration.of(language)} ${route.duration.of(language)}',
            route.scenes.of(language),
            '${S.routeType.of(language)} ${route.category.of(language)}',
          ],
        ),
        const SizedBox(height: 18),
        DetailSection(
          title: S.routeAdvice.of(language),
          body: route.suggestion.of(language),
        ),
        const SizedBox(height: 6),
        Text(
          S.mapTitle.of(language),
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 12),
        RouteMapCard(route: route, language: language),
        const SizedBox(height: 18),
        Text(
          S.stepsTitle.of(language),
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w900,
            color: AppColors.ink,
          ),
        ),
        const SizedBox(height: 10),
        ...route.steps.asMap().entries.map(
          (entry) =>
              _StepTile(index: entry.key + 1, label: entry.value.of(language)),
        ),
      ],
    );
  }
}

class DetailScaffold extends StatelessWidget {
  const DetailScaffold({
    super.key,
    required this.title,
    required this.image,
    required this.children,
  });

  final String title;
  final String image;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 26),
          children: [
            Row(
              children: [
                IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.ink,
                  ),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(image, height: 236, fit: BoxFit.cover),
            ),
            const SizedBox(height: 18),
            ...children,
          ],
        ),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 31),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: AppColors.ink,
              ),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.muted,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PlainSectionTitle extends StatelessWidget {
  const PlainSectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: AppColors.ink,
      ),
    );
  }
}

class FilterBar extends StatelessWidget {
  const FilterBar({
    super.key,
    required this.categories,
    required this.selected,
    required this.language,
    required this.onSelected,
  });

  final List<L> categories;
  final L selected;
  final AppLanguage language;
  final ValueChanged<L> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          return _FilterChipButton(
            label: category.of(language),
            active: category == selected,
            onTap: () => onSelected(category),
          );
        },
      ),
    );
  }
}

class AttractionTile extends StatelessWidget {
  const AttractionTile({
    super.key,
    required this.item,
    required this.language,
    required this.onTap,
  });

  final Attraction item;
  final AppLanguage language;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _ListTileShell(
      onTap: onTap,
      image: item.image,
      title: item.name.of(language),
      subtitle: item.subtitle.of(language),
      footer: Row(
        children: [
          const Icon(Icons.star, color: Color(0xffffb000), size: 16),
          const SizedBox(width: 3),
          Text(
            '${item.rating}',
            style: const TextStyle(
              color: Color(0xffff9900),
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              item.area.of(language),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.muted, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.item,
    required this.language,
    required this.onTap,
  });

  final FoodItem item;
  final AppLanguage language;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _ListTileShell(
      onTap: onTap,
      image: item.image,
      title: item.name.of(language),
      subtitle: item.subtitle.of(language),
      imageWidth: 86,
      imageHeight: 74,
      footer: Row(
        children: [
          if (item.heat == 0)
            Text(
              S.cool.of(language),
              style: const TextStyle(
                color: AppColors.teal,
                fontWeight: FontWeight.w800,
                fontSize: 12,
              ),
            )
          else
            ...List.generate(
              item.heat,
              (_) => const Icon(
                Icons.local_fire_department,
                size: 15,
                color: AppColors.primary,
              ),
            ),
          const Spacer(),
          const Icon(Icons.star, color: Color(0xffffb000), size: 15),
          const SizedBox(width: 3),
          Text(
            '${item.rating}',
            style: const TextStyle(
              color: Color(0xffff9900),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListTileShell extends StatelessWidget {
  const _ListTileShell({
    required this.onTap,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.footer,
    this.imageWidth = 112,
    this.imageHeight = 88,
  });

  final VoidCallback onTap;
  final String image;
  final String title;
  final String subtitle;
  final Widget footer;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset(
                  image,
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: AppColors.muted),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    footer,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RouteCard extends StatelessWidget {
  const RouteCard({
    super.key,
    required this.route,
    required this.language,
    required this.onTap,
  });

  final RoutePlan route;
  final AppLanguage language;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 178,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              blurRadius: 16,
              color: Colors.black.withValues(alpha: 0.12),
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(route.image, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x55000000), Color(0xbb071020)],
                ),
              ),
            ),
            Positioned(
              top: 14,
              right: 14,
              child: _Badge(label: route.badge.of(language)),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    route.title.of(language),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    route.steps.map((e) => e.of(language)).join(' → '),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 6,
                          children: [
                            _RouteMeta(
                              icon: Icons.schedule,
                              label: route.duration.of(language),
                            ),
                            _RouteMeta(
                              icon: Icons.groups_2_outlined,
                              label: route.scenes.of(language),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          minimumSize: const Size(58, 32),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: onTap,
                        child: Text(
                          S.detail.of(language),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeRouteCard extends StatelessWidget {
  const _HomeRouteCard({required this.route, required this.language});

  final RoutePlan route;
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openRoute(context, route, language),
      child: Container(
        width: 230,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(route.image, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xbb000000)],
                ),
              ),
            ),
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Text(
                route.title.of(language),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: _Badge(label: route.badge.of(language)),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniImageCard extends StatelessWidget {
  const _MiniImageCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 112,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(17)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xcc000000)],
                ),
              ),
            ),
            Positioned(
              left: 10,
              right: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FoodBubble extends StatelessWidget {
  const _FoodBubble({required this.item, required this.language});

  final FoodItem item;
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openFood(context, item, language),
      child: SizedBox(
        width: 82,
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                item.image,
                width: 66,
                height: 66,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.name.of(language),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChipButton extends StatelessWidget {
  const _FilterChipButton({
    required this.label,
    required this.active,
    required this.onTap,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: active ? AppColors.primary : Colors.white,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: onTap,
        child: Container(
          height: 36,
          constraints: const BoxConstraints(minWidth: 58),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: active ? AppColors.primary : AppColors.line,
            ),
          ),
          child: Text(
            label,
            maxLines: 1,
            style: TextStyle(
              color: active ? Colors.white : AppColors.ink,
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _RouteMeta extends StatelessWidget {
  const _RouteMeta({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 16),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class DetailSection extends StatelessWidget {
  const DetailSection({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w900,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: const TextStyle(
              fontSize: 14,
              height: 1.6,
              color: Color(0xff3f4756),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items
          .asMap()
          .entries
          .map(
            (entry) => _FilterChipButton(
              label: entry.value,
              active: entry.key == 0,
              onTap: () {},
            ),
          )
          .toList(),
    );
  }
}

class RouteMapCard extends StatelessWidget {
  const RouteMapCard({super.key, required this.route, required this.language});

  final RoutePlan route;
  final AppLanguage language;

  @override
  Widget build(BuildContext context) {
    final mapAspect = _mapAspectFor(route.mapAsset);
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardHeight = (constraints.maxWidth / mapAspect).clamp(
          270.0,
          420.0,
        );
        final viewport = _routeViewportFor(
          route.pins,
          mapAspect,
          constraints.maxWidth / cardHeight,
        );
        final mapWidth = constraints.maxWidth / viewport.width;
        final mapHeight = mapWidth / mapAspect;
        return Container(
          height: cardHeight,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: AppColors.line),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRect(
                child: Transform.translate(
                  offset: Offset(
                    -viewport.left * mapWidth,
                    -viewport.top * mapHeight,
                  ),
                  child: SizedBox(
                    width: mapWidth,
                    height: mapHeight,
                    child: Image.asset(route.mapAsset, fit: BoxFit.fill),
                  ),
                ),
              ),
              CustomPaint(
                painter: RouteOverlayPainter(
                  route.pins,
                  route.steps.map((step) => step.of(language)).toList(),
                  viewport,
                ),
              ),
              Positioned(
                left: 10,
                right: 10,
                bottom: 34,
                child: Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: route.steps.asMap().entries.map((entry) {
                    final active = entry.key == 0;
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: active ? AppColors.primary : Colors.white,
                        borderRadius: BorderRadius.circular(999),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.12),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Text(
                        '${entry.key + 1}. ${entry.value.of(language)}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: active ? Colors.white : AppColors.ink,
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class RouteOverlayPainter extends CustomPainter {
  RouteOverlayPainter(this.pins, this.labels, this.viewport);

  final List<Offset> pins;
  final List<String> labels;
  final Rect viewport;

  @override
  void paint(Canvas canvas, Size size) {
    if (pins.isEmpty) return;
    final points = pins
        .map(
          (pin) => Offset(
            (pin.dx - viewport.left) / viewport.width * size.width,
            (pin.dy - viewport.top) / viewport.height * size.height,
          ),
        )
        .toList();
    final routeShadowPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.95)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final linePaint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 4.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (final point in points.skip(1)) {
      path.lineTo(point.dx, point.dy);
    }
    canvas.drawPath(path, routeShadowPaint);
    canvas.drawPath(path, linePaint);
    for (var i = 0; i < points.length; i++) {
      final point = points[i];
      _paintRoutePin(canvas, point, i);
      if (i < labels.length) {
        _paintPinLabel(canvas, size, point, labels[i], i);
      }
      if (i > 0) {
        final prev = points[i - 1];
        final mid = Offset((prev.dx + point.dx) / 2, (prev.dy + point.dy) / 2);
        final angle = (point - prev).direction;
        final arrow = Path()
          ..moveTo(mid.dx + 8 * mathCos(angle), mid.dy + 8 * mathSin(angle))
          ..lineTo(
            mid.dx - 7 * mathCos(angle - .45),
            mid.dy - 7 * mathSin(angle - .45),
          )
          ..moveTo(mid.dx + 8 * mathCos(angle), mid.dy + 8 * mathSin(angle))
          ..lineTo(
            mid.dx - 7 * mathCos(angle + .45),
            mid.dy - 7 * mathSin(angle + .45),
          );
        canvas.drawPath(arrow, linePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant RouteOverlayPainter oldDelegate) =>
      oldDelegate.pins != pins ||
      oldDelegate.labels != labels ||
      oldDelegate.viewport != viewport;

  void _paintRoutePin(Canvas canvas, Offset point, int index) {
    final pinCenter = point - const Offset(0, 21);
    final pinPath = Path()
      ..moveTo(pinCenter.dx, pinCenter.dy + 25)
      ..cubicTo(
        pinCenter.dx - 13,
        pinCenter.dy + 10,
        pinCenter.dx - 18,
        pinCenter.dy + 4,
        pinCenter.dx - 18,
        pinCenter.dy - 5,
      )
      ..cubicTo(
        pinCenter.dx - 18,
        pinCenter.dy - 17,
        pinCenter.dx - 10,
        pinCenter.dy - 25,
        pinCenter.dx,
        pinCenter.dy - 25,
      )
      ..cubicTo(
        pinCenter.dx + 10,
        pinCenter.dy - 25,
        pinCenter.dx + 18,
        pinCenter.dy - 17,
        pinCenter.dx + 18,
        pinCenter.dy - 5,
      )
      ..cubicTo(
        pinCenter.dx + 18,
        pinCenter.dy + 4,
        pinCenter.dx + 13,
        pinCenter.dy + 10,
        pinCenter.dx,
        pinCenter.dy + 25,
      )
      ..close();
    canvas.drawPath(
      pinPath.shift(const Offset(0, 2)),
      Paint()..color = Colors.black.withValues(alpha: 0.18),
    );
    canvas.drawPath(
      pinPath,
      Paint()..color = index == 0 ? AppColors.primary : AppColors.orange,
    );
    canvas.drawCircle(pinCenter, 8, Paint()..color = Colors.white);
    canvas.drawCircle(
      pinCenter,
      4.5,
      Paint()..color = index == 0 ? AppColors.primary : AppColors.orange,
    );
  }

  void _paintPinLabel(
    Canvas canvas,
    Size size,
    Offset point,
    String label,
    int index,
  ) {
    final painter = TextPainter(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          color: AppColors.ink,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 2,
      ellipsis: '...',
    )..layout(maxWidth: 92);
    var labelOffset =
        point + Offset(index.isEven ? 28 : -painter.width - 36, -48);
    labelOffset = Offset(
      labelOffset.dx.clamp(8, size.width - painter.width - 16),
      labelOffset.dy.clamp(8, size.height - painter.height - 12),
    );
    final rect = Rect.fromLTWH(
      labelOffset.dx - 6,
      labelOffset.dy - 4,
      painter.width + 12,
      painter.height + 8,
    );
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(8));
    canvas.drawRRect(
      rrect.shift(const Offset(0, 1.5)),
      Paint()..color = Colors.black.withValues(alpha: 0.12),
    );
    canvas.drawRRect(
      rrect,
      Paint()..color = Colors.white.withValues(alpha: 0.94),
    );
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = AppColors.primary.withValues(alpha: 0.22)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
    painter.paint(canvas, labelOffset);
  }
}

double _mapAspectFor(String asset) =>
    asset == Assets.mapCoreCity ? 1969 / 2303 : 683 / 542;

Rect _routeViewportFor(List<Offset> pins, double mapAspect, double cardAspect) {
  if (pins.isEmpty) return const Rect.fromLTWH(0, 0, 1, 1);
  var left = pins.first.dx;
  var right = pins.first.dx;
  var top = pins.first.dy;
  var bottom = pins.first.dy;
  for (final pin in pins.skip(1)) {
    if (pin.dx < left) left = pin.dx;
    if (pin.dx > right) right = pin.dx;
    if (pin.dy < top) top = pin.dy;
    if (pin.dy > bottom) bottom = pin.dy;
  }

  const padding = 0.24;
  left -= padding;
  right += padding;
  top -= padding;
  bottom += padding;

  var width = (right - left).clamp(0.52, 1.0);
  var height = (bottom - top).clamp(0.52, 1.0);
  final viewportAspect = cardAspect / mapAspect;
  if (width / height > viewportAspect) {
    height = (width / viewportAspect).clamp(height, 1.0);
  } else {
    width = (height * viewportAspect).clamp(width, 1.0);
  }

  final centerX = ((left + right) / 2).clamp(width / 2, 1 - width / 2);
  final centerY = ((top + bottom) / 2).clamp(height / 2, 1 - height / 2);
  return Rect.fromCenter(
    center: Offset(centerX, centerY),
    width: width,
    height: height,
  );
}

double mathCos(double value) => _math.cos(value);
double mathSin(double value) => _math.sin(value);

class _MathProxy {
  const _MathProxy();
  double cos(double value) => _cos(value);
  double sin(double value) => _sin(value);
}

const _math = _MathProxy();

// Tiny polynomial wrappers keep this app dependency-free for route arrows.
double _cos(double x) {
  const pi = 3.1415926535897932;
  x = ((x + pi) % (2 * pi)) - pi;
  final x2 = x * x;
  return 1 - x2 / 2 + x2 * x2 / 24 - x2 * x2 * x2 / 720;
}

double _sin(double x) {
  const pi = 3.1415926535897932;
  x = ((x + pi) % (2 * pi)) - pi;
  final x2 = x * x;
  return x - x * x2 / 6 + x * x2 * x2 / 120 - x * x2 * x2 * x2 / 5040;
}

class _StepTile extends StatelessWidget {
  const _StepTile({required this.index, required this.label});

  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            child: Text('$index'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}

void _openAttraction(
  BuildContext context,
  Attraction item,
  AppLanguage language,
) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => AttractionDetailPage(item: item, language: language),
    ),
  );
}

void _openFood(BuildContext context, FoodItem item, AppLanguage language) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => FoodDetailPage(item: item, language: language),
    ),
  );
}

void _openRoute(BuildContext context, RoutePlan route, AppLanguage language) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => RouteDetailPage(route: route, language: language),
    ),
  );
}

void _showHistoryDialog(BuildContext context, AppLanguage language) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Text(
          S.historyTitle.of(language),
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        content: SingleChildScrollView(
          child: Text(
            S.historyBody.of(language),
            style: const TextStyle(
              height: 1.6,
              fontSize: 14,
              color: Color(0xff3f4756),
            ),
          ),
        ),
        actions: [
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () => Navigator.pop(context),
            child: Text(S.gotIt.of(language)),
          ),
        ],
      );
    },
  );
}
