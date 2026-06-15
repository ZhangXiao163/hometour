import 'package:flutter/material.dart';
import 'package:hometrour/zaozhuang/ZaoZhuang.dart';
import 'package:hometrour/zaozhuang/animations.dart';
import 'package:hometrour/zaozhuang/i18n.dart';

import 'pages/chongqing_travel_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppLocale.instance,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Travel UI',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: const Color(0xFFF8F9FB),
          ),
          home: TravelHomePage(locale: AppLocale.instance.lang),
        );
      },
    );
  }
}

// ── 城市数据模型 ────────────────────────────────────────────────
class CityData {
  final String name;
  final String score;
  final String desc;
  final List<String> tags;
  final String image;
  final String detail;
  final int id;
  const CityData({
    required this.id,
    required this.name,
    required this.score,
    required this.desc,
    required this.tags,
    required this.image,
    required this.detail,
  });
}

// ── 根据语言返回城市列表 ──────────────────────────────────────────
List<CityData> _buildCities(String l) => [
  CityData(
    id: 1,
    name: I18n.cityNameZaozhuang(l),
    score: '4.9',
    desc: I18n.cityDescZaozhuang(l),
    tags: [l == 'ko' ? '타이얼좡' : '台儿庄', l == 'ko' ? '웨이산호' : '微山湖'],
    image: 'assets/img1.jpg',
    detail: I18n.cityDetailZaozhuang(l),
  ),
  CityData(
    id: 2,
    name: I18n.cityNameShanghai(l),
    score: '4.8',
    desc: I18n.cityDescShanghai(l),
    tags: [l == 'ko' ? '와이탄' : '外滩', l == 'ko' ? '난징루' : '南京路'],
    image: 'assets/img2.jpg',
    detail: I18n.cityDetailShanghai(l),
  ),
  CityData(
    id: 3,
    name: I18n.cityNameChengdu(l),
    score: '4.7',
    desc: I18n.cityDescChengdu(l),
    tags: [l == 'ko' ? '판다' : '大熊猫', l == 'ko' ? '콴자이샹쯔' : '宽窄巷子'],
    image: 'assets/img3.jpg',
    detail: I18n.cityDetailChengdu(l),
  ),
  CityData(
    id: 4,
    name: I18n.cityNameXian(l),
    score: '4.9',
    desc: I18n.cityDescXian(l),
    tags: [l == 'ko' ? '대안탑' : '大雁塔', l == 'ko' ? '병마용' : '兵马俑'],
    image: 'assets/img4.jpg',
    detail: I18n.cityDetailXian(l),
  ),
  CityData(
    id: 5,
    name: l == 'ko' ? '충칭' : '重庆',
    score: '4.9',
    desc: l == 'ko' ? '산성 강도시 8D 여행' : '山城江城 8D魔幻旅行',
    tags: [l == 'ko' ? '홍야동' : '洪崖洞', l == 'ko' ? '장강 케이블카' : '长江索道'],
    image: 'assets/chongqing/hongya_hero.png',
    detail: l == 'ko'
        ? '충칭 여행 2급 화면으로 이동해 명소, 맛집, 추천 코스를 확인합니다.'
        : '进入重庆家乡旅游二级界面，查看景点、美食和推荐路线。',
  ),
];

// ── 主页 ────────────────────────────────────────────────────────
class TravelHomePage extends StatelessWidget {
  final String locale;
  const TravelHomePage({Key? key, required this.locale}) : super(key: key);

  List<CityData> get cities => _buildCities(locale);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              _buildTopSearchBar(),
              const SizedBox(height: 20),
              _buildHeaderTitle(),
              const SizedBox(height: 24),
              _buildCityGrid(context),
              const SizedBox(height: 24),
              _buildExploreMore(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // 1. 顶部搜索栏 + 头像 + 语言切换
  Widget _buildTopSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          // 头像
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFE6A800), width: 2),
            ),
            child: const Icon(Icons.person, color: Color(0xFF7A6A2A), size: 22),
          ),
          const SizedBox(width: 14),
          // 搜索框
          Expanded(
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(21),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Icon(
                    Icons.search_rounded,
                    color: Color(0xFFB0B0B0),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    I18n.searchHint(locale),
                    style: const TextStyle(
                      color: Color(0xFFB0B0B0),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // 语言切换
          GestureDetector(
            onTap: () => AppLocale.instance.toggle(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFD600), Color(0xFFFFB300)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFD600).withOpacity(0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  I18n.langLabel(locale),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 2. 头部标题
  Widget _buildHeaderTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                I18n.headerLine1(locale),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF909090),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                I18n.headerLine2(locale),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ],
          ),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFFF9E0), Color(0xFFFFECB3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.explore_rounded,
              color: Color(0xFFE6A800),
              size: 34,
            ),
          ),
        ],
      ),
    );
  }

  // 3. 城市网格
  Widget _buildCityGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cities.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.74,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        itemBuilder: (context, index) {
          return StaggeredEntrance(
            index: index,
            child: _buildCityCard(context, cities[index]),
          );
        },
      ),
    );
  }

  // 城市卡片
  Widget _buildCityCard(BuildContext context, CityData city) {
    return PressScale(
      onTap: () {
        if (city.id == 1) {
          Navigator.push(
            context,
            SlideUpRoute(page: ZaoZhuang(locale: locale)),
          );
        } else if (city.id == 5) {
          Navigator.push(
            context,
            SlideUpRoute(page: const ChongqingTravelPage()),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: AssetImage(city.image),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            // 渐变遮罩 — 上浅下深
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.75),
                  ],
                  stops: const [0.0, 0.45, 1.0],
                ),
              ),
            ),
            // 评分角标 — 左上
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Color(0xFFFFB300),
                      size: 14,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      city.score,
                      style: const TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 底部信息
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 30, 14, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      city.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      city.desc,
                      style: const TextStyle(
                        color: Color(0xFFE0E0E0),
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ...city.tags.map(
                          (tag) => Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.18),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                tag,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 4. 探索更多
  Widget _buildExploreMore() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            I18n.exploreMore(locale),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            I18n.exploreSub(locale),
            style: const TextStyle(fontSize: 13, color: Color(0xFF909090)),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryItem(
                Icons.location_on_outlined,
                locale == 'ko' ? '명소' : '景点',
                const Color(0xFFFFF0F0),
                const Color(0xFFE85454),
              ),
              _buildCategoryItem(
                Icons.hotel_outlined,
                locale == 'ko' ? '호텔' : '酒店',
                const Color(0xFFEEF0FF),
                const Color(0xFF5B6FE6),
              ),
              _buildCategoryItem(
                Icons.flight_takeoff_rounded,
                locale == 'ko' ? '항공권' : '机票',
                const Color(0xFFE8F5FF),
                const Color(0xFF3DA5F0),
              ),
              _buildCategoryItem(
                Icons.menu_book_outlined,
                locale == 'ko' ? '가이드' : '攻略',
                const Color(0xFFE8FBF0),
                const Color(0xFF3CBD6E),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(
    IconData icon,
    String label,
    Color bgColor,
    Color iconColor,
  ) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: iconColor, size: 26),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF5A5A5A),
          ),
        ),
      ],
    );
  }
}
