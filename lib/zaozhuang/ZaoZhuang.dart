import 'package:flutter/material.dart';
import 'package:hometrour/zaozhuang/animations.dart';
import 'package:hometrour/zaozhuang/day_tour_page.dart';
import 'package:hometrour/zaozhuang/destination_page.dart';
import 'package:hometrour/zaozhuang/hotel_list_page.dart';
import 'package:hometrour/zaozhuang/i18n.dart';
import 'package:hometrour/zaozhuang/scenic_spots_page.dart';
import 'package:hometrour/zaozhuang/travel_notes_page.dart';

class ZaoZhuang extends StatelessWidget {
  final String locale;
  const ZaoZhuang({Key? key, required this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: I18n.zaozhuangCity(locale),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FB),
      ),
      home: HomePage(locale: locale),
    );
  }
}

// ── 配色常量 ──────────────────────────────────────────────────────
const Color _primary = Color(0xFFE6A800);
const Color _primaryLight = Color(0xFFFFF9E0);

// ── 分类数据（各有专属颜色）─────────────────────────────────────────
final List<Map<String, dynamic>> Function(String locale) _categories =
    (String l) => [
          {
            'icon': Icons.castle_rounded,
            'label': I18n.categoryScenic(l),
            'color': const Color(0xFFFFF0F0),
            'iconColor': const Color(0xFFE85454),
          },
          {
            'icon': Icons.menu_book_rounded,
            'label': I18n.categoryGuide(l),
            'color': const Color(0xFFEEF0FF),
            'iconColor': const Color(0xFF5B6FE6),
          },
          {
            'icon': Icons.photo_album_rounded,
            'label': I18n.categoryTravelogue(l),
            'color': const Color(0xFFF0FBF0),
            'iconColor': const Color(0xFF3CBD6E),
          },
          {
            'icon': Icons.hotel_rounded,
            'label': I18n.categoryHotel(l),
            'color': const Color(0xFFFFF5EE),
            'iconColor': const Color(0xFFF08040),
          },
          {
            'icon': Icons.hiking_rounded,
            'label': I18n.categoryDayTour(l),
            'color': const Color(0xFFF5EEFF),
            'iconColor': const Color(0xFF8B5CF6),
          },
        ];

/// 热门问题
List<Map<String, dynamic>> _hotQuestionsData(String l) => [
      {
        'question': I18n.hotQ1(l),
        'answer': I18n.hotQ1Answer(l),
        'guideIndex': 1,
        'num': '01',
      },
      {
        'question': I18n.hotQ2(l),
        'answer': I18n.hotQ2Answer(l),
        'guideIndex': 5,
        'num': '02',
      },
      {
        'question': I18n.hotQ3(l),
        'answer': I18n.hotQ3Answer(l),
        'guideIndex': 2,
        'num': '03',
      },
      {
        'question': I18n.hotQ4(l),
        'answer': I18n.hotQ4Answer(l),
        'guideIndex': 3,
        'num': '04',
      },
    ];

List<Map<String, String>> _guides(String l) => [
      {
        'index': '0',
        'tag': I18n.officialGuide(l),
        'date': I18n.updatedDate(l),
        'title': I18n.guide0Title(l),
        'image':
            'assets/zaozhuang.jpg',
      },
      {
        'index': '1',
        'tag': I18n.officialGuide(l),
        'date': I18n.updatedDate(l),
        'title': I18n.guide1Title(l),
        'image':
            'assets/gucheng.jpg',
      },
      {
        'index': '2',
        'tag': I18n.officialGuide(l),
        'date': I18n.updatedDate(l),
        'title': I18n.guide2Title(l),
        'image':
            'assets/weishanhu.jpg',
      },
      {
        'index': '3',
        'tag': I18n.officialGuide(l),
        'date': I18n.updatedDate(l),
        'title': I18n.guide3Title(l),
        'image':
            'assets/shiliuyuan.jpg',
      },
      {
        'index': '4',
        'tag': I18n.officialGuide(l),
        'date': I18n.updatedDate(l),
        'title': I18n.guide4Title(l),
        'image':
            'assets/jiudian.jpeg',
      },
      {
        'index': '5',
        'tag': I18n.officialGuide(l),
        'date': I18n.updatedDate(l),
        'title': I18n.guide5Title(l),
        'image':
            'assets/meishi.jpg',
      },
    ];

