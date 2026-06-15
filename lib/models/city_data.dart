// ══════════════════════════════════════════════════════════════════
// 数据模型
// ══════════════════════════════════════════════════════════════════

/// 旅游景点
class TouristSpot {
  final String name;
  final String type; // 牡丹赏花 / 历史人文 / 自然生态 / 文化体验
  final String level; // AAAA / AAA 等
  final String location;
  final String description;
  final String highlight;
  const TouristSpot({
    required this.name,
    required this.type,
    required this.level,
    required this.location,
    required this.description,
    required this.highlight,
  });
}

/// 美食
class FoodItem {
  final String name;
  final String category; // 名菜 / 小吃 / 早餐 / 特产
  final String origin;
  final String description;
  final String tip;
  const FoodItem({
    required this.name,
    required this.category,
    required this.origin,
    required this.description,
    required this.tip,
  });
}

/// 路线停靠点
class RouteStop {
  final String label;
  const RouteStop({required this.label});
}

/// 推荐路线
class RouteData {
  final String title;
  final String description;
  final String duration;
  final List<RouteStop> stops;
  const RouteData({
    required this.title,
    required this.description,
    required this.duration,
    required this.stops,
  });
}

/// 城市数据模型
class CityData {
  final int id;
  final String name;
  final String province;
  final String score;
  final String desc;
  final List<String> tags;
  final String image;
  final String detail;
  final String shortDesc;
  final List<TouristSpot> spots;
  final List<FoodItem> foods;
  final List<RouteData> routes;
  final List<Map<String, String>> tips;

  const CityData({
    required this.id,
    required this.name,
    required this.province,
    required this.score,
    required this.desc,
    required this.tags,
    required this.image,
    required this.detail,
    required this.shortDesc,
    this.spots = const [],
    this.foods = const [],
    this.routes = const [],
    this.tips = const [],
  });
}

// ══════════════════════════════════════════════════════════════════
// 菏泽真实数据
// ══════════════════════════════════════════════════════════════════

