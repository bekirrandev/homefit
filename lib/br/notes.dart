import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homefit/br/appbar_profile.dart';
import 'package:homefit/br/get_collection.dart';
import 'package:homefit/services/auth_firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:homefit/br/acess_notes.dart';
import 'package:page_transition/page_transition.dart';

class notes extends StatefulWidget {
  const notes({super.key});

  @override
  State<notes> createState() => _notesState();
}

class _notesState extends State<notes> {
  final TextEditingController _searchController = TextEditingController();
  late String email;
  List _allResults = [];
  List _resultList = [];

  getClientStream() async {
    List _auxList = [];
    firestoreService service = firestoreService();
    List dataForms = await service.getData('formulario');
    for (int i = 0; i < dataForms.length; i++) {
      if ((dataForms[i]['Email'] == email)) {
        _auxList.add(dataForms[i]);
      }
    }
    if (mounted) {
      setState(() {
        _allResults = _auxList;
      });
    }
    _searchResultList();
  }

  _onSearchChange() {
    _searchResultList();
  }

  _searchResultList() {
    var showResults = [];
    if (_searchController.text != "") {
      for (var clientSnapshot in _allResults) {
        var name = 'semana ' + clientSnapshot['Semana'].toString();
        var name2 = 'semana' + clientSnapshot['Semana'].toString();
        var semana = clientSnapshot['Semana'].toString();
        var date = clientSnapshot['Date'].toString();
        print(semana);
        if (name.contains(_searchController.text.toLowerCase()) ||
            semana.contains(_searchController.text.toLowerCase()) ||
            name2.contains(_searchController.text.toLowerCase()) ||
            date.contains(_searchController.text.toLowerCase())) {
          showResults.add(clientSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }

    if (mounted) {
      setState(() {
        _resultList = showResults;
      });
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChange);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _searchController.addListener(_onSearchChange);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AuthServices auth = Provider.of<AuthServices>(context);
    email = auth.usuario!.email!;
    getClientStream();
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
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Histórico de Anotações',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: CupertinoSearchTextField(
                  controller: _searchController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _resultList.length,
                  itemBuilder: (context, index) {
                    late String semana = _allResults[index]['Semana'];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              child: acessNotes(
                                valor_pergunta1: _allResults[index]['P1'],
                                valor_pergunta2: _allResults[index]['P2'],
                                valor_pergunta3: _allResults[index]['P3'],
                                valor_pergunta4: _allResults[index]['P4'],
                                depoimento: _allResults[index]['P5'],
                                semana: _allResults[index]['Semana'],
                              ),
                              type: PageTransitionType.bottomToTop),
                        );
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width * 0.95,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(138, 203, 203, 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.note),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Semana $semana',
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ]),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Text(
                                        _allResults[index]['Date'],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                )
                              ])),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ));
  }
}