/// 住宿微攻略 — 使用真实酒店图片
List<Map<String, dynamic>> _hotelCards(String l) => [
      {
        'title': I18n.hotelCard1Title(l),
        'desc': I18n.hotelCard1Desc(l),
        'price': '200',
        'image':
            'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&auto=format&fit=crop&q=80',
        'guideIndex': 4,
      },
      {
        'title': I18n.hotelCard2Title(l),
        'desc': I18n.hotelCard2Desc(l),
        'price': '100',
        'image':
            'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=400&auto=format&fit=crop&q=80',
        'guideIndex': 4,
      },
      {
        'title': I18n.hotelCard3Title(l),
        'desc': I18n.hotelCard3Desc(l),
        'price': '150',
        'image':
            'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&auto=format&fit=crop&q=80',
        'guideIndex': 4,
      },
    ];

// ── 主页 ─────────────────────────────────────────────────────────
class HomePage extends StatefulWidget {
  final String locale;
  const HomePage({Key? key, required this.locale}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _guideSectionKey = GlobalKey();
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final shouldShow =
          _scrollController.hasClients && _scrollController.offset > 500;
      if (shouldShow != _showBackToTop) {
        setState(() => _showBackToTop = shouldShow);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOutCubic);
  }

  void _scrollToGuideSection() {
    final ctx = _guideSectionKey.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      alignment: 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppLocale.instance,
      builder: (context, _) {
        final l = AppLocale.instance.lang;
        return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _TopBar(locale: l),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        _CategoryRow(locale: l, onTapCategory: (label) {
                          if (label == I18n.categoryScenic(l)) {
                            Navigator.push(
                              context,
                              SlideUpRoute(page: ScenicSpotsPage(locale: l)),
                            );
                          } else if (label == I18n.categoryGuide(l)) {
                            // 滚动到攻略区域
                            _scrollToGuideSection();
                          } else if (label == I18n.categoryTravelogue(l)) {
                            Navigator.push(
                              context,
                              SlideUpRoute(
                                  page: TravelNotesPage(locale: l)),
                            );
                          } else if (label == I18n.categoryHotel(l)) {
                            Navigator.push(
                              context,
                              SlideUpRoute(
                                  page: HotelListPage(locale: l)),
                            );
                          } else if (label == I18n.categoryDayTour(l)) {
                            Navigator.push(
                              context,
                              SlideUpRoute(
                                  page: DayTourPage(locale: l)),
                            );
                          }
                        }),
                        const SizedBox(height: 24),
                        _GuideSection(
                            locale: l,
                            key: _guideSectionKey,
                            onMoreTap: _scrollToGuideSection,
                        ),
                        const SizedBox(height: 24),
                        _HotQuestionsSection(locale: l),
                        const SizedBox(height: 24),
                        _MicroGuideSection(
                          locale: l,
                          onMoreTap: () {
                            Navigator.push(
                              context,
                              SlideUpRoute(page: HotelListPage(locale: l)),
                            );
                          },
                        ),
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // 返回顶部 FAB
            if (_showBackToTop)
              Positioned(
                bottom: 28,
                right: 20,
                child: GestureDetector(
                  onTap: _scrollToTop,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: _primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: _primary.withOpacity(0.35),
                          blurRadius: 14,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_up_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
      },
    );
  }
}

// ── 顶部标题栏 ────────────────────────────────────────────────────
class _TopBar extends StatelessWidget {
  final String locale;
  const _TopBar({required this.locale});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // 返回按钮
          GestureDetector(
            onTap: () => Navigator.of(context, rootNavigator: true).pop(),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 6,
                      offset: const Offset(0, 2)),
                ],
              ),
              child: const Icon(Icons.arrow_back_rounded,
                  size: 20, color: Color(0xFF1A1A1A)),
            ),
          ),
          const SizedBox(width: 10),
          // 城市名 + 小图标
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _primaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.location_on_rounded,
                size: 20, color: _primary),
          ),
          const SizedBox(width: 10),
          Text(
            I18n.zaozhuangCity(locale),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const Spacer(),
          // 语言切换
          GestureDetector(
            onTap: () => AppLocale.instance.toggle(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                color: _primaryLight,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: _primary, width: 1.5),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.translate_rounded,
                      size: 14, color: _primary),
                  const SizedBox(width: 4),
                  Text(
                    I18n.langLabel(locale),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: _primary,
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

// ── 分类图标行 ────────────────────────────────────────────────────
class _CategoryRow extends StatelessWidget {
  final String locale;
  final void Function(String label) onTapCategory;
  const _CategoryRow({required this.locale, required this.onTapCategory});

  @override
  Widget build(BuildContext context) {
    final items = _categories(locale);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map((item) {
          return _CategoryItem(
            icon: item['icon'] as IconData,
            label: item['label'] as String,
            bgColor: item['color'] as Color,
            iconColor: item['iconColor'] as Color,
            onTap: () => onTapCategory(item['label'] as String),
          );
        }).toList(),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color bgColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const _CategoryItem({
    required this.icon,
    required this.label,
    required this.bgColor,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, size: 24, color: iconColor),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(
                fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF5A5A5A)),
          ),
        ],
      ),
    );
  }
}

