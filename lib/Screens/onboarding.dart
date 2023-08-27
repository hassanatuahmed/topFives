import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/onboard-model.dart';


class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageIndex < 3) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }

      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    // Dispose everything
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: demoData.length,
                controller: _pageController,
                itemBuilder: (context, index) =>
                    OnBoardContent(
                      title: demoData[index].title,
                      description: demoData[index].description,
                      image: demoData[index].image,
                      pageIndex: _pageIndex,
                    ),
              ),
            ),




            // White space
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0,left: 30.0),
              child: InkWell(
                onTap: () {
                  print("Button clicked!");
                },
                child: Container(
                  // margin: const EdgeInsets.only(bottom: 40),
                  height: Get.height * 0.055,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: HexColor("#3592FF"),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  const Center(
                    child: Text('Next', style:
                        TextStyle(fontFamily: "HappyMonkey",fontWeight: FontWeight.w600,
                       color: Colors.white, fontSize: 18),),
                  ),

                ),

              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 50),
                child:  Text("Skip now",style: TextStyle(fontSize:15,fontWeight: FontWeight.w600, color: HexColor("#3592FF")),)),
            const SizedBox(height: 10,),


          ],
        )
    ),

    );
  }
}


// Dot indicator widget
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive ? HexColor("#65C8FF"): Colors.white,
        border: isActive ? null : Border.all(color: HexColor("#65C8FF")),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class OnBoardContent extends StatelessWidget {
  OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.pageIndex,
  });

  String image;
  String title;
  String description;
  int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(


            width: double.infinity,
            child: Image.asset(image,fit: BoxFit.cover,)),
       const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(demoData.length, (index) =>
             Padding(padding: const EdgeInsets.only(right: 4),
            child: DotIndicator(isActive: index == pageIndex,),),)

        ],),

        Spacer(),

        Padding(
          padding: const EdgeInsets.only(right: 30.0,left: 30.0),
          child: Text(
            title,textAlign: TextAlign.center,
            style:  TextStyle(
              color: HexColor("#000000"),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30.0,left: 30.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style:  TextStyle(
              color: HexColor("#A5A5A5"),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),


      ],
    );
  }
}
