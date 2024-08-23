import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class MyHomePage extends StatelessWidget {

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb3d4b3),
      body: Stack(children: [
        ZoomIn(
          child: Align(
            alignment: const Alignment(3, -1.3),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 3000),
              height: MediaQuery.of(context).size.height / 3.2,
              width: MediaQuery.of(context).size.height / 3.2,
              decoration: const BoxDecoration(
                  color: Color(0xFF007000),
                  borderRadius: BorderRadius.all(Radius.circular(200))),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  'МОТТ БУ - КЪАМ ДУ, МОТТ БАЦ - КЪАМ ДАЦ'.toUpperCase(),
                  style: GoogleFonts.kurale(textStyle: const TextStyle(
                      fontSize: 50, fontWeight: FontWeight.bold, height: 1.3),)
                ),
                const Text('(Есть язык - Есть народ, \nНет языка - Нет народа)'),
              ]),
            ),
            Column(children: [
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 7,
                  child: Container(
                    padding: const EdgeInsets.only(right: 40, left: 40),
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Center(
                      child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                        RotateAnimatedText(
                            "Try the Worlds leading online chechen language tutorial center",
                            textStyle: const TextStyle(fontSize: 15)),
                        RotateAnimatedText("Попробуйте ведущий в мире онлайн-центр обучения чеченскому языку",
                            textStyle: const TextStyle(fontSize: 15)),
                        RotateAnimatedText(
                            "Essayed le premier centre de didactics en line sur la language tchétchène au monde",
                            textStyle: const TextStyle(fontSize: 15))
                      ]),
                    ),
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color(0xFF007000),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: MediaQuery.of(context).size.height / 17,
                  child: const Center(
                    child: Text(
                      'Вперед',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ],),
          ],
        ),
      ]),
    );
  }
}