// ── 北极星攻略区 ──────────────────────────────────────────────────
class _GuideSection extends StatelessWidget {
  final String locale;
  final VoidCallback? onMoreTap;
  const _GuideSection({Key? key, required this.locale, this.onMoreTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final guideList = _guides(locale);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _SectionHeader(
            title: I18n.polarisGuide(locale),
            subtitle: I18n.featuredNotes(locale),
            more: I18n.more(locale),
            onMoreTap: onMoreTap,
          ),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: guideList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.80,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (_, i) => StaggeredEntrance(
              index: i,
              child: GentleFloat(
                index: i,
                child:
                    _GuideCard(data: guideList[i], locale: locale),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _GuideCard extends StatelessWidget {
  final Map<String, String> data;
  final String locale;

  const _GuideCard({required this.data, required this.locale});

  Widget _buildImage(String url) {
    if (url.startsWith('assets/')) {
      return Image.asset(
        url,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const ShimmerBox(),
      );
    }
    return Image.network(
      url,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => const ShimmerBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    int index = int.parse(data['index']!);
    final heroTag = 'guide_$index';
    return PressScale(
      onTap: () {
        if (index >= 0 && index < allConfigs.length) {
          Navigator.push(
            context,
            SlideUpRoute(
                page: DestinationPage(
                    config: allConfigs[index],
                    locale: locale,
                    heroTag: heroTag)),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Hero(
                tag: heroTag,
                child: _buildImage(data['image']!),
              ),
              // 渐变 — 仅底部加深
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xCC000000)],
                  ),
                ),
              ),
              // 标签
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: const BoxDecoration(
                    color: _primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    data['tag']!,
                    style: const TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              // 底部文字
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data['date']!,
                        style: const TextStyle(
                            fontSize: 8, color: Color(0xCCFFFFFF)),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        data['title']!,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── 热门问题区 ────────────────────────────────────────────────────
class _HotQuestionsSection extends StatelessWidget {
  final String locale;
  const _HotQuestionsSection({required this.locale});

  @override
  Widget build(BuildContext context) {
    final questions = _hotQuestionsData(locale);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _SectionHeader(
            title: I18n.hotQuestionsTitle(locale),
            subtitle: '',
            more: '',
            icon: Icons.help_outline_rounded,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: questions.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, i) {
              final q = questions[i];
              return PressScale(
                onTap: () {
                  final idx = q['guideIndex'] as int;
                  if (idx >= 0 && idx < allConfigs.length) {
                    Navigator.push(
                      context,
                      SlideUpRoute(
                          page: DestinationPage(
                              config: allConfigs[idx], locale: locale)),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        q['num'] as String,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: _primary.withOpacity(0.3),
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        q['question'] as String,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A1A),
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        q['answer'] as String,
                        style: const TextStyle(
                          fontSize: 9,
                          color: Color(0xFF999999),
                          height: 1.2,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ── 住宿微攻略区 ──────────────────────────────────────────────────
class _MicroGuideSection extends StatelessWidget {
  final String locale;
  final VoidCallback? onMoreTap;
  const _MicroGuideSection({required this.locale, this.onMoreTap});

  @override
  Widget build(BuildContext context) {
    final hotels = _hotelCards(locale);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _SectionHeader(
            title: I18n.microHotelGuide(locale),
            subtitle: '',
            more: I18n.more(locale),
            badge: I18n.newBadge(locale),
            icon: Icons.hotel_rounded,
            onMoreTap: onMoreTap,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: List.generate(hotels.length, (i) {
              final h = hotels[i];
              return Padding(
                padding: EdgeInsets.only(bottom: i < hotels.length - 1 ? 12 : 0),
                child: PressScale(
                  onTap: () {
                    final idx = h['guideIndex'] as int;
                    if (idx >= 0 && idx < allConfigs.length) {
                      Navigator.push(
                        context,
                        SlideUpRoute(
                            page: DestinationPage(
                                config: allConfigs[idx], locale: locale)),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // 左侧图片
                        ClipRRect(
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(16)),
                          child: SizedBox(
                            width: 120,
                            height: 110,
                            child: Image.network(
                              h['image'] as String,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => const ShimmerBox(
                                borderRadius: 12,
                                child: Icon(Icons.hotel_rounded,
                                    size: 28, color: Color(0xFFCCCCCC)),
                              ),
                            ),
                          ),
                        ),
                        // 右侧信息
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        h['title'] as String,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF1A1A1A),
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      '${I18n.hotelPriceFrom(locale)}${h['price']}${I18n.hotelPriceSuffix(locale, h['price'] as String)}',
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFE85454),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  h['desc'] as String,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF909090),
                                    height: 1.4,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

// ── 通用小组件 ────────────────────────────────────────────────────

/// 区块标题行（带可选图标、角标）
class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String more;
  final String? badge;
  final IconData? icon;
  final VoidCallback? onMoreTap;

  const _SectionHeader({
    required this.title,
    required this.subtitle,
    required this.more,
    this.badge,
    this.icon,
    this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, size: 20, color: _primary),
          const SizedBox(width: 6),
        ],
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1A1A1A),
          ),
        ),
        if (badge != null) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: const LinearGradient(
                colors: [_primary, Color(0xFFFFB300)],
              ),
            ),
            child: Text(
              badge!,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ],
        if (subtitle.isNotEmpty) ...[
          const SizedBox(width: 6),
          Container(
            width: 3,
            height: 3,
            decoration: const BoxDecoration(
                color: Color(0xFFAAAAAA), shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            subtitle,
            style:
                const TextStyle(fontSize: 13, color: Color(0xFF909090)),
          ),
        ],
        const Spacer(),
        if (more.isNotEmpty)
          GestureDetector(
            onTap: onMoreTap,
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  more,
                  style: const TextStyle(
                      fontSize: 12, color: Color(0xFF909090)),
                ),
                const SizedBox(width: 2),
                const Icon(Icons.chevron_right_rounded,
                    size: 16, color: Color(0xFFAAAAAA)),
              ],
            ),
          ),
      ],
    );
  }
}
