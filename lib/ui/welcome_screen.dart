import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List sliderList=[
    {
      "url":"https://www.aabu.edu.jo/en//Slider/WhatsApp_Image.jpg",
    },
    {
      "url":"https://www.aabu.edu.jo/en//Slider/16F8DD36-65BF-468E-8D3C-FF7B6D28CE6A.jpeg",
    },
    {
      "url":"https://www.aabu.edu.jo/EN/collegesandinstitutes/Science//Slider/IMG_6337.jpg",
    },
    {
      "url":"https://www.aabu.edu.jo/EN/collegesandinstitutes/Engineering//Slider/%d9%a2%d9%a0%d9%a2%d9%a0%d9%a1%d9%a2%d9%a2%d9%a4_%d9%a1%d9%a3%d9%a5%d9%a7%d9%a1%d9%a7.jpg",
    },

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title:Text("الصفحة الرئيسية",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
        centerTitle: true,),
        body:Column(
          children: [
            _imageSlider(sliderList),
            _mainButton(),
            ],
        )
    );
  }



  Widget _imageSlider(List sliderList) {
    return Container(
      width: double.infinity,
      child:ImageSlideshow(
        width: double.infinity,
        height: 200,
        initialPage: 1,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        autoPlayInterval: 3000,
        isLoop: true,
        children: List.generate(
            sliderList.length,
                (index) {
              return _sliderItem(
                  sliderList[index]['url']);
            }
        )
    ) ,);
  }

  Widget _sliderItem(String url){
      return Container(
        width: double.infinity,
        decoration:BoxDecoration(
          image: DecorationImage(image: NetworkImage(url))
        ) ,
      );
    }

  Widget _mainButton(){
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(70)),
      width: 300,
      height: 40,
      margin: EdgeInsets.only(top: 40), 
      child: ElevatedButton(
        style:ElevatedButton.styleFrom(
          primary: Color(0xFF1565C0),
        ),
        child: Text("الكليات",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        onPressed: (){
          Navigator.of(context).pushNamed("/collegs");
        },
      ),
    );
  }


}
