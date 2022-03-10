import 'dart:convert';

import 'package:alalbayet/ui/pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../utility/constant.dart';
class SubjectsScreen extends StatefulWidget {
  const SubjectsScreen({Key? key, required this.collegId}) : super(key: key);
  final String collegId;
  @override
  _SubjectsScreenState createState() => _SubjectsScreenState();
}

class _SubjectsScreenState extends State<SubjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar( title:Text("الصفحة الرئيسية",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
        centerTitle: true,),
        body: Container(
        child: FutureBuilder(
            future: loadSubjectsByID(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return ListView.builder(
                  itemCount: (snapshot.data as List).length,
                  itemBuilder: (context, index) {
                    return _subjectList(
                        ((snapshot.data as List)[index]['pdf']),
                        (snapshot.data as List)[index]['name'],
                        (snapshot.data as List)[index]['serial'],
                        );
                  },
                );
              }
              return Center(child:CircularProgressIndicator(color: Colors.deepPurpleAccent,) ,);
            }
        ),
      ),
    );
  }

  Widget _subjectList(String pdf,String name, String serial) {
    return Container(
        margin: EdgeInsets.only(bottom: 5),
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child:ListTile(
          title: Text("$name",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,fontSize: 30),),
            subtitle: Text(serial,style:TextStyle(color: Colors.black, fontWeight: FontWeight.w400,fontSize: 20) ,),
            onTap:(){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> PdfViewer(colleg: pdf)));
            } ,

    )
    );
  }


  Future loadSubjectsByID()async{
    var url = Uri.parse(subjectsURL+"?colleg_id=${widget.collegId}");
    var res = await http.get(url);
    var responseBody = jsonDecode(res.body);
    return responseBody;
  }

}
