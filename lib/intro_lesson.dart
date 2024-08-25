import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lenche/alphabet_page.dart';
import 'package:lenche/cards_page.dart';
import 'package:lenche/cards_page_two.dart';
import 'package:lenche/lesson.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'alphabet_page_test.dart';

class IntroLesson extends StatelessWidget {
   IntroLesson({super.key});

  List<String> gridIcon = [
    "assets/image_app/reading.png",
    "assets/image_app/lis.png",
    "assets/image_app/speaking.png",
    "assets/image_app/writing.png",
  ];

   List<String> gridhead = [
     "ЧТЕНИЕ",
     "ПРОСЛУШИВАНИЕ",
     "ПРОГОВАРИВАНИЕ",
     "ПИСЬМО"];

   List<dynamic> gridNav = [
     CardsPage(),
     CardsPageTwo(),
     Lesson(),
     Lesson(),
   ];


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('ОСНОВНЫЕ УРОКИ:', style: TextStyle(fontWeight: FontWeight.w700),),
              InkWell(onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return const AlphabetPageTest();
                    }));
              },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: Colors.grey.shade200,
                  ),
                  margin: const EdgeInsets.all(4),
                  height: MediaQuery.of(context).size.height / 12,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text('ЧЕЧЕНСКИЙ АЛФАВИТ', style: TextStyle(fontWeight: FontWeight.w500),)),
                  ),
                ),
              ),
              InkWell(onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return const AlphabetPageTest();
                    }));
              },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: Colors.grey.shade200,
                  ),
                  margin: const EdgeInsets.all(4),
                  height: MediaQuery.of(context).size.height / 12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('ВВОДНЫЙ УРОК', style: TextStyle(fontWeight: FontWeight.w500),),
                            ),
                            Container(
                              width: 200,
                              child: LinearPercentIndicator(
                                animation: true,
                                lineHeight: 4,
                                backgroundColor: Colors.amber,
                                barRadius: const Radius.circular(20),
                                progressColor: Colors.green,
                                percent: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('1.1', style: TextStyle(fontSize: 24)),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return IntroLesson();
                    }));
              },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: Colors.grey.shade200,
                  ),
                  margin: const EdgeInsets.all(4),
                  height: MediaQuery.of(context).size.height / 12,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('ВВОДНЫЙ УРОК', style: TextStyle(fontWeight: FontWeight.w500),)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('1.2', style: TextStyle(fontSize: 24)),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return IntroLesson();
                    }));
              },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: Colors.grey.shade200,
                  ),
                  margin: const EdgeInsets.all(4),
                  height: MediaQuery.of(context).size.height / 12,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text('ВВОДНЫЙ УРОК', style: TextStyle(fontWeight: FontWeight.w500),)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('1.3', style: TextStyle(fontSize: 24)),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text('УПРАЖНЕНИЯ:', style: TextStyle(fontWeight: FontWeight.w700),),
              ListView.builder(
                primary: false,
                  shrinkWrap: true,
                  itemCount: gridhead.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                gridNav[index]));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          color: Colors.grey.shade200,
                        ),
                        margin: const EdgeInsets.all(4),
                        height: MediaQuery.of(context).size.height / 11,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(gridIcon[index]),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(gridhead[index], style: const TextStyle(fontWeight: FontWeight.w500),)),
                            ),
                          ],
                        ),
                      ),




                      /*Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Container(decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              margin: const EdgeInsets.all(8),
                              height: MediaQuery.of(context).size.height / 5.5,
                            ),
                          ),
                          Container(decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30))),
                              height: MediaQuery.of(context).size.height / 4,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Image.asset(gridIcon[index]),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text(gridhead[index],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              3.0),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                              const EdgeInsets
                                                  .symmetric(
                                                  horizontal:
                                                  18),
                                              child:
                                              LinearPercentIndicator(
                                                animation: true,
                                                lineHeight: 4,
                                                backgroundColor: Colors.amber,
                                                barRadius:
                                                const Radius.circular(20),
                                                progressColor: Colors.green,
                                                percent: 1.0,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),*/
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
