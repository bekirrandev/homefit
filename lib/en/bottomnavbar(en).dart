import 'package:flutter/material.dart';
import 'package:homefit/en/home_page(en).dart';
import 'package:homefit/en/page_video(en).dart';
import 'package:homefit/en/notes(en).dart';
import 'package:homefit/en/about_us(en).dart';
import 'package:video_player/video_player.dart';

class buttomNavBarEn extends StatefulWidget {
  const buttomNavBarEn({super.key});

  @override
  State<buttomNavBarEn> createState() => _buttomNavBarEnState();
}

class _buttomNavBarEnState extends State<buttomNavBarEn> {
  int _selectedIndex = 0;
  late VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(3, 128, 136, 1),
          selectedItemColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'Notes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'About Us',
            )
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: <Widget>[HomeNavigator(), NotesNavigator()],
        ),
      ),
    );
  }
}

GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey<NavigatorState>();

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({super.key});

  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _homeNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return HomePageEn();
                case '/video_exer1':
                  return PageVideoEn(
                    semana: '1',
                    url:
                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana01.mp4?alt=media',
                    path:
                        'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana01(maior).png',
                  );
                case '/video_exer2':
                  return PageVideoEn(
                    semana: '2',
                    url:
                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana02.mp4?alt=media',
                    path:
                        'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana02(maior).png',
                  );
                case '/video_exer3':
                  return PageVideoEn(
                    semana: '3',
                    url:
                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana03.mp4?alt=media',
                    path:
                        'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana03(maior).png',
                  );
                case '/video_exer4':
                  return PageVideoEn(
                    semana: '4',
                    url:
                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana04.mp4?alt=media',
                    path:
                        'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana04(maior).png',
                  );
                default:
                  return HomePageEn();
              }
            });
      },
    );
  }
}

GlobalKey<NavigatorState> _notesNavigatorKey = GlobalKey<NavigatorState>();

class NotesNavigator extends StatefulWidget {
  const NotesNavigator({super.key});

  @override
  _NotesNavigatorState createState() => _NotesNavigatorState();
}

class _NotesNavigatorState extends State<NotesNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _notesNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return notes();
                default:
                  return notes();
              }
            });
      },
    );
  }
}
