import 'package:flutter/material.dart';
import 'package:homefit/br/view_pdf.dart';
import 'package:page_transition/page_transition.dart';
import 'package:homefit/br/page_video.dart';
import 'package:homefit/br/page_video_end.dart';
import 'package:homefit/br/appbar_profile.dart';
import 'package:homefit/br/acess_exercises.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void infoVideoPlayer() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title:
                    Text('Orientações sobre as Atividade Práticas do Homefit'),
                content: Text(
                    '• As Atividade Práticas são PDFs que trazem um material auxiliar para o protocolo\n'
                    '\n'
                    '• Você pode baixar esses PDFs. Existe um botão vermelho que baixa esse PDF para você.\n'
                    '\n'
                    '• Quando abrir alguma Atividade Prática. Você será redirecionado para a tela que carregara o PDF. Atenção: esse carregamento leva alguns segundos. Fique tranquilo que  o PDF aparecera!\n'
                    '\n'
                    '• Os PDFs podem ter mais de uma página. Para passar para a página seguinte deslize para o lado esquerdo. Caso queira voltar para a página anterior deslize para o lado direito\n'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Entendi'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]);
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height * 0.12,
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
            campoProfile(),
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
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
              ),
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 15, bottom: 0, left: 0, right: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Exercícios',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 65,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: acessExercises(),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Acessar os vídeos de Exercícios',
                              style: TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                            ),
                            Container(
                                width: 20,
                                height: 20,
                                child:
                                    Image.asset("lib/assets/icons/acess.png")),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
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
                              builder: ((context) => PageVideo(
                                    semana: '1',
                                    url:
                                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana01.mp4?alt=media',
                                    path:
                                        'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana01.png',
                                  ))));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana01.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideo(
                                semana: '2',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana02.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana02.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana02.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideo(
                                semana: '3',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana03.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana03.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana03.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideo(
                                semana: '4',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana04.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana04.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana04.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideo(
                                semana: '5',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana05.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana05.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana05.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideo(
                                semana: '6',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana06.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana06.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana06.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideo(
                                semana: '7',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana07.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana07.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana07.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideo(
                                semana: '8',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Fexercicios%2Fexerc%C3%ADcios_semana08.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana08.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/exercicios/thumbnail_exercicios_semana08.png'))),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Educação Em Dor',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
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
                          PageTransition(
                              child: PageVideoEnd(
                                semana: '1',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Feducacao_em_dor%2Fend_semana01.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/end/thumbnail_end_semana01.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/end/thumbnail_end_semana01.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideoEnd(
                                semana: '2',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Feducacao_em_dor%2Fend_semana02.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/end/thumbnail_end_semana02.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/end/thumbnail_end_semana02.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideoEnd(
                                semana: '3',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Feducacao_em_dor%2Fend_semana03.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/end/thumbnail_end_semana03.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/end/thumbnail_end_semana03.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideoEnd(
                                semana: '4',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Feducacao_em_dor%2Fend_semana04.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/end/thumbnail_end_semana04.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/end/thumbnail_end_semana04.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideoEnd(
                                semana: '5',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Feducacao_em_dor%2Fend_semana05.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/end/thumbnail_end_semana05.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/end/thumbnail_end_semana05.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideoEnd(
                                semana: '6',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Feducacao_em_dor%2Fend_semana06.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/end/thumbnail_end_semana06.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/end/thumbnail_end_semana06.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideoEnd(
                                semana: '7',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Feducacao_em_dor%2Fend_semana07.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/end/thumbnail_end_semana07.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/end/thumbnail_end_semana07.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: PageVideoEnd(
                                semana: '8',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/videos%2Fpt%2Feducacao_em_dor%2Fend_semana08.mp4?alt=media',
                                path:
                                    'lib/assets/pt/thumbnail/end/thumbnail_end_semana08.png',
                              ),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/end/thumbnail_end_semana08.png'))),
                      child: Center(
                        child: Icon(Icons.play_circle),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: GestureDetector(
                    onTap: () {
                      infoVideoPlayer();
                    },
                    child: Row(
                      children: [
                        Text(
                          'Clique aqui para orientações\n'
                          'sobre as Atividade Práticas',
                          style:
                              TextStyle(fontSize: 10, color: Colors.blueAccent),
                        ),
                        Icon(
                          Icons.help,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 15, bottom: 0, left: 0, right: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Atividades Praticas',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
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
                              builder: ((context) => loadPDF(
                                    url:
                                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/atividades_praticas%2FEND%201%20-%20Aceitac%CC%A7a%CC%83o.pdf?alt=media',
                                    titulo: 'Aceitação',
                                    filename: 'END 1 - Aceitação.pdf',
                                  ))));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/atividades_praticas/thumbnail_atp_semana01.png'))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => loadPDF(
                                    url:
                                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/atividades_praticas%2FEND%202%20-%20Entendendo%20dor%20cro%CC%82nica.pdf?alt=media',
                                    titulo: 'Entendendo dor crônica',
                                    filename:
                                        'END 2 - Entendendo dor crônica.pdf',
                                  ))));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/atividades_praticas/thumbnail_atp_semana02.png'))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => loadPDF(
                                    url:
                                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/atividades_praticas%2FEND%203%20-%20Agenda%20de%20atividades.pdf?alt=media',
                                    titulo: 'Agenda de atividades',
                                    filename:
                                        'END 3 - Agenda de atividades.pdf',
                                  ))));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/atividades_praticas/thumbnail_atp_semana03.png'))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => loadPDF(
                                    url:
                                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/atividades_praticas%2FEND%204%20-%20Melhorando%20o%20Sono.pdf?alt=media',
                                    titulo: 'Melhorando o Sono',
                                    filename: 'END 4 - Melhorando o Sono.pdf',
                                  ))));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/atividades_praticas/thumbnail_atp_semana04.png'))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => loadPDF(
                                    url:
                                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/atividades_praticas%2FEND%205%20-%20Praticando%20Relaxamento.pdf?alt=media',
                                    titulo: 'Praticando Relaxamento',
                                    filename:
                                        'END 5 - Praticando Relaxamento.pdf',
                                  ))));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/atividades_praticas/thumbnail_atp_semana05.png'))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => loadPDF(
                                    url:
                                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/atividades_praticas%2FEND%206%20-%20Praticando%20Exerci%CC%81cios.pdf?alt=media',
                                    titulo: 'Praticando Exercícios',
                                    filename:
                                        'END 6 - Praticando Exercícios.pdf',
                                  ))));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/atividades_praticas/thumbnail_atp_semana06.png'))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => loadPDF(
                                    url:
                                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/atividades_praticas%2FEND%207%20-%20Como%20controlar%20as%20atividades.pdf?alt=media',
                                    titulo: 'Como controlar as atividades',
                                    filename:
                                        'END 7 - Como controlar as atividades.pdf',
                                  ))));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/atividades_praticas/thumbnail_atp_semana07.png'))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => loadPDF(
                                    url:
                                        'https://firebasestorage.googleapis.com/v0/b/homefit-e1157.appspot.com/o/atividades_praticas%2FEND%208%20-%20Descobrindo%20Atividades%20Prazerosas.pdf?alt=media',
                                    titulo: 'Descobrindo Atividades Prazerosas',
                                    filename:
                                        'END 8 - Descobrindo Atividades Prazerosas.pdf',
                                  ))));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.49,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/pt/thumbnail/atividades_praticas/thumbnail_atp_semana08.png'))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            Text(
              'Development by @_._wel_._',
              style: TextStyle(color: Colors.blueGrey),
            )
          ],
        ),
      ),
    );
  }
}
