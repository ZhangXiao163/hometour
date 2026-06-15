import 'package:flutter/material.dart';

/// ══════════════════════════════════════════════════════════════════════
/// 设计系统颜色 —— 从设计稿提取
/// ══════════════════════════════════════════════════════════════════════

class AppColors {
  static const bg = Color(0xFFEDE7DB);
  static const ink = Color(0xFF1F2422);
  static const muted = Color(0xFF6C746F);
  static const peony = Color(0xFFB83D62);
  static const peonyDeep = Color(0xFF812A48);
  static const leaf = Color(0xFF356F56);
  static const river = Color(0xFF477F98);
  static const gold = Color(0xFFD6A94F);
  static const cream = Color(0xFFFFF8EB);
  static const phone = Color(0xFFFBF7EF);
  static const lineColor = Color(0x1A1F2422);

  // Hero gradient colors
  static const heroStart = Color(0xFFB84066);
  static const heroMid = Color(0xFF6F2948);
  static const heroEnd = Color(0xFF2D5D56);

  // Photo gradient colors
  static const photoMainStart = Color(0xFFEAC0CE);
  static const photoMainMid = Color(0xFF9F3156);
  static const photoMainEnd = Color(0xFF2F654E);

  static const photoCityStart = Color(0xFFD2B06D);
  static const photoCityMid = Color(0xFF8D563D);
  static const photoCityEnd = Color(0xFF395B50);

  static const photoRiverStart = Color(0xFFD8E6DF);
  static const photoRiverMid = Color(0xFF6AA0AD);
  static const photoRiverEnd = Color(0xFFD1B56F);
}

/// ══════════════════════════════════════════════════════════════════════
/// 共享 — 图片画廊区域（所有 4 个 Tab 共用）
/// ══════════════════════════════════════════════════════════════════════

class GallerySection extends StatelessWidget {
  final String mainLabel;
  final String mainSubLabel;
  final String sideTopLabel;
  final String sideBottomLabel;
  final Color? mainOverlayStart;
  final Color? mainOverlayMid;
  final Color? mainOverlayEnd;

  const GallerySection({
    super.key,
    required this.mainLabel,
    this.mainSubLabel = '',
    required this.sideTopLabel,
    required this.sideBottomLabel,
    this.mainOverlayStart,
    this.mainOverlayMid,
    this.mainOverlayEnd,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Row(
        children: [
          Expanded(
            flex: 55,
            child: _MainPhoto(
              label: mainLabel,
              subLabel: mainSubLabel,
              overlayStart: mainOverlayStart ?? AppColors.photoMainStart,
              overlayMid: mainOverlayMid ?? AppColors.photoMainMid,
              overlayEnd: mainOverlayEnd ?? AppColors.photoMainEnd,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 45,
            child: Column(
              children: [
                Expanded(
                  child: _SidePhoto(
                    label: sideTopLabel,
                    isCity: true,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: _SidePhoto(
                    label: sideBottomLabel,
                    isCity: false,
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

/// 主图 — 大图，带有机光斑 + 底部渐变
class _MainPhoto extends StatelessWidget {
  final String label;
  final String subLabel;
  final Color overlayStart;
  final Color overlayMid;
  final Color overlayEnd;

  const _MainPhoto({
    required this.label,
    required this.subLabel,
    required this.overlayStart,
    required this.overlayMid,
    required this.overlayEnd,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [overlayStart, overlayMid, overlayEnd],
            stops: const [0.0, 0.55, 1.0],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1F4A3E31),
              blurRadius: 34,
              offset: Offset(0, 18),
            ),
          ],
        ),
        child: Stack(
          children: [
            // 光斑1 — 粉色光晕
            Positioned(
              left: -20,
              top: -10,
              child: Container(
                width: 120,
                height: 120,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Color(0x66FFD4E3), Colors.transparent],
                    stops: [0.16, 1.0],
                  ),
                ),
              ),
            ),
            // 光斑2 — 黄色光晕
            Positioned(
              right: -15,
              top: -5,
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Color(0x66FFE38D), Colors.transparent],
                    stops: [0.07, 1.0],
                  ),
                ),
              ),
            ),
            // 光斑3 — 粉色中心光晕
            Positioned(
              left: 30,
              top: 60,
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Color(0x33F394B6), Colors.transparent],
                    stops: [0.17, 1.0],
                  ),
                ),
              ),
            ),
            // 底部渐变遮罩
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Color(0x9E000000),
                    ],
                    stops: [0.0, 0.36, 1.0],
                  ),
                ),
              ),
            ),
            // 标签
            Positioned(
              left: 12,
              right: 12,
              bottom: 11,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        Shadow(color: Colors.black38, blurRadius: 10),
                      ],
                    ),
                  ),
                  if (subLabel.isNotEmpty)
                    Text(
                      subLabel,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.86),
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        shadows: const [
                          Shadow(color: Colors.black38, blurRadius: 10),
                        ],
                      ),
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

