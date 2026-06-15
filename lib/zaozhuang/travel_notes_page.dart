import 'package:flutter/material.dart';
import 'package:hometrour/zaozhuang/animations.dart';
import 'package:hometrour/zaozhuang/i18n.dart';

const Color _primary = Color(0xFFE6A800);

/// ── 游记详情数据模型 ────────────────────────────────────────────────

class _NoteDay {
  final String Function(String l) title;
  final List<String Function(String l)> paragraphs;
  final List<String> images;

  const _NoteDay({
    required this.title,
    required this.paragraphs,
    required this.images,
  });
}

class _TravelNote {
  final String Function(String l) title;
  final String Function(String l) date;
  final String coverImage;
  final String authorAvatar;
  final List<_NoteDay> days;
  final String Function(String l) tip;
  final int likes;
  final int comments;
  final List<String Function(String l)> tags;

  const _TravelNote({
    required this.title,
    required this.date,
    required this.coverImage,
    required this.authorAvatar,
    required this.days,
    required this.tip,
    required this.likes,
    required this.comments,
    required this.tags,
  });
}

// ── 游记数据 ──────────────────────────────────────────────────────
List<_TravelNote> _notes(String l) => [
      // ─── 游记 1：台儿庄古城两日漫游记 ────────────────────────
      _TravelNote(
        title: I18n.note1Title,
        date: I18n.note1Date,
        coverImage:
            'https://images.unsplash.com/photo-1594348224200-0c3144e7e7cb?q=80&w=1548&auto=format&fit=crop',
        authorAvatar:
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100&auto=format&fit=crop&q=60',
        likes: 128,
        comments: 36,
        tags: [
          (l) => l == 'ko' ? '고성' : '古城',
          (l) => l == 'ko' ? '수향' : '水乡',
          (l) => l == 'ko' ? '야경' : '夜景',
        ],
        tip: (l) => l == 'ko'
            ? '성 내 객잔은 미리 예약 필수! 객잔에 투숙하면 야간 조명이 꺼진 후에도 고성을 거닐 수 있어 완전히 다른 경험을 할 수 있습니다.'
            : '古城内客栈一定要提前预订！住客栈可以等游客散尽后独自漫步，感受真正宁静的古城。',
        days: [
          _NoteDay(
            title: (l) => l == 'ko' ? '고성과의 첫 만남' : '初见古城',
            paragraphs: [
              (l) => l == 'ko'
                  ? '아침 7시, 지난에서 출발하는 고속열차에 올랐다. 약 1시간 30분 후 짜오좡 역에 도착. 역에서 나와 택시로 약 30분, 드디어 타이얼좡 고성의 동문 앞에 섰다. 성벽을 마주한 순간, 시간 여행이 시작된 듯한 착각이 들었다. 높은 성벽, 웅장한 문루, 그리고 성문을 들어서자 펼쳐지는 수로와 고택들... 모든 것이 영화 세트장 같았다.'
                  : '早上七点，我从济南搭乘高铁出发。约一个半小时后抵达枣庄站，再转乘出租车约30分钟，终于站在了台儿庄古城的东门前。仰望巍峨的城楼，深灰色的墙砖上爬满了岁月的苔痕。跨过门槛的瞬间，仿佛一脚踏进了明清运河商埠的繁华旧梦。',
              (l) => l == 'ko'
                  ? '오전에는 수로를 따라 천천히 산책했다. 양안의 건축물은 각기 다른 스타일을 자랑한다 — 루난식 청석판 집, 민난식 붉은 벽돌 건물, 심지어 유럽풍 작은 양옥까지! 하나의 고성 안에 이렇게 다양한 건축 양식이 공존하다니 정말 놀라웠다. 길모퉁이에서는 할머니가 수제 부채를 만들고 계셨고, 다리 위에서는 한복을 입은 젊은이들이 사진을 찍고 있었다.'
                  : '上午沿着主水道慢走，两岸建筑风格迥异——鲁南的青砖黛瓦、闽南的燕尾脊、徽派的白墙飞檐，还有几栋当年外商留下的西式小楼。一座古城里竟藏着半部中国建筑史。每走几步就有一座小石桥，桥下摇橹船悠悠划过，船娘的歌声在水巷间回荡。',
              (l) => l == 'ko'
                  ? '저녁 무렵, 등불이 하나둘 켜지기 시작했다. 처음에는 동문 순허 거리의 홍등 몇 개, 이내 점점 더 많은 등불이 수로 양안을 따라 꼬리에 꼬리를 물고 밝혀졌다. 해가 완전히 지자, 고성 전체가 따뜻한 등불 빛에 잠겼다. 수면에 비친 등불의 그림자가 반짝이고, 멀리서 노래 소리가 은은하게 들려왔다. 이건 정말 꿈속에 들어온 듯한 기분이었다.'
                  : '傍晚时分，灯笼一盏接一盏地亮了起来。先是东门顺河街的一排红灯笼，接着是整个水巷两岸次第点亮。天色完全暗下来后，整座古城笼罩在一片温暖的灯火之中。水面倒映着灯光，摇橹船缓缓划过，船上的煤油灯在水波中摇曳。我站在石桥上看了许久，觉得这画面比任何照片都美。',
            ],
            images: [
              'https://images.unsplash.com/photo-1594348224200-0c3144e7e7cb?q=80&w=1548&auto=format&fit=crop',
              'https://images.unsplash.com/photo-1543097692-fa13c6cd8595?w=600&auto=format&fit=crop&q=80',
            ],
          ),
          _NoteDay(
            title: (l) => l == 'ko' ? '조용한 아침과 작별' : '静谧清晨与告别',
            paragraphs: [
              (l) => l == 'ko'
                  ? '둘째 날, 나는 일부러 새벽 6시에 일어났다. 관광객이 아직 들어오지 않은 고성은 완전히 다른 세상이었다. 청석판 길에 어제의 번잡함은 온데간데없고, 몇몇 현지 노인들이 문 앞에서 차를 마시며 수다를 떨고 있을 뿐. 수면에는 아침 안개가 자욱하게 피어오르고, 멀리서 배를 젓는 소리만 들려왔다.'
                  : '第二天特意起了个大早，六点就出了客栈。游客还没涌入的古城完全是另一副模样——青石板路恢复了它原本的安静，几个当地老人在自家门口泡茶聊天，水面上晨雾氤氲，远处只有船桨划水的轻响。我沿着水巷从东走到西，拍下了此行最满意的几张照片。',
              (l) => l == 'ko'
                  ? '오전에는 타이얼좡 전쟁 기념관을 방문했다. 고성의 로맨틱한 분위기와는 완전히 다른 엄숙함이 감도는 곳이었다. 전시된 사진과 유물들은 이 아름다운 고성에서 1938년에 얼마나 치열한 전투가 벌어졌는지 말해주고 있었다. 기념관을 나오며, 이 고성이 단지 아름다운 관광지가 아니라 용기와 불굴의 상징이라는 것을 깨달았다.'
                  : '上午参观了台儿庄大战纪念馆。与古城的浪漫柔美截然不同，这里弥漫着庄严肃穆的气氛。一张张老照片、一件件斑驳的文物，诉说着1938年那场惊心动魄的战役。走出纪念馆，再看古城的一砖一瓦，心里多了几分敬意——这里不只是游人的打卡地，更是一片浸透了热血与勇气的土地。',
            ],
            images: [
              'https://images.unsplash.com/photo-1508672019048-805c876b67e2?w=400&auto=format&fit=crop&q=80',
            ],
          ),
        ],
      ),

      // ─── 游记 2：微山湖观鸟日记 ────────────────────────────
      _TravelNote(
        title: I18n.note2Title,
        date: I18n.note2Date,
        coverImage:
            'https://images.unsplash.com/photo-1670416826299-f58110eab9a4?q=80&w=1740&auto=format&fit=crop',
        authorAvatar:
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&auto=format&fit=crop&q=60',
        likes: 97,
        comments: 24,
        tags: [
          (l) => l == 'ko' ? '자연' : '自然',
          (l) => l == 'ko' ? '조류 관찰' : '观鸟',
          (l) => l == 'ko' ? '연꽃' : '荷花',
        ],
        tip: (l) => l == 'ko'
            ? '아침 일출 전에 도착하는 것이 핵심! 새벽 5시 반까지는 관조탑에 올라가 있어야 최고의 장면을 볼 수 있습니다. 긴팔 옷과 모자, 모기 기피제는 필수입니다!'
            : '一定要在日出前到达！清晨5点半之前登上观鸟塔，才能看到最壮观的鸟群起飞。带长袖外套和帽子，湖边清晨蚊虫很多！',
        days: [
          _NoteDay(
            title: (l) => l == 'ko' ? '새벽과 조류의 향연' : '破晓与鸟群的盛宴',
            paragraphs: [
              (l) => l == 'ko'
                  ? '새벽 4시 반, 알람이 울렸다. 솔직히 이렇게 일찍 일어나는 건 오랜만이었다. 하지만 웨이산호의 일출 조류 관찰은 절대 놓칠 수 없다는 것을 알고 있었다. 5시 반, 나는 이미 습지 공원의 관조탑에 올라 카메라를 세팅해 두었다. 동쪽 하늘이 서서히 밝아지기 시작하자, 갈대 숲 속에서 웅성거리는 소리가 들려왔다.'
                  : '凌晨四点半，闹钟响了。说实话我已经很久没这么早起了。但微山湖的日出观鸟绝对不能错过。五点半，我已经站在湿地公园的观鸟塔上架好了长焦镜头。东方的天际线开始泛白的时候，芦苇荡深处传来了窸窣的响动——鸟群要起飞了。',
              (l) => l == 'ko'
                  ? '해가 수평선에서 솟아오르는 순간, 수천 마리의 새들이 일제히 갈대 숲에서 날아올랐다. 백로, 왜가리, 가마우지, 물총새... 나는 셔터를 누르는 것조차 잊고 멍하니 바라보고 있었다. 새들의 날갯짓 소리가 마치 폭포수처럼 우렁차게 들렸다. 이건 단연코 내 인생 최고의 조류 관찰 경험이었다.'
                  : '太阳跃出地平线的那一刻，数千只水鸟从芦苇荡中同时起飞。白鹭、苍鹭、鸬鹚、翠鸟...我甚至忘了按快门，只是呆呆地看着。它们在空中盘旋、变换队形，翅膀扑打的声音如同瀑布轰鸣。晨光透过鸟群的间隙洒在水面上，整个画面美得令人窒息——这是我见过的最壮观的鸟类起飞场面。',
              (l) => l == 'ko'
                  ? '아침 9시가 지나자 관광객들이 점점 늘어나기 시작했다. 나는 관조탑을 내려와 연꽃 정원으로 향했다. 7월의 웨이산호는 만무 연꽃이 한창이었다. 연잎은 하늘을 덮을 듯 끝없이 펼쳐져 있고, 분홍색과 흰색 연꽃이 그 사이에서 고개를 내밀고 있었다. "接天莲叶无穷碧, 映日荷花别样红"이라는 시구가 바로 이런 광경을 두고 한 말이구나 하는 생각이 들었다.'
                  : '上午九点过后，游客渐渐多了起来。我从观鸟塔下来，沿木栈道往荷花精品园走去。七月的微山湖，万亩荷花正值盛放。接天的莲叶像绿色的海洋，粉的白的荷花从叶间探出头来，蜻蜓在花瓣上停留，空气中弥漫着淡淡的清香。"接天莲叶无穷碧，映日荷花别样红"，我终于亲眼见到了这首诗里的画面。',
            ],
            images: [
              'https://images.unsplash.com/photo-1670416826299-f58110eab9a4?q=80&w=1740&auto=format&fit=crop',
              'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=400&auto=format&fit=crop&q=80',
            ],
          ),
          _NoteDay(
            title: (l) => l == 'ko' ? '호수 탐험과 붉은 기억' : '泛舟湖上与红色记忆',
            paragraphs: [
              (l) => l == 'ko'
                  ? '점심으로 어부 가족이 운영하는 작은 식당에서 갓 잡은 생선으로 만든 전통 요리를 맛보았다. 특히 생선찜이 일품이었는데, 간단한 조리법에 간장과 파만으로 양념했을 뿐인데 호수의 신선한 맛이 그대로 살아 있었다. 식사 후에는 배를 타고 호수 깊숙이 들어가 갈대 미로를 탐험했다.'
                  : '中午在渔家乐吃了一顿地道的全鱼宴。清蒸、红烧、炖汤、油炸——一条鱼四种吃法，每种都鲜得让人咂舌。饭后乘上一艘木质渔船，在船老大的带领下穿过芦苇迷宫。水道窄得刚好容一条船通过，两边的芦苇比人还高，偶尔有翠鸟从芦秆上俯冲入水捕鱼。',
              (l) => l == 'ko'
                  ? '오후에는 웨이산 섬의 철도유격대 기념관을 방문했다. 이곳은 항일 전쟁 시기 유명한 철도유격대의 주요 활동 기지였다. 전시관에는 당시 게릴라들이 사용했던 무기와 생활용품, 그리고 그들의 용감한 전투를 기록한 사진들이 전시되어 있었다. 아름다운 호수 경치 뒤에 이런 감동적인 혁명 역사가 숨어 있다니, 웨이산호는 정말 다층적인 매력을 가진 곳이다.'
                  : '下午登上了微山岛，参观了铁道游击队纪念馆。这里曾是抗战时期铁道游击队的重要根据地，电影《铁道游击队》里那些扒火车、炸桥梁的故事就发生在这片水域。纪念馆里陈列着游击队员们用过的驳壳枪、煤油灯和发黄的作战地图。走出纪念馆眺望湖面，很难想象这片宁静美丽的水域曾经历过那样的烽火岁月。',
            ],
            images: [
              'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=600&auto=format&fit=crop&q=80',
            ],
          ),
        ],
      ),

      // ─── 游记 3：石榴园游记 ────────────────────────────────
      _TravelNote(
        title: I18n.note3Title,
        date: I18n.note3Date,
        coverImage:
            'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=600&auto=format&fit=crop&q=80',
        authorAvatar:
            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&auto=format&fit=crop&q=60',
        likes: 156,
        comments: 42,
        tags: [
          (l) => l == 'ko' ? '꽃놀이' : '赏花',
          (l) => l == 'ko' ? '석류' : '石榴',
          (l) => l == 'ko' ? '사진' : '摄影',
        ],
        tip: (l) => l == 'ko'
            ? '5월 중하순이 최고의 꽃놀이 시즌입니다! 흰색 또는 연한 색상의 옷을 입고 가면 붉은 꽃밭에서 사진이 특히 예쁘게 나옵니다. 평일 아침 일찍 가면 사람이 적어 더욱 좋습니다.'
            : '5月中下旬是最佳赏花期！穿白色或浅色衣服在红色花海中拍照特别出片。建议工作日早上去，游客少，整片花海都是你的。',
        days: [
          _NoteDay(
            title: (l) => l == 'ko' ? '불타는 꽃의 바다' : '火焰般绽放的花海',
            paragraphs: [
              (l) => l == 'ko'
                  ? '5월 18일, 나는 마침내 오랫동안 기다려온 관세석류원에 도착했다. 입구에서부터 산 전체를 붉게 물들인 석류꽃이 한눈에 들어왔다. 가까이서 보니 석류꽃 한 송이 한 송이가 마치 작은 주름치마처럼 우아했다. 정원 안내원의 설명에 따르면 이곳에는 500만 그루 이상의 석류나무가 있으며, 대청피, 대홍포 등 50여 종의 품종이 있다고 한다.'
                  : '五月十八日，我终于来到了向往已久的冠世榴园。从入口望去，漫山遍野的石榴花像一片燃烧的红色海洋。走近看，每一朵石榴花都像一条精致的百褶裙——花瓣边缘带着自然的波浪，橙红渐变色的花心围着一圈金色花蕊。园区导游说这里有超过500万株石榴树，大青皮、大红袍、三白石榴等50多个品种。',
              (l) => l == 'ko'
                  ? '가장 아름다웠던 곳은 백년 고목 구역이었다. 굵은 줄기와 울퉁불퉁한 가지를 가진 백년 넘은 석류나무들이 있었는데, 나무껍질에는 세월의 흔적이 고스란히 새겨져 있었다. 그런데 놀랍게도 이렇게 오래된 나무들이 여전히 가장 아름다운 꽃을 피우고 있었다. 마치 나이 든 화가가 가장 찬란한 색채를 캔버스에 쏟아내듯이. 나는 이 노수들의 생명력에 깊은 감동을 받았다.'
                  : '最震撼的是百年古树区。那些树干粗壮、枝干虬曲的老石榴树，树龄都在百年以上。树皮上刻满了岁月的沟壑，但每一棵老树都依然开满了鲜艳的花朵。有一棵据说已超过300年的"石榴王"，树干需要三人合抱，但枝头依然缀满了火红的花朵——就像一位白发苍苍的老画家，依然在用最热烈的色彩作画。',
            ],
            images: [
              'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=600&auto=format&fit=crop&q=80',
              'https://images.unsplash.com/photo-1590502165527-46d2c2d02138?w=400&auto=format&fit=crop&q=80',
            ],
          ),
          _NoteDay(
            title: (l) => l == 'ko' ? '석류의 맛과 추억' : '舌尖上的石榴记忆',
            paragraphs: [
              (l) => l == 'ko'
                  ? '오후에는 공원 내 다실에서 석류꽃으로 만든 차를 맛보았다. 옅은 분홍빛 차에서 은은한 꽃향기가 났다. 직원의 추천으로 석류꿀 한 병과 석류주 두 병을 샀다. 특히 석류주는 달콤하면서도 산뜻한 맛이 매력적이었다. 선물용으로 제격인 물건들이었다.'
                  : '下午在园内的茶室品了一杯石榴花茶，淡粉色的茶汤带着清雅的花香。茶室的小姑娘推荐我买了石榴蜜和石榴酒——蜜是石榴花蜜，酒是用去年秋天的石榴酿的。临走时我买了两瓶石榴酒、一罐石榴蜜，还挑了几块石榴皂当伴手礼。',
              (l) => l == 'ko'
                  ? '해가 지기 시작하자, 노을이 석류꽃 바다를 한층 더 붉게 물들였다. 나는 천천히 공원을 나서며, 가을에 꼭 다시 와서 석류 수확을 체험하겠다고 다짐했다. 붉은 꽃이 가득한 5월도, 열매가 주렁주렁 달린 9월도 각자의 매력이 있을 것이다. 이 작은 도시의 매력에 푹 빠진 하루였다.'
                  : '下山时夕阳正好，晚霞把石榴花海染得更红了。我想，九月份石榴成熟的季节一定还要再来一次——那时候满园的石榴果像红灯笼一样挂满枝头，应该又是另一番景象。坐在回城的车上，翻看着相机里满满的照片，心里已经在计划下一次的枣庄之行了。',
            ],
            images: [
              'https://images.unsplash.com/photo-1601275868399-d3c0c2d6f92c?w=400&auto=format&fit=crop&q=80',
            ],
          ),
        ],
      ),
    ];

