import 'dart:convert';
import 'package:alalbayet/ui/subject_screen.dart';
import 'package:flutter/material.dart';
import '../utility/constant.dart';
import 'package:http/http.dart' as http;

class CollegsScreen extends StatefulWidget {
  const CollegsScreen({Key? key}) : super(key: key);

  @override
  _CollegsScreenState createState() => _CollegsScreenState();
}

class _CollegsScreenState extends State<CollegsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar:AppBar(
        title:const Text("الكليات",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
        centerTitle: true,),
      body: Container(
        width: double.infinity,
        child: FutureBuilder(
          future: loadItem(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return GridView.builder(
                  itemCount: (snapshot.data as List).length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                  ),
                  itemBuilder: (context,index){
                    return itemView(context, (snapshot.data as List)[index]['id'],
                        (snapshot.data as List)[index]['name'],
                        (snapshot.data as List)[index]['image']);
                  });
            }
            return const Center(
              child: const CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          },
        ),

      ),
    );
  }


  Widget itemView(BuildContext context,String id, String name,String photo){
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> SubjectsScreen(collegId: id,)));
      },
      child: GridTile(
        child: FadeInImage.assetNetwork(
          placeholder: "images/loading.gif",
          image: photo,
          fit: BoxFit.cover,
        ),
        footer: Container(
          width: double.infinity,
          height: 50,
          color: const Color.fromRGBO(0, 0, 0, 0.4470588235294118),
          child: Align(
            alignment: Alignment.center,
            child: Text(name, style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
                shadows: [
                  const Shadow(color: Colors.black,blurRadius: 20)
                ]
            ),),
          ),
        ),

      ),
    );
  }

  Future loadItem()async{
    var url = Uri.parse(collegsURL);
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }
}
