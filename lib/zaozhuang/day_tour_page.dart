import 'package:flutter/material.dart';
import 'package:hometrour/zaozhuang/animations.dart';
import 'package:hometrour/zaozhuang/i18n.dart';

const Color _primary = Color(0xFFE6A800);

/// ── 一日游数据 ────────────────────────────────────────────────────
class _TourStep {
  final String time;
  final String title;
  final String desc;
  final IconData icon;

  const _TourStep({
    required this.time,
    required this.title,
    required this.desc,
    required this.icon,
  });
}

class _DayTour {
  final String Function(String l) title;
  final String Function(String l) desc;
  final String image;
  final String duration;
  final String transport;
  final String budget;
  final String tip;
  final Color color;
  final List<_TourStep> steps;

  const _DayTour({
    required this.title,
    required this.desc,
    required this.image,
    required this.duration,
    required this.transport,
    required this.budget,
    required this.tip,
    required this.color,
    required this.steps,
  });
}

List<_DayTour> _tours(String l) => [
      _DayTour(
        title: I18n.tour1Title,
        desc: I18n.tour1Desc,
        image:
            'https://images.unsplash.com/photo-1594348224200-0c3144e7e7cb?q=80&w=1548&auto=format&fit=crop',
        duration: l == 'ko' ? '08:00 – 21:00 (13시간)' : '08:00 – 21:00（约13小时）',
        transport: l == 'ko' ? '도보 + 노 젓는 배' : '步行 + 摇橹船',
        budget: l == 'ko' ? '약 300-500위안/인' : '约 300-500 元/人',
        tip: l == 'ko'
            ? '편안한 운동화 착용 권장, 하루 종일 걸어야 함. 저녁에는 반드시 배를 타고 야간 유람을 즐기세요!'
            : '建议穿舒适的平底鞋，全天步行较多。晚上一定要坐摇橹船夜游！',
        color: const Color(0xFFE85454),
        steps: const [
          _TourStep(time: '08:00', title: '古城东门入城', desc: '在城门外的早餐铺来一碗羊肉汤+烧饼', icon: Icons.login_rounded),
          _TourStep(time: '09:00', title: '参将署 & 天后宫', desc: '看明清衙门文化与闽南木雕', icon: Icons.account_balance_rounded),
          _TourStep(time: '11:30', title: '船形街午餐', desc: '推荐运河鲤鱼、辣子鸡', icon: Icons.restaurant_rounded),
          _TourStep(time: '14:00', title: '大战纪念馆', desc: '了解台儿庄战役历史', icon: Icons.museum_rounded),
          _TourStep(time: '16:30', title: '摇橹船游内河', desc: '听船娘唱鲁南小调', icon: Icons.sailing_rounded),
          _TourStep(time: '19:00', title: '夜游古城灯会', desc: '打铁花表演，红灯笼映水巷', icon: Icons.nightlight_rounded),
        ],
      ),
      _DayTour(
        title: I18n.tour2Title,
        desc: I18n.tour2Desc,
        image:
            'https://images.unsplash.com/photo-1670416826299-f58110eab9a4?q=80&w=1740&auto=format&fit=crop',
        duration: l == 'ko' ? '06:30 – 18:00 (11.5시간)' : '06:30 – 18:00（约11.5小时）',
        transport: l == 'ko' ? '관광버스 + 유람선' : '旅游大巴 + 游船',
        budget: l == 'ko' ? '약 200-350위안/인' : '约 200-350 元/人',
        tip: l == 'ko'
            ? '망원경과 방충제를 꼭 챙기세요! 아침 해 뜰 무렵이 조류 관찰 최적기입니다.'
            : '早起必备望远镜和防蚊喷雾！清晨日出前后是观鸟最佳时段。',
        color: const Color(0xFF3CBD6E),
        steps: const [
          _TourStep(time: '06:30', title: '湿地公园入口集合', desc: '趁日出前抵达观鸟塔', icon: Icons.wb_twilight_rounded),
          _TourStep(time: '07:00', title: '观鸟塔拍摄', desc: '长焦镜头抓拍白鹭、苍鹭', icon: Icons.photo_camera_rounded),
          _TourStep(time: '09:30', title: '荷花精品园', desc: '万亩荷花盛开，接天莲叶无穷碧', icon: Icons.local_florist_rounded),
          _TourStep(time: '12:00', title: '渔家全鱼宴', desc: '现捕现做的鲜美湖鱼', icon: Icons.set_meal_rounded),
          _TourStep(time: '14:00', title: '游船探芦苇迷宫', desc: '深入芦苇荡寻鸟', icon: Icons.directions_boat_rounded),
          _TourStep(time: '16:30', title: '铁道游击队纪念馆', desc: '了解红色历史', icon: Icons.flag_rounded),
        ],
      ),
      _DayTour(
        title: I18n.tour3Title,
        desc: I18n.tour3Desc,
        image:
            'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=400&auto=format&fit=crop&q=80',
        duration: l == 'ko' ? '08:00 – 20:30 (12.5시간)' : '08:00 – 20:30（约12.5小时）',
        transport: l == 'ko' ? '도보 + 택시' : '步行 + 出租车',
        budget: l == 'ko' ? '약 150-250위안/인' : '约 150-250 元/人',
        tip: l == 'ko'
            ? '공복으로 출발하세요! 매운 음식을 못 드시는 분은 미리 "살짝 맵게"라고 요청하세요.'
            : '空腹出发！不能吃辣的记得跟店家说"微辣"。',
        color: const Color(0xFFF08040),
        steps: const [
          _TourStep(time: '08:00', title: '西集羊肉汤', desc: '枣庄人的第一碗汤，清晨5点开熬', icon: Icons.soup_kitchen_rounded),
          _TourStep(time: '10:00', title: '菜煎饼探店', desc: '路边小摊最地道，外酥里嫩', icon: Icons.breakfast_dining_rounded),
          _TourStep(time: '12:00', title: '辣子鸡午餐', desc: '枣庄辣子鸡 + 石榴叶茶', icon: Icons.local_fire_department_rounded),
          _TourStep(time: '14:30', title: '特产采购', desc: '石榴酒、山亭花椒、咸鸭蛋', icon: Icons.shopping_bag_rounded),
          _TourStep(time: '17:30', title: '台儿庄美食街', desc: '运河鲤鱼、煎饼卷大葱', icon: Icons.food_bank_rounded),
          _TourStep(time: '19:30', title: '夜市烧烤', desc: '古城夜市烧烤配石榴酒', icon: Icons.nightlife_rounded),
        ],
      ),
    ];

