import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import '../models/city_data.dart';
import '../services/l10n.dart';
import '../widgets/shared_widgets.dart';
import '../widgets/travel_route_content.dart';

String _c(BuildContext c, String zh) => LanguageProvider.of(c).ct(zh);

/// 城市详情页 —— Hero + 四页 Tab
class CityDetailPage extends StatefulWidget {
  final CityData city;
  const CityDetailPage({Key? key, required this.city}) : super(key: key);

  @override
  State<CityDetailPage> createState() => _CityDetailPageState();
}

class _CityDetailPageState extends State<CityDetailPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // 每个 Tab 对应的 hero 文案 key
  static const _titleKeys = ['hero.home', 'hero.spots', 'hero.food', 'hero.route'];
  static const _subtitleKeys = [
    'hero.sub_home',
    'hero.sub_spots',
    'hero.sub_food',
    'hero.sub_route',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 3);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {}); // 刷新 hero 标题
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int get _activeIndex => _tabController.index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF7EF),
      body: Column(
        children: [
          // Hero 区域
          _HeroSection(
            city: widget.city,
            title: LanguageProvider.of(context).t(_titleKeys[_activeIndex]),
            subtitle:
                LanguageProvider.of(context).t(_subtitleKeys[_activeIndex]),
            onBack: () => Navigator.pop(context),
          ),

          // Tab 栏（悬浮，覆盖 hero 底部）
          _TabBarSection(controller: _tabController),

          // 内容区
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _HometownIntroTab(city: widget.city),
                _TouristSpotsTab(city: widget.city),
                _FoodTab(city: widget.city),
                TravelRouteContent(city: widget.city),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// Hero 区域 — 增强版（匹配设计稿的复杂光效）
// ══════════════════════════════════════════════════════════════════════

class _HeroSection extends StatelessWidget {
  final CityData city;
  final String title;
  final String subtitle;
  final VoidCallback onBack;

  const _HeroSection({
    required this.city,
    required this.title,
    required this.subtitle,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Stack(
        children: [
          // 背景渐变层
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFB84066),
                    Color(0xFF6F2948),
                    Color(0xFF2D5D56),
                  ],
                  stops: [0.0, 0.48, 1.0],
                ),
              ),
            ),
          ),

          // 粉色光晕 (28% 36%)
          Positioned(
            top: 80,
            left: 40,
            child: Container(
              width: 180,
              height: 180,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  center: Alignment(0.28, 0.36),
                  colors: [Color(0xE6FFCCDE), Colors.transparent],
                  stops: [0.08, 0.26],
                ),
              ),
            ),
          ),

          // 黄色光晕 (66% 28%)
          Positioned(
            top: 60,
            right: 30,
            child: Container(
              width: 160,
              height: 160,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  center: Alignment(0.66, 0.28),
                  colors: [Color(0xCCFFEA9A), Colors.transparent],
                  stops: [0.04, 0.18],
                ),
              ),
            ),
          ),

          // 牡丹花形光斑（完整层级匹配设计稿）
          Positioned(
            left: -38,
            top: 76,
            child: Container(
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(101),
                  topRight: Radius.circular(109),
                  bottomLeft: Radius.circular(92),
                  bottomRight: Radius.circular(118),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x474A0F28),
                    blurRadius: 28,
                    offset: Offset(0, 22),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // 底层：深粉红
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(101),
                          topRight: Radius.circular(109),
                          bottomLeft: Radius.circular(92),
                          bottomRight: Radius.circular(118),
                        ),
                        color: Color(0xFFA8325D),
                      ),
                    ),
                  ),
                  // 黄色中心光斑 (50% 50%, 12%)
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [Color(0xFFFFD77A), Color(0x00FFD77A)],
                          stops: [0.12, 0.13],
                        ),
                      ),
                    ),
                  ),
                  // 粉色光斑 (36% 34%, 20%)
                  Positioned(
                    left: 55,
                    top: 50,
                    child: Container(
                      width: 84,
                      height: 84,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [Color(0xFFFFD8E6), Color(0x00FFD8E6)],
                          stops: [0.20, 0.21],
                        ),
                      ),
                    ),
                  ),
                  // 中粉色光斑 (64% 32%, 22%)
                  Positioned(
                    right: 40,
                    top: 38,
                    child: Container(
                      width: 92,
                      height: 92,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [Color(0xFFF5A4C0), Color(0x00F5A4C0)],
                          stops: [0.22, 0.23],
                        ),
                      ),
                    ),
                  ),
                  // 深粉色光斑 (36% 66%, 22%)
                  Positioned(
                    left: 55,
                    bottom: 40,
                    child: Container(
                      width: 92,
                      height: 92,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [Color(0xFFE26992), Color(0x00E26992)],
                          stops: [0.22, 0.23],
                        ),
                      ),
                    ),
                  ),
                  // 最深粉色光斑 (64% 66%, 22%)
                  Positioned(
                    right: 40,
                    bottom: 40,
                    child: Container(
                      width: 92,
                      height: 92,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [Color(0xFFC74873), Color(0x00C74873)],
                          stops: [0.22, 0.23],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 底部河流光带
          Positioned(
            right: -54,
            bottom: 22,
            child: Transform.rotate(
              angle: -0.157, // -9deg
              child: Container(
                width: 270,
                height: 78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0x2EFFFFFF),
                      Color(0x94FFFFFF),
                      Color(0x1FFFFFFF),
                    ],
                  ),
                  color: const Color(0xFF477F98),
                ),
              ),
            ),
          ),

          // 底部深色渐变遮罩
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 120,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0xC2171B1A),
                  ],
                ),
              ),
            ),
          ),

          // 内容
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 顶部栏
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _FrostedButton(
                          child: const Text(
                            '‹',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          onTap: onBack,
                        ),
                        _FrostedButton(
                          width: null,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 0),
                          onTap: () {
                            final lang = LanguageProvider.of(context);
                            final next = lang.current == AppLanguage.zh
                                ? AppLanguage.ko
                                : AppLanguage.zh;
                            lang.setLanguage(next);
                          },
                          child: Builder(
                            builder: (ctx) {
                              final lang = LanguageProvider.of(context);
                              return Text(
                                lang.currentLabel,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.2,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // 省份标签
                    _ProvinceTag(
                      label: _c(context, '${city.province} · ${city.name}'),
                    ),

                    const SizedBox(height: 13),

                    // 标题
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // 副标题
                    SizedBox(
                      width: 290,
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.88),
                          fontSize: 14,
                          height: 1.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// 磨砂玻璃按钮
// ══════════════════════════════════════════════════════════════════════

class _FrostedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double? width;
  final EdgeInsetsGeometry? padding;

  const _FrostedButton({
    required this.child,
    this.onTap,
    this.width,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 14, sigmaY: 14),
          child: Container(
            width: width ?? 38,
            height: 38,
            padding: padding,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.35),
              ),
              borderRadius: BorderRadius.circular(999),
              color: Colors.white.withValues(alpha: 0.18),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33FFFFFF),
                  blurRadius: 0,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// 省份标签
// ══════════════════════════════════════════════════════════════════════

class _ProvinceTag extends StatelessWidget {
  final String label;
  const _ProvinceTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.18),
            border: Border.all(color: Colors.white.withValues(alpha: 0.28)),
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
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// Tab 栏（悬浮卡片）—— 匹配设计稿 active 状态
// ══════════════════════════════════════════════════════════════════════

class _TabBarSection extends StatelessWidget {
  final TabController controller;
  const _TabBarSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    final _t = LanguageProvider.of(context).t;
    return Container(
      margin: const EdgeInsets.only(top: 0),
      child: Transform.translate(
        offset: const Offset(0, -28),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.92),
                  borderRadius: BorderRadius.circular(22),
                  border:
                      Border.all(color: Colors.white.withValues(alpha: 0.8)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x244D3D2B),
                      blurRadius: 34,
                      offset: Offset(0, 18),
                    ),
                  ],
                ),
                child: TabBar(
                  controller: controller,
                  // Active 状态：红色渐变背景 + 阴影（匹配设计稿 .tab.active）
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFB83D62), // peony
                        Color(0xFF812A48), // peonyDeep
                      ],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x47B83D62),
                        blurRadius: 18,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.white,
                  unselectedLabelColor: const Color(0xFF7D807B),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                  indicatorPadding: const EdgeInsets.all(2),
                  overlayColor:
                      WidgetStateProperty.all(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  tabs: [
                    _TabItem(icon: '⌂', label: _t('tab.home')),
                    _TabItem(icon: '⌖', label: _t('tab.spots')),
                    _TabItem(icon: '◌', label: _t('tab.food')),
                    _TabItem(icon: '↝', label: _t('tab.route')),
                  ],
                  onTap: (_) {},
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 单个 Tab 项
class _TabItem extends StatelessWidget {
  final String icon;
  final String label;
  const _TabItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: Tab(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              style: const TextStyle(fontSize: 19, height: 1),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// Tab 1: 家乡介绍（匹配 hometown-intro-hifi.html）
// ══════════════════════════════════════════════════════════════════════

class _HometownIntroTab extends StatelessWidget {
  final CityData city;
  const _HometownIntroTab({required this.city});

  @override
  Widget build(BuildContext context) {
    final _t = LanguageProvider.of(context).t;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // 图片画廊
          GallerySection(
            mainLabel: _t('home_gallery.main'),
            mainSubLabel: _t('home_gallery.sub'),
            sideTopLabel: _t('home_gallery.side_top'),
            sideBottomLabel: _t('home_gallery.side_bottom'),
          ),
          const SizedBox(height: 14),

          // 统计卡片
          StatRow(stats: [
            StatData(_t('home_stat1.value'), _t('home_stat1.label')),
            StatData(_t('home_stat2.value'), _t('home_stat2.label')),
            StatData(_t('home_stat3.value'), _t('home_stat3.label')),
          ]),
          const SizedBox(height: 14),

          // 家乡概览
          SectionCard(
            title: _t('home_overview.title'),
            tag: _t('home_overview.tag'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _t('home_overview.desc'),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF555E59),
                    height: 1.75,
                  ),
                ),
                const SizedBox(height: 13),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _t('home_overview.tag1'),
                    _t('home_overview.tag2'),
                    _t('home_overview.tag3'),
                    _t('home_overview.tag4'),
                  ].map((tag) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 11, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7E4EA),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                            color: const Color(0x29B83D62)),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          color: Color(0xFF5D2E42),
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // 城市速览
          SectionCard(
            title: _t('home_snapshot.title'),
            tag: _t('home_snapshot.tag'),
            child: InfoGrid(items: [
              {
                'title': _t('home_tip1.title'),
                'content': _t('home_tip1.content'),
              },
              {
                'title': _t('home_tip2.title'),
                'content': _t('home_tip2.content'),
              },
            ]),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// Tab 2: 旅游景点（匹配 tourist-spots-hifi.html）
// ══════════════════════════════════════════════════════════════════════

class _TouristSpotsTab extends StatelessWidget {
  final CityData city;
  const _TouristSpotsTab({required this.city});

  @override
  Widget build(BuildContext context) {
    final _t = LanguageProvider.of(context).t;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // 景点画廊
          GallerySection(
            mainLabel: _t('spots_gallery.main'),
            mainSubLabel: _t('spots_gallery.sub'),
            sideTopLabel: _t('spots_gallery.side_top'),
            sideBottomLabel: _t('spots_gallery.side_bottom'),
          ),
          const SizedBox(height: 14),

          // 统计卡片
          StatRow(stats: [
            StatData(_t('spots_stat1.value'), _t('spots_stat1.label')),
            StatData(_t('spots_stat2.value'), _t('spots_stat2.label')),
            StatData(_t('spots_stat3.value'), _t('spots_stat3.label')),
          ]),
          const SizedBox(height: 14),

          // 推荐景点
          SectionCard(
            title: _t('spots_list.title'),
            tag: _t('spots_list.tag'),
            child: Column(
              children: city.spots.map((spot) {
                final index = city.spots.indexOf(spot);
                return Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 0 : 12),
                  child: _SpotCard(spot: spot, index: index),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 14),

          // 游览提示
          SectionCard(
            title: _t('spots_tips.title'),
            tag: _t('spots_tips.tag'),
            child: InfoGrid(items: [
              {
                'title': _t('spots_tip1.title'),
                'content': _t('spots_tip1.content'),
              },
              {
                'title': _t('spots_tip2.title'),
                'content': _t('spots_tip2.content'),
              },
            ]),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

/// 景点卡片 — 水平布局（缩略图 + 文字），匹配设计稿 .spot-card
class _SpotCard extends StatelessWidget {
  final TouristSpot spot;
  final int index;
  const _SpotCard({required this.spot, required this.index});

  @override
  Widget build(BuildContext context) {
    // 根据索引选择不同的缩略图渐变（对应设计稿的 .thumb-peony / .thumb-city / .thumb-river）
    final thumbGradient = _thumbGradients[index % _thumbGradients.length];

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xC7FFFFFF),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xC7FFFFFF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x144E4234),
            blurRadius: 30,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 缩略图（118px 宽）
            SizedBox(
              width: 118,
              child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: thumbGradient.colors,
                    stops: thumbGradient.stops,
                  ),
                ),
                child: Stack(
                  children: [
                    // 光斑
                    ...thumbGradient.lightSpots.map(
                      (spot) => Positioned(
                        left: spot.left,
                        top: spot.top,
                        child: Container(
                          width: spot.size,
                          height: spot.size,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: spot.colors,
                              stops: spot.stops,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // 底部渐变
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Color(0x38000000)],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // 文字区域
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 名称
                Text(
                  _c(context, spot.name),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2422),
                  ),
                ),
                const SizedBox(height: 7),
                // 描述
                Expanded(
                  child: Text(
                    _c(context, spot.description),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF6C746F),
                      height: 1.58,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // 标签行
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    _MetaPill(_c(context, spot.type)),
                    _MetaPill(spot.level),
                    if (spot.highlight.length < 8) _MetaPill(_c(context, spot.highlight)),
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

/// 缩略图渐变数据
class _ThumbGradient {
  final List<Color> colors;
  final List<double> stops;
  final List<_LightSpot> lightSpots;
  const _ThumbGradient({
    required this.colors,
    required this.stops,
    this.lightSpots = const [],
  });
}

/// 光斑数据
class _LightSpot {
  final double left;
  final double top;
  final double size;
  final List<Color> colors;
  final List<double> stops;
  const _LightSpot({
    required this.left,
    required this.top,
    required this.size,
    required this.colors,
    required this.stops,
  });
}

const _thumbGradients = [
  // peony style
  _ThumbGradient(
    colors: [Color(0xFFF2CCDC), Color(0xFF963356), Color(0xFF356F56)],
    stops: [0.0, 0.58, 1.0],
    lightSpots: [
      _LightSpot(
        left: 42, top: 28, size: 35,
        colors: [Color(0xFFFFE28F), Color(0x00FFE28F)],
        stops: [0.08, 0.09],
      ),
      _LightSpot(
        left: 20, top: 24, size: 45,
        colors: [Color(0xFFFFC7DC), Color(0x00FFC7DC)],
        stops: [0.18, 0.19],
      ),
    ],
  ),
  // city style
  _ThumbGradient(
    colors: [Color(0xFFDFBD78), Color(0xFF8F563E), Color(0xFF344F4A)],
    stops: [0.0, 0.52, 1.0],
  ),
  // river style
  _ThumbGradient(
    colors: [Color(0xFFDCECE8), Color(0xFF5A97A6), Color(0xFFD0B468)],
    stops: [0.0, 0.52, 1.0],
  ),
];

/// Meta pill 标签
class _MetaPill extends StatelessWidget {
  final String label;
  const _MetaPill(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF7E4EA),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w900,
          color: Color(0xFF6B2D43),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════════════════════════════
// Tab 3: 美食（匹配 food-hifi.html）
// ══════════════════════════════════════════════════════════════════════

class _FoodTab extends StatelessWidget {
  final CityData city;
  const _FoodTab({required this.city});

  @override
  Widget build(BuildContext context) {
    final _t = LanguageProvider.of(context).t;
    final featuredFoods = city.foods.take(6).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // 美食画廊
          GallerySection(
            mainLabel: _t('food_gallery.main'),
            mainSubLabel: _t('food_gallery.sub'),
            sideTopLabel: _t('food_gallery.side_top'),
            sideBottomLabel: _t('food_gallery.side_bottom'),
          ),
          const SizedBox(height: 14),

          // 统计卡片
          StatRow(stats: [
            StatData(_t('food_stat1.value'), _t('food_stat1.label')),
            StatData(_t('food_stat2.value'), _t('food_stat2.label')),
            StatData(_t('food_stat3.value'), _t('food_stat3.label')),
          ]),
          const SizedBox(height: 14),

          // 代表美食
          SectionCard(
            title: _t('food_list.title'),
            tag: _t('food_list.tag'),
            child: Column(
              children: featuredFoods.map((food) {
                final index = featuredFoods.indexOf(food);
                return Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 0 : 12),
                  child: _FoodCard(food: food, index: index),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 14),

          // 美食提示
          SectionCard(
            title: _t('food_tips.title'),
            tag: _t('food_tips.tag'),
            child: InfoGrid(items: [
              {
                'title': _t('food_tip1.title'),
                'content': _t('food_tip1.content'),
              },
              {
                'title': _t('food_tip2.title'),
                'content': _t('food_tip2.content'),
              },
            ]),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

/// 美食卡片 — 水平布局（图标 + 文字），匹配设计稿 .dish-card
class _FoodCard extends StatelessWidget {
  final FoodItem food;
  final int index;
  const _FoodCard({required this.food, required this.index});

  @override
  Widget build(BuildContext context) {
    final markStyle = _dishMarkStyles[index % _dishMarkStyles.length];

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xC7FFFFFF),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xC7FFFFFF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x144E4234),
            blurRadius: 30,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Row(
        children: [
          // 图标区（74x74）
          Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: markStyle.colors,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x33FFFFFF),
                  blurRadius: 0,
                  offset: Offset(0, 1),
                ),
                BoxShadow(
                  color: Color(0x1F4E4234),
                  blurRadius: 20,
                  offset: Offset(0, 12),
                ),
              ],
            ),
            child: Center(
              child: Text(
                markStyle.emoji,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // 文字区
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _c(context, food.name),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2422),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  _c(context, food.description),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF6C746F),
                    height: 1.58,
                  ),
                ),
                const SizedBox(height: 8),
                // 风味标签
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    _TastePill(_c(context, food.category)),
                    _TastePill(_c(context, food.origin)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 菜品图标样式
class _DishMarkStyle {
  final List<Color> colors;
  final String emoji;
  const _DishMarkStyle({required this.colors, required this.emoji});
}

const _dishMarkStyles = [
  _DishMarkStyle(colors: [Color(0xFFD6A94F), Color(0xFFA45C30)], emoji: '汤'),
  _DishMarkStyle(colors: [Color(0xFFE1BA70), Color(0xFF8F563E)], emoji: '饼'),
  _DishMarkStyle(colors: [Color(0xFFB83D62), Color(0xFF673848)], emoji: '酱'),
  _DishMarkStyle(colors: [Color(0xFFD6A94F), Color(0xFFA45C30)], emoji: '肉'),
  _DishMarkStyle(colors: [Color(0xFF5A97A6), Color(0xFF3B6B7A)], emoji: '面'),
  _DishMarkStyle(colors: [Color(0xFF8F563E), Color(0xFF5D3528)], emoji: '卤'),
];

/// 风味标签
class _TastePill extends StatelessWidget {
  final String label;
  const _TastePill(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3DB),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w900,
          color: Color(0xFF7B4D1D),
        ),
      ),
    );
  }
}