/// 侧边小图
class _SidePhoto extends StatelessWidget {
  final String label;
  final bool isCity;

  const _SidePhoto({
    required this.label,
    required this.isCity,
  });

  @override
  Widget build(BuildContext context) {
    final colors = isCity
        ? [AppColors.photoCityStart, AppColors.photoCityMid, AppColors.photoCityEnd]
        : [AppColors.photoRiverStart, AppColors.photoRiverMid, AppColors.photoRiverEnd];

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: isCity ? Alignment.topLeft : Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
            stops: [0.0, isCity ? 0.52 : 0.48, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // 顶部光效
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      isCity
                          ? const Color(0x5CFFFFFF)
                          : const Color(0x75FFFFFF),
                      Colors.transparent,
                    ],
                    stops: [0.0, isCity ? 0.38 : 0.35],
                  ),
                ),
              ),
            ),
            // 标签
            Positioned(
              left: 12,
              right: 12,
              bottom: 11,
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  shadows: [
                    Shadow(color: Colors.black38, blurRadius: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ══════════════════════════════════════════════════════════════════════
/// 共享 — 统计卡片行
/// ══════════════════════════════════════════════════════════════════════

class StatData {
  final String value;
  final String label;
  final VoidCallback? onTap;
  const StatData(this.value, this.label, {this.onTap});
}

class StatRow extends StatelessWidget {
  final List<StatData> stats;
  const StatRow({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < stats.length; i++) ...[
          if (i > 0) const SizedBox(width: 9),
          Expanded(child: _StatCard(data: stats[i])),
        ],
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final StatData data;
  const _StatCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      constraints: const BoxConstraints(minHeight: 84),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.lineColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data.value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.ink,
              height: 1.15,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.muted,
              height: 1.4,
            ),
          ),
        ],
      ),
    );

    if (data.onTap != null) {
      return GestureDetector(
        onTap: data.onTap,
        child: card,
      );
    }
    return card;
  }
}

/// ══════════════════════════════════════════════════════════════════════
/// 共享 — 区域卡片容器
/// ══════════════════════════════════════════════════════════════════════

class SectionCard extends StatelessWidget {
  final String title;
  final String tag;
  final Widget child;
  const SectionCard({
    super.key,
    required this.title,
    required this.tag,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xBDFFFFFF), // rgba(255,255,255,.74)
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.ink,
                  letterSpacing: 0,
                ),
              ),
              Text(
                tag,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: AppColors.peony,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

/// ══════════════════════════════════════════════════════════════════════
/// 共享 — 信息网格（路线/游览/美食提示）
/// ══════════════════════════════════════════════════════════════════════

class InfoGrid extends StatelessWidget {
  final List<Map<String, String>> items;
  const InfoGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: items.map((item) {
            return SizedBox(
              width: (constraints.maxWidth - 10) / 2,
              child: _InfoCard(
                title: item['title']!,
                content: item['content']!,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String content;
  const _InfoCard({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 92),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.lineColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.muted,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

/// ══════════════════════════════════════════════════════════════════════
/// 共享 — 标签 Chip
/// ══════════════════════════════════════════════════════════════════════

class TagChip extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Color textColor;
  const TagChip({
    super.key,
    required this.label,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
      ),
    );
  }
}