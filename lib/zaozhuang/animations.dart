import 'package:flutter/material.dart';

/// ── 交错入场动画 ──────────────────────────────────────────────────
///
/// 子组件从下方淡入 + 上滑出现，delay 基于 index 递增
class StaggeredEntrance extends StatefulWidget {
  final int index;
  final Widget child;
  final Duration baseDelay; // 每个 item 之间的间隔
  final Duration duration;

  const StaggeredEntrance({
    Key? key,
    required this.index,
    required this.child,
    this.baseDelay = const Duration(milliseconds: 80),
    this.duration = const Duration(milliseconds: 450),
  }) : super(key: key);

  @override
  State<StaggeredEntrance> createState() => _StaggeredEntranceState();
}

class _StaggeredEntranceState extends State<StaggeredEntrance>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    // 延迟启动
    Future.delayed(widget.baseDelay * widget.index, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: widget.child,
      ),
    );
  }
}

/// ── 按压缩放反馈 ──────────────────────────────────────────────────
///
/// 包裹任意组件，点击时产生 0.95x 缩放回弹
class PressScale extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scale;

  const PressScale({
    Key? key,
    required this.child,
    this.onTap,
    this.scale = 0.95,
  }) : super(key: key);

  @override
  State<PressScale> createState() => _PressScaleState();
}

class _PressScaleState extends State<PressScale>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 120),
      vsync: this,
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: widget.scale).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails _) => _controller.forward();
  void _onTapUp(TapUpDetails _) => _controller.reverse();
  void _onTapCancel() => _controller.reverse();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _scaleAnim,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnim.value,
          child: child,
        ),
        child: widget.child,
      ),
    );
  }
}

/// ── 自定义页面路由转场 ──────────────────────────────────────────────
///
/// 页面从右侧滑入，当前页轻微缩小后退
class SlideUpRoute extends PageRouteBuilder {
  final Widget page;

  SlideUpRoute({required this.page})
      : super(
          transitionDuration: const Duration(milliseconds: 350),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 0.08);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: Curves.easeOutCubic));
            final fadeTween = Tween<double>(begin: 0.0, end: 1.0)
                .chain(CurveTween(curve: Curves.easeOut));

            return FadeTransition(
              opacity: fadeTween.animate(animation),
              child: SlideTransition(
                position: tween.animate(animation),
                child: child,
              ),
            );
          },
        );
}

/// ── 英雄式图片转场 ──────────────────────────────────────────────────
///
/// 用于从列表卡片图片 → 详情页图片的 Hero 动画
class HeroImage extends StatelessWidget {
  final String tag;
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const HeroImage({
    Key? key,
    required this.tag,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: Image.network(
          imageUrl,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (_, __, ___) => Container(
            color: Colors.grey[200],
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}

/// ── 滚动渐显 ──────────────────────────────────────────────────────
///
/// 监听滚动位置，当组件进入可视区域时淡入
class ScrollReveal extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final double revealOffset; // 触发距离（从组件顶部算起）

  const ScrollReveal({
    Key? key,
    required this.child,
    required this.controller,
    this.revealOffset = 100,
  }) : super(key: key);

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  final GlobalKey _key = GlobalKey();
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _controller.value = 0;

    widget.controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (_revealed) return;
    final renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;

    if (position.dy < screenHeight - widget.revealOffset) {
      _revealed = true;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: Container(key: _key, child: widget.child),
    );
  }
}

/// ── 呼吸浮动动画 ──────────────────────────────────────────────────
///
/// 子组件持续微微上下浮动，不同 index 错开相位
class GentleFloat extends StatefulWidget {
  final int index;
  final Widget child;
  final double amplitude; // 浮动幅度（像素）

  const GentleFloat({
    Key? key,
    required this.index,
    required this.child,
    this.amplitude = 4.0,
  }) : super(key: key);

  @override
  State<GentleFloat> createState() => _GentleFloatState();
}

class _GentleFloatState extends State<GentleFloat>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2800),
      vsync: this,
    );
    // 每个卡片错开 0.3 相位
    _controller.value = (widget.index * 0.3) % 1.0;
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _controller.value * widget.amplitude * 2 -
              widget.amplitude),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

/// ── Shimmer 骨架屏 ──────────────────────────────────────────────────
///
/// 网络图片加载时显示流光占位，替代灰色方块
class ShimmerBox extends StatefulWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final Widget? child;

  const ShimmerBox({
    Key? key,
    this.width,
    this.height,
    this.borderRadius = 12,
    this.child,
  }) : super(key: key);

  @override
  State<ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<ShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 0.5, 1.0],
              colors: [
                const Color(0xFFE8E8E8),
                const Color(0xFFF5F5F5),
                const Color(0xFFE8E8E8),
              ],
              transform:
                  _SlidingGradient(slidePercent: _controller.value),
            ),
          ),
          child: widget.child,
        );
      },
    );
  }
}

class _SlidingGradient extends GradientTransform {
  const _SlidingGradient({required this.slidePercent});
  final double slidePercent;

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * (slidePercent - 0.5) * 2, 0, 0);
  }
}

/// 图片加载占位 + Shimmer 效果
class ShimmerImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;

  const ShimmerImage({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        if (frame == null) {
          return ShimmerBox(
            width: width,
            height: height,
            borderRadius: borderRadius,
          );
        }
        // 淡入
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          child: child,
        );
      },
      errorBuilder: (_, __, ___) => ShimmerBox(
        width: width,
        height: height,
        borderRadius: borderRadius,
        child: const Icon(Icons.broken_image_rounded,
            color: Color(0xFFCCCCCC), size: 32),
      ),
    );
  }
}
