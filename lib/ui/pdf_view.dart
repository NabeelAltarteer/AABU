import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;
import '../utility/constant.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({Key? key,required this.colleg}) : super(key: key);
  final String colleg;
  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: Container(
        child: _pdfViewer( widget.colleg)
    ),
    );
  }


  Widget _pdfViewer(String pdf){
    return Container(
      width: double.infinity,
      child: SfPdfViewer.network('$pdf',enableDoubleTapZooming: true),
    );
  }

  Future loadPdf()async{
    var url = Uri.parse(subjectsURL+"?colleg_id=${widget.colleg}");
    var res = await http.get(url);
    var responseBody = jsonDecode(res.body);
    return responseBody;
  }
}
