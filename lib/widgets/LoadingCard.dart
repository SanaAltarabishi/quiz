import 'package:flutter/material.dart';
import 'package:quiz/widgets/option.dart';
import 'package:shimmer/shimmer.dart';

Shimmer LoadingCard (){
  return Shimmer.fromColors(
    child: Padding(padding:EdgeInsets.only(bottom: 10),
    child: 
    SingleChildScrollView(
      child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset('images/circlequiz.png'),
                  ),
          
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset('images/thunder.png'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 150),
                          child: Container(
                            height: 205,
                            width: 281,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color(0xffDA8BD9), Color(0xffF3BD6B)],
                                ),
                                borderRadius: BorderRadius.circular(20)),
                          
                            
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Container(
                            width: 67,
                            height: 67,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xffDA8BD9), Color(0xffF3BD6B)],
                              ),
                              borderRadius: BorderRadius.circular(35),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
             Container(
            width: 240,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),),
              SizedBox(
                height: 20,
              ),
                   Container(
            width: 240,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),),
           
              SizedBox(
                height: 20,
              ),
                  Container(
            width: 240,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),),
              
              SizedBox(
                height: 20,
              ),
                  Container(
            width: 240,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),),
           
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset('images/thunderbolt 2.png'),
              ),
            ],
          ),
    ),
      ),

   baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100);
}