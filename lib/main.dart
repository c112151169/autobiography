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
  const Screen1({super.key}); // ✅ 加 const

  final String s1 =
      "我出生在一個很平凡但很美滿的小家庭，父親是個公務員，在台電服務，母親是個家庭主婦，而弟弟和我都還在學校求學。父母用民主的方式管教我們，希望我們能夠獨立自主、主動學習，累積人生經驗，但他們會適時的給予鼓勵和建議。"
      "在小學時代的我很活潑、很好動，在課業上表現平平，但課外表現不錯，除了擔任過班長外，還參加樂隊、糾察隊等。"
      "進附中後，每天都覺得很充實、很快樂，我最喜歡的是數學、化學和生物，因為它們能訓練組織與思考能力，也與日常生活密切相關。";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Text(
              "Who am I",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 15),
          Container(
            color: Colors.redAccent,
            width: 200,
            height: 200,
            child: Image.asset('assets/a1.png'),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImage('assets/a2.png'),
              _buildImage('assets/a3.jpg'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String path) => Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.purple, width: 2),
      borderRadius: BorderRadius.circular(30),
      image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
    ),
  );
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Screen2'));
}

class Screen3 extends StatelessWidget {
  const Screen3({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("大一時期", style: TextStyle(fontSize: 24)),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          width: 140,
          child: ListView(
            children: const [
              Text("1. 學好英文", style: TextStyle(fontSize: 20)),
              Text("2. 組合語言", style: TextStyle(fontSize: 20)),
              Text("3. 考取證照", style: TextStyle(fontSize: 20)),
              Text("4. 人際關係", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ],
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Screen4'));
}