/// ── 一日游列表页 ──────────────────────────────────────────────────
class DayTourPage extends StatelessWidget {
  final String locale;
  const DayTourPage({Key? key, required this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tours = _tours(locale);
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
                      offset: const Offset(0, 2)),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    size: 18, color: Color(0xFF1A1A1A)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            title: Text(
              I18n.dayTourTitle(locale),
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A)),
            ),
            centerTitle: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => StaggeredEntrance(
                  index: index,
                  baseDelay: const Duration(milliseconds: 100),
                  child: _TourCard(tour: tours[index], locale: locale),
                ),
                childCount: tours.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

class _TourCard extends StatefulWidget {
  final _DayTour tour;
  final String locale;
  const _TourCard({required this.tour, required this.locale});

  @override
  State<_TourCard> createState() => _TourCardState();
}

class _TourCardState extends State<_TourCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final t = widget.tour;
    final l = widget.locale;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 头图
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18)),
            child: Stack(
              children: [
                Image.network(
                  t.image,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Container(height: 160, color: Colors.grey[200]),
                ),
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.55),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 18,
                  child: Text(
                    t.title(l),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  right: 14,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: t.color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      t.desc(l),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 概要信息
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 16, 18, 0),
            child: Row(
              children: [
                _InfoChip(
                    icon: Icons.timer_outlined,
                    label: t.duration,
                    color: t.color),
                const SizedBox(width: 16),
                _InfoChip(
                    icon: Icons.directions_bus_rounded,
                    label: t.transport,
                    color: t.color),
                const SizedBox(width: 16),
                _InfoChip(
                    icon: Icons.attach_money_rounded,
                    label: t.budget,
                    color: t.color),
              ],
            ),
          ),
          // 时间轴
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 20, 18, 0),
            child: Column(
              children: List.generate(
                _expanded ? t.steps.length : 3,
                (i) => _TimelineItem(
                  step: t.steps[i],
                  color: t.color,
                  isFirst: i == 0,
                  isLast: i == (_expanded ? t.steps.length - 1 : 2),
                ),
              ),
            ),
          ),
          // 展开/收起
          if (t.steps.length > 3)
            GestureDetector(
              onTap: () => setState(() => _expanded = !_expanded),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _expanded
                          ? (l == 'ko' ? '접기' : '收起')
                          : (l == 'ko'
                              ? '${t.steps.length - 3}개 더 보기'
                              : '展开剩余 ${t.steps.length - 3} 项'),
                      style: TextStyle(
                          fontSize: 13,
                          color: t.color,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      _expanded
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 18,
                      color: t.color,
                    ),
                  ],
                ),
              ),
            ),
          // Tips
          Container(
            margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: t.color.withOpacity(0.06),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.lightbulb_outline_rounded,
                    size: 16, color: t.color),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${I18n.tourTipLabel(l)}：${t.tip}',
                    style: TextStyle(
                        fontSize: 12, color: t.color, height: 1.5),
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

/// 时间轴单项
class _TimelineItem extends StatelessWidget {
  final _TourStep step;
  final Color color;
  final bool isFirst;
  final bool isLast;

  const _TimelineItem({
    required this.step,
    required this.color,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 时间 & 竖线
          SizedBox(
            width: 48,
            child: Column(
              children: [
                Text(
                  step.time,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: color),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      color: color.withOpacity(0.2),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          // 圆点 + 内容
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  top: isFirst ? 0 : 2, bottom: isLast ? 4 : 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 6, right: 12),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: color, width: 2.5),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step.title,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A1A)),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          step.desc,
                          style: const TextStyle(
                              fontSize: 12, color: Color(0xFF909090)),
                        ),
                      ],
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

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color.withOpacity(0.7)),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: color.withOpacity(0.8)),
        ),
      ],
    );
  }
}
