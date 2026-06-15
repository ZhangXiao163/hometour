import 'package:flutter/material.dart';
import 'package:hometrour/zaozhuang/i18n.dart';

class NantongArticlePage extends StatefulWidget {
  const NantongArticlePage({Key? key}) : super(key: key);

  @override
  _NantongArticlePageState createState() => _NantongArticlePageState();
}

class _NantongArticlePageState extends State<NantongArticlePage> {
  int _selectedIndex = 0;
  int _currentImageIndex = 0;
  late PageController _pageController;

  String _t(String zh, String ko) => AppLocale.instance.isKo ? ko : zh;

  List<String> get _categories => [
        _t('家乡简介', '고향 소개'),
        _t('旅游景点', '관광 명소'),
        _t('代表美食', '대표 음식'),
        _t('推荐路线', '추천 코스'),
      ];

  /// 轮播图图片列表（全部使用本地图片）
  /// 请将图片放入 assets/images/ 目录，并按以下命名放置
  final Map<int, List<String>> _carouselImages = {
    0: [
      'assets/nantong_images/nantong.jpg',
      'assets/nantong_images/river.jpg',
    ],
    1: [
      'assets/nantong_images/mountain.jpg',
    ],
    2: [
      'assets/nantong_images/food.jpg',
      'assets/nantong_images/food1.jpg',
    ],
    3: [
      'assets/nantong_images/jiang.jpg',
      'assets/nantong_images/jiang1.jpg',
    ],
  };

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // 自动轮播
    Future.delayed(Duration.zero, () {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          (_currentImageIndex + 1) % _carouselImages[_selectedIndex]!.length,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        ).then((_) {
          Future.delayed(const Duration(seconds: 4), () {
            if (mounted) {
              _currentImageIndex =
                  (_currentImageIndex + 1) % _carouselImages[_selectedIndex]!.length;
              _startAutoScroll();
            }
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppLocale.instance,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCarouselHeader(),
                    _buildCategoryTabs(),
                    _buildArticleContent(),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 10,
                left: 16,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCarouselHeader() {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentImageIndex = index;
          });
        },
        itemCount: _carouselImages[_selectedIndex]!.length,
        itemBuilder: (context, index) {
          return _buildCarouselImage(_carouselImages[_selectedIndex]![index]);
        },
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: List.generate(_categories.length, (index) {
          bool isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
                _currentImageIndex = 0;
                if (_pageController.hasClients) {
                  _pageController.jumpToPage(0);
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF1E3A2F) : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildArticleContent() {
    Widget content;
    switch (_selectedIndex) {
      case 0:
        content = _buildIntroArticle();
        break;
      case 1:
        content = _buildAttractionsArticle();
        break;
      case 2:
        content = _buildFoodArticle();
        break;
      case 3:
        content = _buildRouteArticle();
        break;
      default:
        content = const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: content,
      ),
    );
  }

  // ==================== 家乡简介 ====================
  Widget _buildIntroArticle() {
    return Column(
      key: const ValueKey('intro'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _t('中国近代第一城 —— 南通', '중국 근대 제1성 —— 난퉁'),
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 16),
        _buildParagraph(_t(
          '南通，江苏省地级市，古称通州、静海，地处长江三角洲北部，东抵黄海，南望长江，拥有”据江海之会、扼南北之喉”的绝佳地理位置。作为中国首批对外开放的14个沿海城市之一，南通不仅经济发达，更有着极其深厚的江海文化底蕴。',
          '난퉁은 장쑤성 지급시로, 옛 이름은 통주·정해이며 창강 삼각주 북부에 위치하여 동쪽으로 황해, 남쪽으로 창강을 마주하고 있습니다. 중국 최초의 14개 연해 개방 도시 중 하나로서 경제가 발달했을 뿐만 아니라 깊은 강해 문화의 저력을 지니고 있습니다.',
        )),
        _buildParagraph(_t(
          '提到南通，就不得不提清末状元、近代著名实业家、教育家张謇先生。一百多年前，张謇先生在家乡南通推行”实业救国、教育救国”，创办了中国第一所师范学校、第一座民间博物苑、第一家纺织学校等一系列开创性事业，凭借一己之力将南通建成了”中国近代第一城”。',
          '난퉁을 이야기할 때 청나라 말기 장원이자 근대 저명한 실업가·교육가인 장젠 선생을 빼놓을 수 없습니다. 100여 년 전 장젠 선생은 고향 난퉁에서 “실업으로 나라를 구하고 교육으로 나라를 구한다”는 이념을 실천하며 중국 최초의 사범학교, 최초의 민간 박물관, 최초의 방직학교 등 선구적인 사업을 창립하여 혼자 힘으로 난퉁을 “중국 근대 제1성”으로 만들었습니다.',
        )),
        _buildParagraph(_t(
          '走在南通的街头，现代都市的繁华与百年前的民国风情交相辉映，展现出这座城市独一无二的历史人文风貌。南通也是一座”博物馆之城”，环濠河两岸分布着20多座各具特色的博物馆，是全国独一无二的文化景观。',
          '난퉁 거리를 걷다 보면 현대 도시의 번화함과 100년 전 민국 시대의 정취가 어우러져 이 도시만의 독특한 역사 인문 풍경을 보여줍니다. 난퉁은 “박물관의 도시”이기도 하여 하오허 강 양안에는 20여 개의 각기 다른 박물관이 분포해 있어 전국적으로도 독특한 문화 경관을 이루고 있습니다.',
        )),
        const SizedBox(height: 20),
        _buildSubHeading(_t('📍 城市速览', '📍 도시 개요')),
        _buildParagraph(_t(
          '• 别称：静海、崇州、崇川\n• 市花/市树：菊花/桂花\n• 人口：约775万（2025年）\n• 面积：8001平方公里\n• 地位：国家历史文化名城、中国首批沿海开放城市、长三角北翼经济中心',
          '• 별칭: 정해, 숭주, 숭천\n• 시화/시목: 국화/계수나무\n• 인구: 약 775만 (2025년)\n• 면적: 8,001km²\n• 지위: 국가 역사 문화 명성, 중국 최초 연해 개방 도시, 창강 삼각주 북부 경제 중심',
        )),
        const SizedBox(height: 40),
      ],
    );
  }

  // ==================== 旅游景点 ====================
  Widget _buildAttractionsArticle() {
    return Column(
      key: const ValueKey('attractions'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _t('漫游南通：不可错过的风景', '난퉁 산책: 놓칠 수 없는 풍경'),
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 20),
        _buildSubHeading(_t('1. 濠河风景名胜区 ⭐⭐⭐⭐⭐', '1. 하오허 풍경 명승구 ⭐⭐⭐⭐⭐')),
        _buildParagraph(_t(
          '濠河，作为南通的城市名片，是国内保留最为完整的四条古护城河之一，距今已有千余年历史。濠河水清如镜，蜿蜒迂回，呈葫芦状环抱南通老城区，被誉为南通城的”翡翠项链”。强烈推荐在傍晚时分乘坐画舫夜游濠河，欣赏两岸的古建筑与现代桥梁在璀璨灯光下的绝美夜景。沿河还分布着南通博物苑、中国珠算博物馆等20余座博物馆，被赞为”环濠河博物馆群”。',
          '하오허는 난퉁의 도시 명함으로, 중국에서 가장 잘 보존된 4대 고대 해자 중 하나이며 천년 이상의 역사를 지니고 있습니다. 하오허는 물이 거울처럼 맑고 구불구불하게 난퉁 구시가지를 호리병박 모양으로 감싸고 있어 난퉁의 “비취 목걸이”로 불립니다. 저녁 무렵 유람선을 타고 하오허를 유람하며 양안의 고건축과 현대적 다리가 조명 아래 펼쳐지는 환상적인 야경을 감상하는 것을 강력 추천합니다. 강변에는 난퉁 박물관, 중국 주판 박물관 등 20여 개의 박물관이 분포해 “환하오허 박물관군”으로 불립니다.',
        )),
        const SizedBox(height: 20),
        _buildSubHeading(_t('2. 狼山风景名胜区 ⭐⭐⭐⭐', '2. 낭산 풍경 명승구 ⭐⭐⭐⭐')),
        _buildParagraph(_t(
          '狼山位于南通市南郊，临江而立，海拔106.94米，素有”江海第一山”的美誉。狼山是中国佛教八小名山之首，是大势至菩萨的道场。山上的广教禅寺始建于唐代，香火鼎盛。登上山顶，凭栏远眺，长江那”星垂平野阔，月涌大江流”的波澜壮阔尽收眼底。\n\n五山连游路线：狼山—剑山—军山—黄泥山—马鞍山，一日可尽览五山不同的自然与人文景致。',
          '낭산은 난퉁시 남쪽 교외에 위치하며 강을 마주하고 해발 106.94m로 “강해 제일의 산”이라는 명성을 지니고 있습니다. 낭산은 중국 불교 8대 소명산 중 으뜸이며 대세지보살의 도량입니다. 산 위의 광교선사는 당나라 때 창건되어 향불이 번성합니다. 정상에 올라 난간에 기대어 바라보면 창강의 웅장한 풍경이 한눈에 펼쳐집니다.\n\n5산 연계 코스: 낭산—검산—군산—황니산—마안산, 하루에 다섯 산의 다양한 자연과 인문 경관을 모두 감상할 수 있습니다.',
        )),
        const SizedBox(height: 20),
        _buildSubHeading(_t('3. 南通博物苑', '3. 난퉁 박물관')),
        _buildParagraph(_t(
          '由张謇于1905年创办，是中国人自己创办的第一座公共博物馆，现已跻身首批国家一级博物馆。博物苑集自然、历史、美术于一体，占地约7万平方米，南馆、北馆各具特色。张謇故居——濠南别业坐落其间，院中张謇手植的紫藤花开时如梦如幻。',
          '장젠 선생이 1905년에 설립한 중국인 최초의 공공 박물관으로, 현재 국가 1급 박물관으로 지정되었습니다. 자연·역사·미술을 아우르며 약 7만㎡ 부지에 남관과 북관이 각각 특색을 지니고 있습니다. 장젠 생가인 하오난별업이 자리 잡고 있으며 뜰에는 장젠이 직접 심은 등나무 꽃이 필 때면 꿈처럼 아름답습니다.',
        )),
        const SizedBox(height: 20),
        _buildSubHeading(_t('4. 唐闸古镇', '4. 당자 고진')),
        _buildParagraph(_t(
          '唐闸古镇是张謇创办大生纱厂（中国第一家民营纱厂）的所在地，被誉为”中国近代工业遗存第一镇”。青砖黛瓦、运河悠悠、百年厂房，工业遗存与江南水乡在这里完美融合。傍晚北市街亮起灯笼，小摊、夜市、运河晚风，烟火气十足。',
          '당자 고진은 장젠이 대생방직(중국 최초의 민영 방직 공장)을 창립한 곳으로 “중국 근대 공업 유산 제1진”으로 불립니다. 푸른 벽돌과 검은 기와, 유유히 흐르는 운하, 백년 된 공장 건물들이 공업 유산과 강남 수향의 풍경을 완벽하게 융합하고 있습니다. 저녁 무렵 북시 거리에 등롱이 켜지고 노점, 야시장, 운하의 저녁 바람이 생활의 정취를 물씬 풍깁니다.',
        )),
        const SizedBox(height: 20),
        _buildSubHeading(_t('5. 值得一去的其他好地方', '5. 더 가볼 만한 좋은 곳')),
        _buildParagraph(_t(
          '• 南通森林野生动物园：华东地区最大的动物园之一，可自驾与鹿、羊驼互动。\n• 水绘园（如皋）：明末才子冒辟疆与董小宛的隐居地，被誉为”中国第一情侣文化园”。\n• 洲际绿博园：热带植物、漂流、四季花海，适合全家出游。\n• 启东黄金海滩：赶海拾贝、看海上日出，感受长江入海口的辽阔。\n• 滨江公园：沿长江边骑行散步，傍晚欣赏江面夕阳美景。',
          '• 난퉁 삼림 야생 동물원: 화둥 최대 동물원 중 하나, 자동차로 사슴·알파카와 교감.\n• 수회원(루가오): 명나라 말기 재자 모벽강과 동소완의 은거지, “중국 제1 연인 문화원”.\n• 저우지 그린 식물원: 열대 식물, 래프팅, 사계절 꽃밭, 가족 나들이에 최적.\n• 치둥 황금 해변: 바닷가에서 조개 줍기, 해상 일출 감상, 창강 하구의 광활함 체험.\n• 빈장 공원: 창강 변을 따라 자전거 산책, 저녁 강 위로 지는 석양 감상.',
        )),
        const SizedBox(height: 40),
      ],
    );
  }

  // ==================== 代表美食 ====================
  Widget _buildFoodArticle() {
    return Column(
      key: const ValueKey('food'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _t('寻味南通：舌尖上的江海风情', '난퉁 미식: 혀끝으로 즐기는 강해의 풍미'),
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 20),
        _buildSubHeading(_t('🍽️ 必吃经典', '🍽️ 필수 맛집 클래식')),
        _buildParagraph(_t(
          '• 西亭脆饼：百年老字号，始于光绪初年，选料考究，经28道工序手工精制。成品色泽金黄，每只饼薄而不碎，有十八层层层分明，当地歌谣说”西亭脆饼十八层，层层分明能照人，上风吃来下风闻，香甜酥脆爱煞人”。\n\n• 白蒲茶干：始于三百年前，以白皮黄豆为原料，经20多道工序制成，薄如铜钱，色泽棕黄，五香卤制，软韧鲜香，佐茶下酒皆宜。\n\n• 南黄海四珍（文蛤、紫菜、鳗鱼、竹蛏）：文蛤被誉为”天下第一鲜”，相传早在唐代就已被列为进贡皇室的极品。\n\n• 狼山鸡：中国著名的特产优良鸡种，清炖砂锅最能体现其鲜嫩清香，是南通人逢年过节招待贵客的压轴大菜。\n\n• 火饺：类似油炸饺子，外皮酥脆，猪肉馅鲜美爆汁，唐闸新民巷的老店最正宗。\n\n• 蟹黄包、缸爿饼、嵌桃麻糕：也是地道的南通味道。',
          '• 시팅 취빙: 백년 전통의 노포로 광서 연간에 시작되어 28가지 공정을 거쳐 수제로 정성껏 만듭니다. 완성품은 황금빛을 띠며 18겹의 층이 선명하고 바삭하며 달콤합니다.\n\n• 바이푸 차간: 300년 전부터 시작되어 흰 콩을 원료로 20여 공정으로 만들어지며 엽전처럼 얇고 오향 향이 배어 있으며 차와 술 안주로 좋습니다.\n\n• 남황해 4대 진미(백합·김·장어·대합): 백합은 “천하제일의 신선함”으로 불리며 당나라 때부터 황실 진상품이었습니다.\n\n• 낭산 닭: 중국의 유명한 우수 토종 닭으로 맑은 냄비 요리가 가장 신선하고 부드럽습니다.\n\n• 훠자오: 기름에 튀긴 만두와 비슷하며 겉은 바삭하고 돼지고기 소가 육즙 가득 터집니다.\n\n• 게살빵, 항판빙, 잣깨과자: 난퉁의 정통 별미입니다.',
        )),
        const SizedBox(height: 20),
        _buildSubHeading(_t('🍜 特色小吃推荐', '🍜 특색 간식 추천')),
        _buildParagraph(_t(
          '• 南通跳面：非遗技艺制作，面条筋道弹牙，汤头鲜美。\n• 红烧河豚：南通是河豚之乡，红烧河豚鲜美浓郁，胆大才敢吃。\n• 吕四海蜇、海门羊肉、白汁鮰鱼：均为南通经典江海菜肴。\n• 火饺、缸爿饼、青团、如皋董糖：街头巷尾随处可见的传统小吃。',
          '• 난퉁 점프면: 무형문화재 기술로 만든 면, 쫄깃하고 국물이 시원합니다.\n• 홍샤오 복어: 난퉁은 복어의 고향, 진하고 부드러운 별미입니다.\n• 뤼쓰 해파리·하이먼 양고기·백즙 메기: 모두 난퉁의 강해 별미 요리입니다.\n• 훠자오·항판빙·청퇀·루가오 동탕: 거리 곳곳에서 볼 수 있는 전통 간식.',
        )),
        const SizedBox(height: 20),
        _buildSubHeading(_t('🏪 老字号推荐', '🏪 노포 추천')),
        _buildParagraph(_t(
          '• 四宜糕团店：蟹黄汤包、各式糕团，老南通人的回忆。\n• 三香斋茶干：白蒲茶干的正宗老字号，非遗传承。\n• 西亭脆饼总店：百年工艺传承，伴手礼首选。',
          '• 쓰이 떡방: 게살 탕바오와 각종 떡이 난퉁 사람들의 추억입니다.\n• 싼샹자이 차간: 바이푸 차간의 정통 노포, 무형문화재 전승.\n• 시팅 취빙 본점: 백년 공예 전승, 기념품으로 최고.',
        )),
        const SizedBox(height: 40),
      ],
    );
  }

  // ==================== 推荐路线 ====================
  Widget _buildRouteArticle() {
    return Column(
      key: const ValueKey('route'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _t('南通旅行攻略：三种路线随心选', '난퉁 여행 공략: 세 가지 코스 마음껏 선택'),
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        const SizedBox(height: 20),
        _buildSubHeading(_t('🗺️ 一日游（主城区精华）', '🗺️ 당일 코스 (도심 정수)')),
        _buildParagraph(_t(
          '【上午】南通博物苑 → 钟楼广场 → 唐闸古镇（工业遗产+老街巷）\n【下午】狼山风景区（登高俯瞰长江）\n【傍晚】濠河夜游（乘画舫看灯光秀）→ 四宜糕团店尝蟹黄汤包',
          '【오전】난퉁 박물관 → 종루 광장 → 당자 고진(공업 유산+옛 골목)\n【오후】낭산 풍경구(정상에서 창강 전망)\n【저녁】하오허 야간 유람(유람선으로 조명쇼 감상) → 쓰이 떡방에서 게살 탕바오 맛보기',
        )),
        const SizedBox(height: 20),
        _buildSubHeading(_t('🗺️ 两日游（市区深度+如皋古镇）', '🗺️ 1박 2일 (도심 깊이+루가오 고진)')),
        _buildParagraph(_t(
          'Day 1：狼山风景区 → 啬园 → 濠河风景区（含夜游）\nDay 2：如皋水绘园（感受才子佳人故事）→ 如皋定慧寺 → 返程',
          'Day 1：낭산 풍경구 → 색원 → 하오허 풍경구(야간 유람 포함)\nDay 2：루가오 수회원(재자와 미인의 이야기) → 루가오 정혜사 → 귀가',
        )),
        const SizedBox(height: 20),
        _buildSubHeading(_t('🗺️ 三日游（江海全线）', '🗺️ 2박 3일 (강해 전선)')),
        _buildParagraph(_t(
          'Day 1：南通博物苑 → 张謇纪念馆 → 钟楼广场 → 唐闸古镇\nDay 2：狼山风景区 → 剑山/军山 → 黄泥山（五山连游）\nDay 3：启东黄金海滩/恒大威尼斯 → 返程',
          'Day 1：난퉁 박물관 → 장젠 기념관 → 종루 광장 → 당자 고진\nDay 2：낭산 풍경구 → 검산/군산 → 황니산(5산 연계)\nDay 3：치둥 황금 해변/헝다 베니스 → 귀가',
        )),
        const SizedBox(height: 20),
        _buildSubHeading(_t('🚄 交通贴士', '🚄 교통 팁')),
        _buildParagraph(_t(
          '• 高铁：至南通站（近老城和濠河）或南通西站，上海出发不到1小时。\n• 飞机：南通兴东国际机场，半小时可达市区。\n• 市内：地铁1号线、2号线已开通，公交大多2元，打车起步价10元左右。',
          '• 고속철도: 난퉁역(구도심·하오허 인근) 또는 난퉁서역, 상하이에서 1시간 이내.\n• 비행기: 난퉁 싱둥 국제공항, 30분이면 도심 도착.\n• 시내: 지하철 1·2호선 개통, 버스 대부분 2위안, 택시 기본료 약 10위안.',
        )),
        const SizedBox(height: 20),
        _buildSubHeading(_t('🏨 住宿建议', '🏨 숙박 추천')),
        _buildParagraph(_t(
          '建议住崇川区，靠近博物苑、濠河、唐闸古镇，吃逛都方便。',
          '충촨구 숙박을 추천하며 박물관·하오허·당자 고진과 가까워 먹고 놀기 편리합니다.',
        )),
        const SizedBox(height: 20),
        _buildSubHeading(_t('🎒 最佳时节与伴手礼', '🎒 최적 시기와 기념품')),
        _buildParagraph(_t(
          '• 最佳时节：春季看紫藤花海（博物苑紫藤最出名），秋日狼山登高最舒适。\n• 伴手礼：西亭脆饼、白蒲茶干、蓝印花布文创品。',
          '• 최적 시기: 봄에는 등나무 꽃밭(박물관 등나무가 가장 유명), 가을 낭산 등반이 가장 쾌적.\n• 기념품: 시팅 취빙, 바이푸 차간, 남색 날염 천 문화상품.',
        )),
        const SizedBox(height: 40),
      ],
    );
  }

  // ==================== 辅助 UI 组件 ====================
  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, height: 1.8, color: Color(0xFF4A4A4A), letterSpacing: 0.5),
      ),
    );
  }

  Widget _buildSubHeading(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 4),
      child: Text(
        title,
        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600, color: Color(0xFF1E3A2F)),
      ),
    );
  }

  /// 加载本地图片
  Widget _buildCarouselImage(String assetPath) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.grey.shade100),
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.broken_image, size: 40, color: Colors.grey.shade500),
                const SizedBox(height: 8),
                Text(
                  '图片加载失败\n$assetPath',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}