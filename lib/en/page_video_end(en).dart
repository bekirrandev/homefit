import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PageVideoEnd extends StatefulWidget {
  String semana;
  String url;
  String path;
  PageVideoEnd(
      {Key? key, required this.url, required this.path, required this.semana})
      : super(key: key);

  @override
  State<PageVideoEnd> createState() => _PageVideoEndState();
}

class _PageVideoEndState extends State<PageVideoEnd> {
  late VideoPlayerController controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              "lib/assets/logo.png",
              fit: BoxFit.contain,
            )
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
          ),
          Row(
            children: [
              BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 15),
          ),
          Container(
            height: 229,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.path), fit: BoxFit.cover)),
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (controller.value.isPlaying) {
                              controller.pause();
                            } else {
                              controller.play();
                            }
                          },
                          child: AspectRatio(
                              aspectRatio: controller.value.aspectRatio,
                              child: Stack(
                                children: [
                                  VideoPlayer(controller),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      VideoProgressIndicator(
                                        controller,
                                        allowScrubbing: true,
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