const CityData hezeCity = CityData(
  id: 1,
  name: '菏泽',
  province: '山东省',
  score: '4.8',
  desc: '牡丹之都 黄河入鲁第一站',
  shortDesc: '把菏泽的牡丹、古城、美食和黄河风物串成可执行的旅行计划。',
  tags: ['# 曹州牡丹园', '# 曹州古城', '# 单县羊汤', '# 水浒好汉城'],
  image: 'assets/img1.jpg',
  detail:
      '菏泽古称曹州，位于山东省西南部，是著名的"中国牡丹之都"。牡丹栽培始于隋朝，兴于唐宋，盛于明清，至今已有1500余年历史。全市牡丹种植面积1600余亩，拥有9大色系、10大花型、1308个品种，是世界上面积最大、品种最多的牡丹观赏基地。'
      '\n\n菏泽也是黄河入鲁的第一站，黄河文化深厚。这里人杰地灵，是军事家孙膑、吴起的故里，水浒文化的重要发源地。曹州古城保留了大量明清建筑风貌，水巷交错，古韵悠然。'
      '\n\n2012年，中国花卉协会正式命名菏泽为"中国牡丹之都"。每年4月举办的世界牡丹大会吸引数百万中外游客。牡丹籽油、牡丹化妆品等深加工产品远销30多个国家和地区，牡丹产业链综合产值突破130亿元。',

  // ── 旅游景点 ──
  spots: [
    TouristSpot(
      name: '曹州牡丹园',
      type: '牡丹赏花',
      level: 'AAAA',
      location: '牡丹区人民路1000号',
      description:
          '世界面积最大、品种最多的牡丹园，占地1600亩，牡丹品种1280余个、总量80万株。园内有国花魂雕塑、国花馆（牡丹博物馆）、观花楼、天香阁等39个景点。每年4月盛花期，九大色系十大花型竞相绽放，蔚为壮观。',
      highlight: '4月中旬盛花期，千亩花海同时绽放',
    ),
    TouristSpot(
      name: '水浒好汉城',
      type: '历史人文',
      level: 'AAAA',
      location: '郓城县西门街',
      description:
          '以水浒文化为主题的大型景区，占地600余亩，拥有36座院落、72个景观、108个景点。可观看水浒情景剧实景演出、体验传统武术表演、穿汉服拍照打卡，沉浸式感受"梁山好汉"的侠义世界。',
      highlight: '实景水浒情景剧 + 武术表演',
    ),
    TouristSpot(
      name: '孙膑旅游城·亿城寺',
      type: '历史人文',
      level: 'AAAA',
      location: '鄄城县箕山镇',
      description:
          '全国最大的孙膑文化主题园区，集兵家文化、佛教文化于一体。主要景点有孙膑纪念馆、亿城寺、将军碑林等，是了解战国军事家孙膑"围魏救赵"等兵家智慧的最佳去处。',
      highlight: '全国最大孙膑文化主题园',
    ),
    TouristSpot(
      name: '单县浮龙湖生态旅游区',
      type: '自然生态',
      level: 'AAAA',
      location: '单县浮岗镇',
      description:
          '被誉为"江北西湖""故道明珠"，水面3万多亩，是鲁西南最大的生态湖泊。可乘船游湖、环湖骑行、观鸟摄影，湖光山色四季如画，是休闲度假的理想之地。',
      highlight: '3万亩水面，可乘船、骑行、观鸟',
    ),
    TouristSpot(
      name: '曹县黄河故道湿地风景区',
      type: '自然生态',
      level: 'AAAA',
      location: '曹县',
      description:
          '以黄河故道湿地为特色，拥有万亩荷花、万亩稻田、万亩湿地的壮丽景观。八大主题景点涵盖生态观光、科普教育、农事体验，夏季荷花盛开时节尤为壮观。',
      highlight: '万亩荷花，夏季最佳',
    ),
    TouristSpot(
      name: '老城曹州',
      type: '历史人文',
      level: 'AAA',
      location: '牡丹区中华西路',
      description:
          '菏泽老城记忆的文化街区，省级旅游休闲街区。集美食小吃、非遗展示、文化表演、夜景灯光于一体。曹州芝麻饼、面塑等非遗技艺可现场体验，夜晚灯光璀璨，适合休闲漫步。',
      highlight: '省级旅游休闲街区，非遗体验',
    ),
    TouristSpot(
      name: '前王庄石头寨',
      type: '历史人文',
      level: 'AAA',
      location: '巨野县核桃园镇',
      description:
          '拥有500多年历史的国家级传统古村落，现存100多栋明清时期石头建筑。石墙石瓦、石碾石磨，宛若一座石头的博物馆，是摄影爱好者和古建筑迷的天堂。',
      highlight: '500年明清石头古村落',
    ),
    TouristSpot(
      name: '巨野县书画院',
      type: '文化体验',
      level: 'AAA',
      location: '巨野县城',
      description:
          '工笔牡丹画的发源地，免费向公众开放。可近距离观赏工笔牡丹画的创作过程，了解菏泽书画文化，购买牡丹主题文创产品作为伴手礼。',
      highlight: '工笔牡丹画发源地，免费参观',
    ),
  ],

  // ── 美食 ──
  foods: [
    FoodItem(
      name: '单县羊肉汤',
      category: '名菜',
      origin: '单县',
      description:
          '"中华第一汤"，《中华名食谱》唯一以汤食入选的名吃。选用鲁西南青山羊，骨肉同熬，汤白如乳、鲜而不膻、香而不腻。已有200余年历史，被列入国家级非物质文化遗产。',
      tip: '配吊炉烧饼或千层饼，趁热喝最香',
    ),
    FoodItem(
      name: '曹县烧牛肉',
      category: '名菜',
      origin: '曹县',
      description:
          '选用鲁西南黄牛为原料，百年老汤卤制，色泽红润、肉质细嫩、醇香可口。清代曾作为贡品进献朝廷，冷切薄片夹烧饼吃最为地道，是菏泽人待客的必备硬菜。',
      tip: '切薄片夹烧饼，冷吃更香',
    ),
    FoodItem(
      name: '郓城壮馍',
      category: '名菜',
      origin: '郓城县',
      description:
          '直径约30-50厘米的千层厚肉饼，外皮金黄酥脆，内馅为牛肉或羊肉配鸡蛋、粉条，鲜而不膻、外焦里嫩。油炸而成，一份够两三人吃，配糊粥是绝配。',
      tip: '趁热吃外酥里嫩，配糊粥最佳',
    ),
    FoodItem(
      name: '曹县蒸碗',
      category: '名菜',
      origin: '曹县',
      description:
          '山东省非物质文化遗产，有蒸蹄子、蒸牛肉、蒸扣肉、蒸鸡块等20多个品种。宴席压轴菜，肉质酥烂入味、汤汁浓郁，是菏泽人逢年过节和红白喜事的必备菜式。',
      tip: '推荐蒸蹄子和蒸扣肉，下饭神器',
    ),
    FoodItem(
      name: '面泡',
      category: '早餐',
      origin: '牡丹区',
      description:
          '菏泽早餐的灵魂代表，用发面制成小团入油锅炸，外皮金黄酥脆、内里蓬松软嫩，形似小球。单吃已很香，泡胡辣汤或蘸豆汁更是一绝，每个菏泽人的童年味道。',
      tip: '泡胡辣汤吃，菏泽人标配早餐',
    ),
    FoodItem(
      name: '白家水煎包',
      category: '小吃',
      origin: '牡丹区',
      description:
          '菏泽老字号名吃，已有近百年历史。底部煎至金黄焦脆，上面雪白松软，分牛肉馅和素馅两种。外焦里嫩、鲜香味美，是菏泽人从小吃到大的味道。',
      tip: '趁热吃底脆馅香，蘸醋更提味',
    ),
    FoodItem(
      name: '定陶烧鸡',
      category: '名菜',
      origin: '定陶区',
      description:
          '400多年历史的传统名吃，选用散养土鸡，经腌、煮、熏等多道工序制成。色泽金黄诱人，皮酥肉烂、骨肉分离、香味浓郁，冷热皆可食用，是走亲访友的佳品。',
      tip: '黄家柴烧鸡最正宗，可真空带走',
    ),
    FoodItem(
      name: '巨野罐子汤',
      category: '小吃',
      origin: '巨野县',
      description:
          '以羊骨、羊杂为主料，加粉条、葱花等熬制的浓汤。因盛在陶罐中而得名，汤浓料足、香气袭人，一碗下肚暖到心底，是鲁西南地区的特色早餐。',
      tip: '配烧饼吃，冬天喝最暖身',
    ),
    FoodItem(
      name: '东明香肚',
      category: '名菜',
      origin: '东明县',
      description:
          '山东省级非物质文化遗产，以猪肚包裹猪后腿肉与秘制香料精心熏制。切开后色泽红润、浓香扑鼻、Q弹咸香，是菏泽人过年餐桌上的必备冷盘。',
      tip: '切片冷食，过年必上桌',
    ),
    FoodItem(
      name: '曹州烧饼',
      category: '早餐',
      origin: '牡丹区',
      description:
          '国家级非遗技艺，由发面、烫面、油面混合制成，层次多、芝麻多。盖香、芯软、底酥，刚出炉时香气四溢，是菏泽最朴实的街头美味。',
      tip: '刚出炉直接吃，夹烧牛肉更香',
    ),
  ],

  // ── 旅行路线 ──
  routes: [
    RouteData(
      title: '牡丹花城经典一日游',
      description: '春季最佳。上午赏国色天香，下午漫步古城，晚上品尝地道羊汤。',
      duration: '1 天',
      stops: [
        RouteStop(label: '曹州牡丹园（2-3小时），赏千亩花海、登观花楼'),
        RouteStop(label: '中午：单县羊肉汤 + 吊炉烧饼'),
        RouteStop(label: '下午：老城曹州漫步 + 曹州面塑非遗体验'),
        RouteStop(label: '晚餐：曹县烧牛肉 + 郓城壮馍'),
      ],
    ),
    RouteData(
      title: '水浒文化深度两日游',
      description: '适合历史文化爱好者，兼顾牡丹赏花、水浒文化和黄河生态。',
      duration: '2 天',
      stops: [
        RouteStop(label: 'Day1 上午：曹州牡丹园或百花园赏牡丹'),
        RouteStop(label: 'Day1 下午：菏泽市博物馆（元青花、元代古船）'),
        RouteStop(label: 'Day1 傍晚：老城曹州赏夜景 + 地道晚餐'),
        RouteStop(label: 'Day2 上午：郓城水浒好汉城（情景剧+武术）'),
        RouteStop(label: 'Day2 下午：黄河岸边游览或返程'),
      ],
    ),
    RouteData(
      title: '生态休闲慢游路线',
      description: '适合亲子家庭或喜欢自然风光的旅行者，节奏轻松不赶路。',
      duration: '慢游',
      stops: [
        RouteStop(label: '单县浮龙湖（乘船游湖、环湖骑行）'),
        RouteStop(label: '曹县黄河故道湿地（万亩荷花，夏季最佳）'),
        RouteStop(label: '巨野白虎山景区（9D玻璃桥、天池景观）'),
        RouteStop(label: '沿途品尝各区县地道美食'),
      ],
    ),
  ],

  // ── 路线提示 ──
  tips: [
    {
      'title': '最佳季节',
      'content': '牡丹盛花期4月10日-25日；芍药盛花期五一前后；夏季适合湿地湖区避暑，秋冬适合美食文化之旅。',
    },
    {
      'title': '交通指南',
      'content': '高铁直达菏泽东站/菏泽站；菏泽牡丹机场已通航。市区景点打车基本20元内搞定，共享电动车也很方便。',
    },
    {
      'title': '门票参考',
      'content': '曹州牡丹园约60元/人（花期）；水浒好汉城约80元/人；多数博物馆/美术馆凭身份证免费参观。',
    },
    {
      'title': '住宿建议',
      'content': '建议住牡丹区或老城区，交通便利、美食集中。4月花会期间务必提前预订，房源紧张。',
    },
    {
      'title': '伴手礼推荐',
      'content': '牡丹籽油、牡丹糕、牡丹花茶、曹县汉服、工笔牡丹画、巨野书画文创、曹县烧牛肉（真空装）。',
    },
    {
      'title': '花期提醒',
      'content': '赏花季建议早7点前入园避开客流高峰；穿舒适鞋子园区很大；花环可砍价；羊肉汤店辣椒油免费。',
    },
  ],
);

