import 'package:flutter/material.dart';
import 'package:hometrour/zaozhuang/animations.dart';
import 'package:hometrour/zaozhuang/destination_page.dart';
import 'package:hometrour/zaozhuang/i18n.dart';

const Color _primary = Color(0xFFE6A800);

/// ── 景点数据 ──────────────────────────────────────────────────────
class _ScenicSpot {
  final String image;
  final String Function(String l) name;
  final String Function(String l) desc;
  final int guideIndex;
  final double score;
  final String tag; // 标签：热门 / 必去 / 自然 / 人文

  const _ScenicSpot({
    required this.image,
    required this.name,
    required this.desc,
    required this.guideIndex,
    required this.score,
    required this.tag,
  });
}

const List<_ScenicSpot> _spots = [
  _ScenicSpot(
    image:
        'https://images.unsplash.com/photo-1594348224200-0c3144e7e7cb?q=80&w=1548&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: I18n.scenicSpot1Name,
    desc: I18n.scenicSpot1Desc,
    guideIndex: 1,
    score: 4.9,
    tag: '必去',
  ),
  _ScenicSpot(
    image:
        'https://images.unsplash.com/photo-1670416826299-f58110eab9a4?q=80&w=1740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: I18n.scenicSpot2Name,
    desc: I18n.scenicSpot2Desc,
    guideIndex: 2,
    score: 4.7,
    tag: '自然',
  ),
  _ScenicSpot(
    image:
        'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=600&auto=format&fit=crop&q=80',
    name: I18n.scenicSpot3Name,
    desc: I18n.scenicSpot3Desc,
    guideIndex: 3,
    score: 4.6,
    tag: '赏花',
  ),
  _ScenicSpot(
    image:
        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=600&auto=format&fit=crop&q=80',
    name: I18n.scenicSpot4Name,
    desc: I18n.scenicSpot4Desc,
    guideIndex: 0,
    score: 4.5,
    tag: '登山',
  ),
  _ScenicSpot(
    image:
        'https://images.unsplash.com/photo-1543097692-fa13c6cd8595?w=600&auto=format&fit=crop&q=80',
    name: I18n.scenicSpot5Name,
    desc: I18n.scenicSpot5Desc,
    guideIndex: 1,
    score: 4.8,
    tag: '人文',
  ),
  _ScenicSpot(
    image:
        'https://images.unsplash.com/photo-1508672019048-805c876b67e2?w=400&auto=format&fit=crop&q=80',
    name: I18n.scenicSpot6Name,
    desc: I18n.scenicSpot6Desc,
    guideIndex: 0,
    score: 4.3,
    tag: '文化',
  ),
];

/// ── 景点玩乐列表页 ─────────────────────────────────────────────────
class ScenicSpotsPage extends StatelessWidget {
  final String locale;
  const ScenicSpotsPage({Key? key, required this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppLocale.instance,
      builder: (context, _) {
        final l = AppLocale.instance.lang;
        return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: const Color(0xFFF8F9FB),
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    size: 18, color: Color(0xFF1A1A1A)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            title: Text(
              I18n.scenicPageTitle(l),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A1A1A),
              ),
            ),
            centerTitle: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final spot = _spots[index];
                  return StaggeredEntrance(
                    index: index,
                    child:
                        _ScenicSpotCard(spot: spot, locale: l),
                  );
                },
                childCount: _spots.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
      },
    );
  }
}

class _ScenicSpotCard extends StatelessWidget {
  final _ScenicSpot spot;
  final String locale;

  const _ScenicSpotCard({required this.spot, required this.locale});

  /// 根据 tag 返回颜色
  Color _tagColor() {
    switch (spot.tag) {
      case '必去':
        return const Color(0xFFE85454);
      case '自然':
        return const Color(0xFF3CBD6E);
      case '赏花':
        return const Color(0xFFE880A0);
      case '登山':
        return const Color(0xFFF08040);
      case '人文':
        return const Color(0xFF5B6FE6);
      case '文化':
        return const Color(0xFF8B5CF6);
      default:
        return const Color(0xFF909090);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PressScale(
      onTap: () {
        if (spot.guideIndex >= 0 && spot.guideIndex < allConfigs.length) {
          Navigator.push(
            context,
            SlideUpRoute(
              page: DestinationPage(
                config: allConfigs[spot.guideIndex],
                locale: locale,
              ),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: NetworkImage(spot.image),
            fit: BoxFit.cover,
            onError: (_, __) {},
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 14,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            // 渐变遮罩
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.25),
                    Colors.black.withOpacity(0.72),
                  ],
                  stops: const [0.0, 0.35, 1.0],
                ),
              ),
            ),
            // 标签（左上）
            Positioned(
              top: 14,
              left: 14,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: _tagColor(),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: _tagColor().withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  spot.tag,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            // 评分（右上）
            Positioned(
              top: 14,
              right: 14,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_rounded,
                        color: _primary, size: 15),
                    const SizedBox(width: 3),
                    Text(
                      '${spot.score}',
                      style: const TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // 名称与简介（底部）
            Positioned(
              bottom: 16,
              left: 16,
              right: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    spot.name(locale),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    spot.desc(locale),
                    style: const TextStyle(
                      color: Color(0xFFDDDDDD),
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // 箭头
            Positioned(
              bottom: 22,
              right: 16,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward_rounded,
                    color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
