import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:homefit/br/home_page.dart';
import 'package:homefit/br/notes.dart';
import 'package:homefit/br/about_us.dart';
import 'package:video_player/video_player.dart';

class buttomNavBar extends StatefulWidget {
  const buttomNavBar({super.key});

  @override
  State<buttomNavBar> createState() => _buttomNavBarState();
}

class _buttomNavBarState extends State<buttomNavBar> {
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
              label: 'Anotações',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Sobre Nós',
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
          children: <Widget>[
            HomeNavigator(),
            NotesNavigator(),
            aboutUsNavigator()
          ],
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
                  return HomePage();
                default:
                  return HomePage();
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

GlobalKey<NavigatorState> _aboutUsNavigatorKey = GlobalKey<NavigatorState>();

class aboutUsNavigator extends StatefulWidget {
  const aboutUsNavigator({super.key});

  @override
  _aboutUsNavigatorState createState() => _aboutUsNavigatorState();
}

class _aboutUsNavigatorState extends State<aboutUsNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _aboutUsNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return aboutUs();
                default:
                  return aboutUs();
              }
            });
      },
    );
  }
}
