import 'package:flutter/material.dart';
import '../models/city_data.dart';
import '../services/l10n.dart';
import 'shared_widgets.dart';

String _c(BuildContext c, String zh) => LanguageProvider.of(c).ct(zh);

/// 旅行路线 Tab 内容 —— 完整实现设计稿
/// 点击顶部统计卡片（1日/2日/慢游）自动滚动到对应路线并高亮
class TravelRouteContent extends StatefulWidget {
  final CityData city;
  const TravelRouteContent({Key? key, required this.city}) : super(key: key);

  @override
  State<TravelRouteContent> createState() => _TravelRouteContentState();
}

class _TravelRouteContentState extends State<TravelRouteContent> {
  /// 每个路线卡片的 GlobalKey，用于定位滚动
  final List<GlobalKey> _routeKeys = [];

  /// 当前高亮的路线索引，-1 表示无高亮
  int _highlightedIndex = -1;

  @override
  void initState() {
    super.initState();
    _routeKeys.addAll(
      List.generate(widget.city.routes.length, (_) => GlobalKey()),
    );
  }

  /// 点击统计卡片 → 滚动到对应路线并高亮
  void _scrollToRoute(int index) {
    if (index < 0 || index >= _routeKeys.length) return;

    setState(() => _highlightedIndex = index);

    final key = _routeKeys[index];
    final targetContext = key.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0.15,
      );
    }

    // 1.5 秒后取消高亮
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() => _highlightedIndex = -1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _t = LanguageProvider.of(context).t;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 路线封面图区域
          GallerySection(
            mainLabel: _t('route.gallery_main'),
            mainSubLabel: _t('route.gallery_sub'),
            sideTopLabel: _t('route.gallery_city'),
            sideBottomLabel: _t('route.gallery_river'),
          ),
          const SizedBox(height: 14),

          // 统计卡片 —— 点击跳转到对应路线
          _buildStats(_t),
          const SizedBox(height: 14),

          // 推荐路线
          _buildRecommendedRoutes(_t),
          const SizedBox(height: 14),

          // 路线提示
          _buildTips(_t),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  /// 统计卡片（可点击跳转）
  Widget _buildStats(String Function(String) _t) {
    return StatRow(stats: [
      StatData(_t('route.stat_1day_val'), _t('route.stat_1day'),
          onTap: () => _scrollToRoute(0)),
      StatData(_t('route.stat_2day_val'), _t('route.stat_2day'),
          onTap: () => _scrollToRoute(1)),
      StatData(_t('route.stat_slow_val'), _t('route.stat_slow'),
          onTap: () => _scrollToRoute(2)),
    ]);
  }

  /// 推荐路线区域
  Widget _buildRecommendedRoutes(String Function(String) _t) {
    return SectionCard(
      title: _t('route.recommend'),
      tag: _t('route.tag'),
      child: Column(
        children: List.generate(widget.city.routes.length, (index) {
          final route = widget.city.routes[index];
          return Padding(
            padding: EdgeInsets.only(top: index == 0 ? 0 : 10),
            child: _RouteCard(
              key: _routeKeys[index],
              route: route,
              highlighted: _highlightedIndex == index,
            ),
          );
        }),
      ),
    );
  }

  /// 路线提示区域
  Widget _buildTips(String Function(String) _t) {
    return SectionCard(
      title: _t('route.tips'),
      tag: _t('route.tips_tag'),
      child: InfoGrid(items: widget.city.tips.map((t) {
        final _ct = LanguageProvider.of(context).ct;
        return {'title': _ct(t['title']!), 'content': _ct(t['content']!)};
      }).toList()),
    );
  }
}

/// 路线卡片
class _RouteCard extends StatelessWidget {
  final RouteData route;
  final bool highlighted;

  const _RouteCard({
    super.key,
    required this.route,
    this.highlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: highlighted
            ? const Color(0xFFFFF0F5) // 浅粉底色，高亮时更醒目
            : const Color(0xC7FFFFFF),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: highlighted
              ? const Color(0xFFB83D62) // peony 红色边框
              : const Color(0xC7FFFFFF),
          width: highlighted ? 2.0 : 1.0,
        ),
        boxShadow: highlighted
            ? const [
                BoxShadow(
                  color: Color(0x47B83D62),
                  blurRadius: 24,
                  offset: Offset(0, 8),
                ),
              ]
            : const [
                BoxShadow(
                  color: Color(0x144E4234),
                  blurRadius: 30,
                  offset: Offset(0, 14),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 头部：标题 + 天数
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _c(context, route.title),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _c(context, route.description),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.muted,
                        height: 1.55,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // 动态天数标签
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7E4EA),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  _c(context, route.duration),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF6B2D43),
                  ),
                ),
              ),
            ],
          ),

          // 时间线停靠点
          const SizedBox(height: 12),
          ...route.stops.asMap().entries.map((entry) {
            final i = entry.key;
            final stop = entry.value;
            final isLast = i == route.stops.length - 1;
            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 8),
              child: Row(
                children: [
                  // 编号圆点
                  Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColors.peony, AppColors.peonyDeep],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${i + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  // 停靠点文本
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 11, vertical: 9),
                      decoration: BoxDecoration(
                        color: AppColors.cream,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        _c(context, stop.label),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF4E5651),
                          height: 1.45,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}