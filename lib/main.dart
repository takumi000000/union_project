import 'package:flutter/material.dart';
import './views/mypage_view.dart';
import './views/chat_view.dart';
import './views/home_view.dart';

void main() => runApp(MyApp());

var pageName = "Home";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "$pageName",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// SingleTickerProviderStateMixin
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // ページ切り替え用のコントローラを定義
  late PageController _pageController;

  // ページインデックス保存用
  int _screen = 0;

  // ページ下部に並べるナビゲーションメニューの一覧
  List<BottomNavigationBarItem> myBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        // ignore: deprecated_member_use
        title: const Text('ホーム'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        // ignore: deprecated_member_use
        title: const Text('掲示板'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.people),
        // ignore: deprecated_member_use
        title: const Text('プロフィール'),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    // コントローラ作成
    _pageController = PageController(
      initialPage: _screen, // 初期ページの指定。上記で_screenを１とすれば２番目のページが初期表示される。
    );
  }

  @override
  void dispose() {
    // コントローラ破棄
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      // ページビュー
      body: PageView(
          controller: _pageController,
          // ページ切り替え時に実行する処理
          // PageViewのonPageChangedはページインデックスを受け取る
          // 以下ではページインデックスをindexとする
          onPageChanged: (index) {
            setState(() {
              // ページインデックスを更新
              _screen = index;
            });
          },
          // ページ下部のナビゲーションメニューに相当する各ページビュー。後述
          children: [
            Home(),
            Chat(),
            Mypage(),
          ]),
      // ページ下部のナビゲーションメニュー
      bottomNavigationBar: BottomNavigationBar(
        // 現在のページインデックス
        currentIndex: _screen,
        // onTapでナビゲーションメニューがタップされた時の処理を定義
        onTap: (index) {
          setState(() {
            // ページインデックスを更新
            _screen = index;

            // ページ遷移を定義。
            // curveで指定できるのは以下
            // https://api.flutter.dev/flutter/animation/Curves-class.html
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          });
        },
        // 定義済のナビゲーションメニューのアイテムリスト
        items: myBottomNavBarItems(),
      ),
    );
  }
}