/// ── 游记列表页 ─────────────────────────────────────────────────────
class TravelNotesPage extends StatelessWidget {
  final String locale;
  const TravelNotesPage({Key? key, required this.locale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notes = _notes(locale);
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
              I18n.travelNotesTitle(locale),
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
                  child: _NoteCard(
                      note: notes[index], locale: locale, index: index),
                ),
                childCount: notes.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

/// ── 列表卡片 ──────────────────────────────────────────────────────
class _NoteCard extends StatelessWidget {
  final _TravelNote note;
  final String locale;
  final int index;

  const _NoteCard({
    required this.note,
    required this.locale,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    // 预览：取第一天的第一段的前若干字
    final preview = note.days.isNotEmpty &&
            note.days.first.paragraphs.isNotEmpty
        ? note.days.first.paragraphs.first(locale)
        : '';
    final shortPreview = preview.length > 80
        ? '${preview.substring(0, 80)}...'
        : preview;

    return PressScale(
      onTap: () {
        Navigator.push(
          context,
          SlideUpRoute(
            page: TravelNoteDetailPage(note: note, locale: locale),
          ),
        );
      },
      child: Container(
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
                    note.coverImage,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Container(height: 200, color: Colors.grey[200]),
                  ),
                  // 渐变 + 标题
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 18,
                    right: 18,
                    child: Text(
                      note.title(locale),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  // 天数角标
                  Positioned(
                    top: 14,
                    right: 14,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: _primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        locale == 'ko'
                            ? '${note.days.length}일 여행'
                            : '${note.days.length}日游',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 作者行
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(note.authorAvatar),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        I18n.noteAuthor(locale),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A1A1A)),
                      ),
                      Text(
                        note.date(locale),
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xFF909090)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  _StatChip(
                      icon: Icons.favorite_border_rounded,
                      label: I18n.likeCount(locale, note.likes)),
                  const SizedBox(width: 12),
                  _StatChip(
                      icon: Icons.chat_bubble_outline_rounded,
                      label: I18n.commentCount(locale, note.comments)),
                ],
              ),
            ),
            // 预览文字
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 0),
              child: Text(
                shortPreview,
                style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6A6A6A),
                    height: 1.6),
              ),
            ),
            // 标签 + 查看详情
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 12, 18, 16),
              child: Row(
                children: [
                  ...note.tags.map((tag) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: _primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            tag(locale),
                            style: const TextStyle(
                                fontSize: 11,
                                color: _primary,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                  const Spacer(),
                  Text(
                    locale == 'ko' ? '전체 보기 →' : '阅读全文 →',
                    style: const TextStyle(
                        fontSize: 13,
                        color: _primary,
                        fontWeight: FontWeight.w600),
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

/// ── 游记详情页 ─────────────────────────────────────────────────────
class TravelNoteDetailPage extends StatelessWidget {
  final _TravelNote note;
  final String locale;

  const TravelNoteDetailPage({
    Key? key,
    required this.note,
    required this.locale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // 头图
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: const Color(0xFFF8F9FB),
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
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
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    note.coverImage,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Container(color: Colors.grey[300]),
                  ),
                  Container(
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
                    bottom: 20,
                    left: 24,
                    right: 24,
                    child: Text(
                      note.title(locale),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // 正文
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFFF8F9FB),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // 作者信息栏
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(note.authorAvatar),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                I18n.noteAuthor(locale),
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1A1A1A)),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                note.date(locale),
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF909090)),
                              ),
                            ],
                          ),
                        ),
                        _StatChip(
                            icon: Icons.favorite_border_rounded,
                            label: I18n.likeCount(locale, note.likes)),
                        const SizedBox(width: 14),
                        _StatChip(
                            icon: Icons.chat_bubble_outline_rounded,
                            label: I18n.commentCount(locale, note.comments)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // 每天的内容
                  ...note.days.asMap().entries.map((entry) {
                    final dayIdx = entry.key;
                    final day = entry.value;
                    return _DaySection(
                      day: day,
                      dayIndex: dayIdx,
                      locale: locale,
                    );
                  }),
                  const SizedBox(height: 20),
                  // Tips
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _primary.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                          color: _primary.withOpacity(0.2), width: 0.8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.lightbulb_outline_rounded,
                            size: 18, color: _primary),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            note.tip(locale),
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF5A5A5A),
                                height: 1.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ── 单日内容区 ────────────────────────────────────────────────────
class _DaySection extends StatelessWidget {
  final _NoteDay day;
  final int dayIndex;
  final String locale;

  const _DaySection({
    required this.day,
    required this.dayIndex,
    required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Day 标题
        Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                I18n.dayLabel(locale, dayIndex + 1),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              day.title(locale),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        // 段落
        ...day.paragraphs.map((p) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Text(
              p(locale),
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF3A3A3A),
                height: 1.9,
                letterSpacing: 0.3,
              ),
            ),
          );
        }),
        // 图片
        if (day.images.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: 200,
              child: Row(
                children: List.generate(
                  day.images.length > 2 ? 2 : day.images.length,
                  (i) => Expanded(
                    flex: i == 0 && day.images.length > 1 ? 3 : 2,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: i == 0 ? 0 : 6, right: i == 0 ? 6 : 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          day.images[i],
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                              color: Colors.grey[200]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _StatChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: const Color(0xFFB0B0B0)),
        const SizedBox(width: 4),
        Text(label,
            style:
                const TextStyle(fontSize: 12, color: Color(0xFFB0B0B0))),
      ],
    );
  }
}
