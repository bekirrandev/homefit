import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:external_path/external_path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:auto_size_text/auto_size_text.dart';

class loadPDF extends StatefulWidget {
  late String titulo;
  late String url;
  late String filename;
  loadPDF(
      {Key? key,
      required this.url,
      required this.titulo,
      required this.filename})
      : super(key: key);

  @override
  State<loadPDF> createState() => _loadPDFState();
}

class _loadPDFState extends State<loadPDF> {
  Future<void> downloadURL() async {
    final pdfController = await PdfController(
        document: PdfDocument.openData(InternetFile.get(widget.url)));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => viewPDF(
                controller: pdfController,
                titulo: widget.titulo,
                filename: widget.filename,
                url: widget.url)));
  }

  void getPermission() async {
    print("getPermission");
    await Permission.storage.request();
  }

  @override
  void initState() {
    // TODO: implement initState
    getPermission();
    super.initState();
    downloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [CircularProgressIndicator(), Text('Abrindo o PDF...')],
      )),
    );
  }
}

class viewPDF extends StatelessWidget {
  late String titulo;
  late String filename;
  late String url;
  PdfController controller;
  viewPDF(
      {Key? key,
      required this.controller,
      required this.titulo,
      required this.filename,
      required this.url})
      : super(key: key);

  Future downloadPDF(String savePath) async {
    try {
      Response response = await Dio().get(
        url,
        onReceiveProgress: showDownloadProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }),
      );
      print(response.data);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }

    /*final _firebaseStorage = FirebaseStorage.instance;
    var snapshot =
        await _firebaseStorage.ref().child('atividades_praticas/$filename');
    final tempdir = await getExternalStorageDirectory();
    final path = '${tempdir.path}/${snapshot.name}';
    await Dio().download(url, path);*/
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                BackButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/buttomnavigator');
                  },
                ),
                FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: AutoSizeText(titulo, maxLines: 2))),
              ],
            ),
            ElevatedButton.icon(
                onPressed: () async {
                  String path =
                      await ExternalPath.getExternalStoragePublicDirectory(
                          ExternalPath.DIRECTORY_DOWNLOADS);
                  String fullPath = "$path/$filename";
                  return downloadPDF(fullPath);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                icon: Icon(Icons.download),
                label: Text('Baixar'))
          ],
        ),
        backgroundColor: Color.fromRGBO(3, 128, 136, 1),
      ),
      body: Center(
        child: PdfView(controller: controller),
      ),
    );
  }
}
