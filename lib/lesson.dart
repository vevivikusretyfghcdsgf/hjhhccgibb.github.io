import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Lesson extends StatelessWidget {
  const Lesson({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> lesson = FirebaseFirestore.instance
        .collection('lessons').snapshots();
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
          stream: lesson,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
                child: const Center(child: CircularProgressIndicator()),
              );
            }

            final lessonData = (snapshot.data!).docs;
            lessonData.shuffle();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                primary: false,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: lessonData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: MediaQuery.of(context).size.width/1.5,
                ),
                itemBuilder: (context, index) {
                  final productData = lessonData[index];
                  return GestureDetector(
                    onTap: () {
                      /*Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return ProductDetailPage(productData: productData);
                          }));*/
                    },
                    child: Card(
                      elevation: 0,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(11),
                            child: SizedBox(
                              height: 170,
                              width: MediaQuery.of(context).size.width / 2.1,
                              child: Image.asset(productData['image']),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 0, right: 8, bottom: 0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${productData['name']} ₽',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontFamily:
                                      'YsabeauInfant-VariableFont_wght',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
              ],
            );
          }),
    );
  }
}
