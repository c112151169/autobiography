import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';

final player = AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.notoSansTc().fontFamily,
        textTheme: GoogleFonts.notoSansTcTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tabs = [
    const Screen1(),
    const Screen2(),
    const Screen3(),
    const Screen4(),
  ];

  int previousIndex = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) player.play(AssetSource("1.mp3"));
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的自傳"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        iconSize: 30,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? Image.asset('assets/a1.png', width: 40, height: 40)
                : Image.asset('assets/a11.png', width: 30, height: 30),
            label: "自我介紹",
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? Image.asset('assets/a2.png', width: 40, height: 40)
                : Image.asset('assets/a21.png', width: 30, height: 30),
            label: "學習歷程",
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? Image.asset('assets/a3.jpg', width: 40, height: 40)
                : Image.asset('assets/a31.jpg', width: 30, height: 30),
            label: "學習計畫",
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 3
                ? Image.asset('assets/a4.png', width: 40, height: 40)
                : Image.asset('assets/a41.png', width: 30, height: 30),
            label: "專業方向",
          ),
        ],
        onTap: (index) {
          setState(() {
            previousIndex = currentIndex;
            currentIndex = index;
            player.stop();
            player.play(AssetSource("${index + 1}.mp3"));
          });
        },
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> paragraphs = [
      "我出生在馬來西亞的一個平凡家庭，父親從事批發生意，母親則是家庭主婦，家中共有兄弟姐妹三人，包括一位哥哥與一位妹妹。哥哥目前幫忙家裡的批發工作，而妹妹正在就讀高中。家庭雖然不富裕，但父母始終重視我們的品德教育與責任感，這讓我從小便懂得自律與珍惜機會。",
      "小時候的我個性活潑又好動，雖然課業表現普通，但在課外活動中表現相當亮眼。除了擔任過班長外，我還參加過糾察隊與校隊運動選手的訓練，在體育活動中培養了毅力、紀律與團隊精神。這些經驗讓我學會如何在壓力中保持冷靜，也讓我更了解合作的重要性。",
      "國中到高中階段，我選擇就讀工科，開始接觸更多實作與技術領域的課程。在這段期間，我也第一次接觸排球並深深喜歡上這項運動。排球不僅讓我在升學壓力中找到平衡，也教會我如何在團隊當中溝通與協調，每場比賽都是磨練臨場反應與判斷能力的機會。",
      "進入大學後，我持續在課業與興趣間取得平衡。大一時努力適應新的學習環境與專業課程，而到了大二，我更加積極參與社團活動。透過活動策劃、迎新、訓練與社課，我不僅累積了更多人際互動與組織能力，也在團隊合作中學習到責任分工與領導的重要性，使我在面對事情時更加成熟穩重。",
      "回顧這些生活與學習經歷，它們都讓我成為目前的自己。無論是家庭環境、運動訓練、工科技能、社團活動或大學課業，都讓我在不同階段獲得成長。未來我希望能持續在資訊領域深耕，不斷提升自己的能力，讓所學能應用在實務中，並成為能為社會帶來貢獻的人。",
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "Who am I",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          ...paragraphs.map(
            (text) => Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(14),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(4, 4),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: text.substring(0, 12),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.6,
                      ),
                    ),
                    TextSpan(
                      text: text.substring(12),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Image.asset('assets/a1.png'),
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> timeline = [
      {
        "year": "國小",
        "icon": Icons.child_friendly,
        "text": "活潑好動，擔任班長、糾察隊，參與校隊訓練。",
      },
      {"year": "國中", "icon": Icons.school, "text": "開始接觸工科，培養動手做與邏輯思維能力。"},
      {
        "year": "高中",
        "icon": Icons.sports_volleyball,
        "text": "加入排球校隊，學習團隊合作與抗壓能力。",
      },
      {"year": "大學", "icon": Icons.computer, "text": "踏入資訊領域，開始學習程式、系統與開發技能。"},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "學習歷程",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          ...timeline.map(
            (item) => Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.only(bottom: 18),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.deepPurple.shade100,
                  child: Icon(item["icon"], color: Colors.deepPurple),
                ),
                title: Text(
                  item["year"],
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  item["text"],
                  style: const TextStyle(fontSize: 18, height: 1.4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> plans = [
      {
        "title": "大一：基礎打底",
        "icon": Icons.book,
        "items": ["學好英文", "建立程式基礎", "適應大學生活"],
      },
      {
        "title": "大二：技能強化",
        "icon": Icons.engineering,
        "items": ["資料結構與演算法", "Flutter 開發", "參與社團活動"],
      },
      {
        "title": "大三：專業探索",
        "icon": Icons.explore,
        "items": ["加入專題研究", "AI / Python 進階", "建立作品集"],
      },
      {
        "title": "大四：實務應用",
        "icon": Icons.work,
        "items": ["企業實習", "完成專題", "累積求職能力"],
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "學習計畫",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          ...plans.map(
            (plan) => Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(plan["icon"], size: 30, color: Colors.deepPurple),
                        const SizedBox(width: 12),
                        Text(
                          plan["title"],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ...List.generate(plan["items"].length, (i) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text(
                          "• ${plan["items"][i]}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    }),
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

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> skills = [
      {"icon": Icons.phone_android, "text": "Flutter / App 開發"},
      {"icon": Icons.computer, "text": "程式能力：C / Python"},
      {"icon": Icons.router, "text": "電腦網路與系統基礎"},
      {"icon": Icons.code, "text": "網頁前端基礎"},
      {"icon": Icons.lightbulb, "text": "專題研究與問題解決能力"},
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            "專業方向",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          ...skills.map(
            (skill) => Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Icon(
                  skill["icon"],
                  size: 32,
                  color: Colors.deepPurple,
                ),
                title: Text(
                  skill["text"],
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),
          const Text(
            "未來希望能持續在資訊與軟體開發領域深耕，累積更多專案與作品經驗，並將所學應用在實務中，成為能為社會帶來價值的工程師。",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, height: 1.5),
          ),
        ],
      ),
    );
  }
}
