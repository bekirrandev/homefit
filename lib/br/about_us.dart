import 'package:flutter/material.dart';
import 'package:homefit/br/appbar_profile.dart';

class aboutUs extends StatefulWidget {
  const aboutUs({super.key});

  @override
  State<aboutUs> createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {
  @override
  Widget build(BuildContext context) {
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
          child: Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            'Sobre o Protocolo',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.05,
                        ),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                              '“HOMEFIT” foi desenvolvido no Centro\n Internacional de Treinamento em\n Hemofilia da UNICAMP como parte da\n pesquisa acadêmica conduzida pela\n fisioterapeuta MSc. Glenda Feldberg.\n “HOMEFIT” consiste em um protocolo\n remoto de exercícios específicos para\n dor crônica, também recomendado para\n pacientes com hemofilia.'),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.002,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: MediaQuery.of(context).size.height * 0.22,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('lib/assets/logo_maior.png'))),
                    )
                  ],
                ),
                Text(
                    'O programa contém exercícios terapêuticos práticos e seguros tendo em vista os diferentes graus de dor e artropatia. Alguns exercícios contemplam adaptações levando em consideração certas dificuldades na execução. Vídeos semanais de exercícios demonstram a maneira correta de executar os vídeos semanais de exercícios demonstram a maneira correta de executar os movimentos, além do número de repetições e o tempo de cada exercício. Vídeos semanais educativos apresentam conteúdos ilustrados, desenhos e filmes ensinando conceitos relacionados à dor com o objetivo de fazer com que o paciente compreenda a sua dor e os fatores que podem influenciá-la. O programa também traz materiais com estratégias de enfrentamento através\n de atividades práticas semanais que auxiliam o gerenciamento e a modulação da dor, reduzindo seu impacto e promovendo mudanças para um estilo de vida mais ativo e saudável.\nImportante: o paciente deve ser acompanhamento por sua equipe médica e/ou fisioterapeuta, tanto antes quanto durante o treinamento, seguindo sempre todas as orientações que são dadas no início de cada vídeo. Em caso de sangramento articular ou muscular não é recomendável a realização de exercícios físicos.'),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            'Quem Sou Eu?',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.05,
                        ),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                              'Fisioterapeuta, com especialização\nem hidroterapia, mestre e doutoranda\nem Clínica Médica na UNICAMP\nna área de Hematologia; onde\ndesenvolve atividades de ensino,\npesquisa e extensão no Centro de\nTreinamento Internacional em\nHemofilia (CTIH) - Hemocentro.'),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.002,
                    ),
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('lib/assets/foto_glenda.png'),
                    )
                  ],
                ),
                Text(
                    'Nas pesquisas com ênfase em dor crônica, desenvolveu, em parceria com a equipe do IHTC, o programa de treinamento HOMEFIT, como parte do seu doutorado.'),
              ],
            ),
          ),
        ));
  }
}
