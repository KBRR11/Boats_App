import 'package:botes_app/pages/detail_page.dart';
import 'package:botes_app/widgets/navigation_fadein.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: getAppBar(),

        body: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
          child: PageView(
            children:[
              Container(
                //color: Colors.red,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    Container(
                      height: size.height*.75,
                      width: size.width,
                      //color: Colors.blue,
                      child: Hero(
                        tag: 'tag',
                        child: Image(image: AssetImage('assets/boat1.png'))),
                    ),
                    Text('X12 FORCE', style: TextStyle(fontSize: 28),),
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(text: 'By ', style: TextStyle(color: Colors.black)),
                        TextSpan(text: 'MasterCraft', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                      ]
                    )),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
                        print("Ir a detalle");
                       Navigator.push(
                                context,
                                navigationFadeIn(
                                    context,
                                    DetailPage(),
                                    500));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text('VER', style: TextStyle(color: Colors.blue[700], fontSize: 23),),
                        Icon(Icons.arrow_forward_ios_outlined, color: Colors.blue[700],)
                      ],),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.green,
              )
            ]
          )
        )
      ),
    );
  }

  AppBar getAppBar(){
    return AppBar(
          title: Row(
            children: [
              SizedBox(width: 15,),
              Text("Botes", style: GoogleFonts.rubik(textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 29))),
            ],
          ),
          toolbarHeight:65, 
          shadowColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: (){print("Busqueda");}, 
              icon: Icon(Icons.search, color: Colors.black, size: 29,)),
              SizedBox(width: 15,)
          ]
        );
  }
}