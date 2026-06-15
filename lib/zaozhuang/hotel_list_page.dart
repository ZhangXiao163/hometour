import 'package:flutter/material.dart';
import 'package:hometrour/zaozhuang/animations.dart';
import 'package:hometrour/zaozhuang/destination_page.dart';
import 'package:hometrour/zaozhuang/i18n.dart';

const Color _primary = Color(0xFFE6A800);

/// ── 酒店数据 ──────────────────────────────────────────────────────
class _Hotel {
  final String Function(String l) name;
  final String Function(String l) desc;
  final String image;
  final String price; // e.g. "200-400"
  final double rating;
  final List<String Function(String l)> tags;
  final String area;

  const _Hotel({
    required this.name,
    required this.desc,
    required this.image,
    required this.price,
    required this.rating,
    required this.tags,
    required this.area,
  });
}

Map<String, List<_Hotel>> _hotelGroups(String l) => {
      I18n.hotelArea1(l): [
        _Hotel(
          name: I18n.hotelName1,
          desc: I18n.hotelDesc1,
          image:
              'https://images.unsplash.com/photo-1566073771259-6a8506099945?w=400&auto=format&fit=crop&q=80',
          price: '280-580',
          rating: 4.8,
          tags: [I18n.hotelTagView, I18n.hotelTagBreakfast],
          area: I18n.hotelArea1(l),
        ),
        _Hotel(
          name: I18n.hotelName2,
          desc: I18n.hotelDesc2,
          image:
              'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=400&auto=format&fit=crop&q=80',
          price: '350-800',
          rating: 4.6,
          tags: [I18n.hotelTagView, I18n.hotelTagBreakfast],
          area: I18n.hotelArea1(l),
        ),
        _Hotel(
          name: I18n.hotelName3,
          desc: I18n.hotelDesc3,
          image:
              'https://images.unsplash.com/photo-1571896349842-33c89424de2d?w=400&auto=format&fit=crop&q=80',
          price: '60-120',
          rating: 4.3,
          tags: [I18n.hotelTagBudget],
          area: I18n.hotelArea1(l),
        ),
      ],
      I18n.hotelArea2(l): [
        _Hotel(
          name: I18n.hotelName4,
          desc: I18n.hotelDesc4,
          image:
              'https://images.unsplash.com/photo-1564501049412-61c2a3083791?w=400&auto=format&fit=crop&q=80',
          price: '400-900',
          rating: 4.7,
          tags: [I18n.hotelTagPool, I18n.hotelTagBreakfast],
          area: I18n.hotelArea2(l),
        ),
        _Hotel(
          name: I18n.hotelName5,
          desc: I18n.hotelDesc5,
          image:
              'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?w=400&auto=format&fit=crop&q=80',
          price: '150-300',
          rating: 4.2,
          tags: [I18n.hotelTagBudget, I18n.hotelTagBreakfast],
          area: I18n.hotelArea2(l),
        ),
        _Hotel(
          name: I18n.hotelName6,
          desc: I18n.hotelDesc6,
          image:
              'https://images.unsplash.com/photo-1596436889106-be35e843f974?w=400&auto=format&fit=crop&q=80',
          price: '120-250',
          rating: 4.0,
          tags: [I18n.hotelTagBudget, I18n.hotelTagBreakfast],
          area: I18n.hotelArea2(l),
        ),
      ],
      I18n.hotelArea3(l): [
        _Hotel(
          name: I18n.hotelName7,
          desc: I18n.hotelDesc7,
          image:
              'https://images.unsplash.com/photo-1582719508461-905c673771fd?w=400&auto=format&fit=crop&q=80',
          price: '150-350',
          rating: 4.5,
          tags: [I18n.hotelTagView, I18n.hotelTagBreakfast],
          area: I18n.hotelArea3(l),
        ),
        _Hotel(
          name: I18n.hotelName8,
          desc: I18n.hotelDesc8,
          image:
              'https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?w=400&auto=format&fit=crop&q=80',
          price: '100-250',
          rating: 4.4,
          tags: [I18n.hotelTagBudget],
          area: I18n.hotelArea3(l),
        ),
      ],
    };

/// ── 酒店列表页 ─────────────────────────────────────────────────────
class HotelListPage extends StatelessWidget {
  final String locale;
  const HotelListPage({Key? key, required this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groups = _hotelGroups(locale);
    final areas = groups.keys.toList();

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
              I18n.hotelListTitle(locale),
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A)),
            ),
            centerTitle: true,
          ),
          ...areas.asMap().entries.map((entry) {
            final areaIdx = entry.key;
            final area = entry.value;
            final hotels = groups[area]!;

            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (areaIdx > 0) const SizedBox(height: 8),
                    // 区域标题
                    Row(
                      children: [
                        Container(
                          width: 4,
                          height: 18,
                          decoration: BoxDecoration(
                            color: _primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          area,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${hotels.length} ${locale == 'ko' ? '곳' : '家'}',
                          style: const TextStyle(
                              fontSize: 13, color: Color(0xFF909090)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // 酒店卡片
                    ...List.generate(hotels.length, (i) {
                      return StaggeredEntrance(
                        index: areaIdx * 3 + i,
                        child: _HotelCard(hotel: hotels[i], locale: locale),
                      );
                    }),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          }),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}

class _HotelCard extends StatelessWidget {
  final _Hotel hotel;
  final String locale;

  const _HotelCard({required this.hotel, required this.locale});

  @override
  Widget build(BuildContext context) {
    return PressScale(
      onTap: () {
        // 跳转酒店攻略详情
        Navigator.push(
          context,
          SlideUpRoute(
            page: DestinationPage(config: allConfigs[4], locale: locale),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 3)),
          ],
        ),
        child: Row(
          children: [
            // 左侧图片
            ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(16)),
              child: Image.network(
                hotel.image,
                width: 110,
                height: 130,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Container(width: 110, height: 130, color: Colors.grey[200]),
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
                            hotel.name(locale),
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1A1A1A)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.star_rounded,
                            color: _primary, size: 15),
                        Text(
                          '${hotel.rating}',
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: _primary),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      hotel.desc(locale),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF909090),
                          height: 1.4),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    // 标签
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: hotel.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 2),
                          decoration: BoxDecoration(
                            color: _primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            tag(locale),
                            style: const TextStyle(
                                fontSize: 10,
                                color: _primary,
                                fontWeight: FontWeight.w600),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 8),
                    // 价格
                    Text(
                      locale == 'ko'
                          ? '₩${hotel.price}만원부터'
                          : '¥${hotel.price} 起',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFE85454),
                      ),
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
}
