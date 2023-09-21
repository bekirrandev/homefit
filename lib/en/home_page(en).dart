import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:homefit/en/page_video(en).dart';
import 'package:homefit/en/page_video_end(en).dart';
import 'package:homefit/en/login_page(en).dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homefit/en/appbar_profile(en).dart';

class HomePageEn extends StatefulWidget {
  const HomePageEn({super.key});
  @override
  State<HomePageEn> createState() => _HomePageEnState();
}

class _HomePageEnState extends State<HomePageEn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              "lib/assets/logo.png",
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.43,
            ),
            campoProfileEn(),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                Color.fromRGBO(3, 128, 136, 1),
                Colors.white
              ])),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              children: [
                BackButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPageEn()),
                        (Route route) => false);
                  },
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 0, left: 0, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Exercises',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )),
                  Container(
                      padding: EdgeInsets.only(
                          right: 120, left: 0, top: 0, bottom: 0)),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Access Exercises Videos',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => PageVideoEn(
                                    semana: '1',
                                    url:
                                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fen%2Fexercises%2Fexercises_week01.mp4?alt=media',
                                    path:
                                        'lib/assets/en/thumbnail/exercises/thumbnail_exercises_week01.png',
                                  ))));
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/en/thumbnail/exercises/thumbnail_exercises_week01.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 0, left: 0, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Pain Education (END)',
                        style: TextStyle(color: Colors.black, fontSize: 19),
                      )),
                  Container(
                      padding: EdgeInsets.only(
                          right: 60, left: 0, top: 0, bottom: 0)),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Access END Videos',
                        style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
