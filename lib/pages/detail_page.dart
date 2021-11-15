import 'package:flutter/material.dart';
import 'dart:math' as Math;

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<double> translationX;
  late Animation<double> translationY;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
        
    rotation = Tween(begin: 0.0, end:-Math.pi/2).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut)));
    translationX = Tween(begin: 0.0, end:190.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut)));  
    translationY = Tween(begin: 0.0, end:-210.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut)));       

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    controller.forward();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          //imagenBote()
          Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
          ),
          AnimatedBuilder(
            animation: controller,
            child: Container(
                height: size.height*0.7,
                width: size.width,
                //color: Colors.red,
                child: Hero(
                  tag: 'tag',
                  child: Image(image: AssetImage('assets/boat1.png'))),
              ),
            builder: (BuildContext context, Widget? child){
              
                 return  Transform.translate(offset: Offset(translationX.value, translationY.value),

                 child: Transform.rotate(
                         angle: rotation.value,
                          child: child,)
              
            );
            },
          )
        ],),
      ),
    );
  }
}