// ══════════════════════════════════════════════════════════════════
// 首页原始 4 城市数据（保持原样）
// ══════════════════════════════════════════════════════════════════

const List<CityData> cities = [
  hezeCity,
  CityData(
    id: 2,
    name: '上海',
    province: '上海市',
    score: '4.8',
    desc: '摩登都市，现代繁华景象',
    shortDesc: '',
    tags: ['# 外滩', '# 南京路'],
    image: 'img2.jpg',
    detail:
        '上海是中国最国际化的都市，外滩的万国建筑群与陆家嘴的摩天大楼交相辉映。南京路步行街繁华热闹，豫园古色古香，夜晚的黄浦江两岸灯火通明，美不胜收。',
  ),
  CityData(
    id: 3,
    name: '成都',
    province: '四川省',
    score: '4.7',
    desc: '休闲慢城，美食熊猫之乡',
    shortDesc: '',
    tags: ['# 大熊猫', '# 宽窄巷子'],
    image: 'img3.jpg',
    detail:
        '成都是西南地区的休闲之都，以大熊猫、火锅和悠闲的生活方式闻名。宽窄巷子保留了清代的街巷风貌，锦里古街充满三国文化气息，这里的人们爱喝茶、爱打麻将，节奏慢而美好。',
  ),
  CityData(
    id: 4,
    name: '西安',
    province: '陕西省',
    score: '4.9',
    desc: '千年古都，大唐不夜城',
    shortDesc: '',
    tags: ['# 大雁塔', '# 兵马俑'],
    image: 'img4.jpg',
    detail:
        '西安是中华文明的重要发祥地，曾是十三朝古都。秦始皇兵马俑被誉为"世界第八大奇迹"，大雁塔见证了玄奘取经的历史。大唐不夜城夜晚流光溢彩，回民街的羊肉泡馍令人回味无穷。',
  ),
];
