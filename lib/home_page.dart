import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lenche/intro_lesson.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  /*final List<Widget> _myWidget = [
    const HomePage(),
    const CategoryPage(),
    const SearchPage(),
    const CartPage(),
    const VendorUserStream(),
  ];*/

  List<String> gridhead = ["Основы языка", "Приветствие", "Счет", "Покупки", "Основы языка", "Приветствие", "Счет", "Покупки",];


  int selected = 0;


  @override
  Widget build(BuildContext context) {
    //final CartProvider cartProvider = Provider.of<CartProvider>(context);
    //final item = cartProvider.getCartItem.length;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              const Text(
                "Hello Name",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 24),
              const Text(
                'Курс Чеченского языка',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
              InkWell(onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return IntroLesson();
                    }));
              },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xFF007000),
                  ),
                  margin: const EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height / 5.5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                            child: Text('ВВОДНЫЙ УРОК', style: TextStyle(color: Colors.white),)),
                      ),
                      Image.asset('assets/image_app/bookche.png')
                    ],
                  ),
                ),
              ),
              GridView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: gridhead.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: MediaQuery.of(context).size.width/1.8,
                  ),
                  //primary: false,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0xff2b7338),
                        ),
                        margin: const EdgeInsets.all(8),
                        //height: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(gridhead[index],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),),
                            Padding(padding:
                              const EdgeInsets.all(8),
                              child: Center(child:
                              LinearPercentIndicator(
                                animation: true,
                                lineHeight: 4,
                                backgroundColor: Colors.amber,
                                barRadius: const Radius.circular(20),
                                progressColor: Colors.green,
                                percent: 1.0,
                              ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),

        //body: _myWidget[context.watch<MainAppState>().getSelectedIndex],
        bottomNavigationBar: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: CupertinoTabBar(
            /*currentIndex: context.watch<MainAppState>().getSelectedIndex,
            onTap: (index) {
              context.read<MainAppState>().updateSelectedIndex(index);
            },*/
            items: <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.book_fill, size: 40,),
              ),
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2_fill, size: 40,),
              ),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.square_favorites_fill, size: 40,),

                /*Builder(builder: (context) {
                    if (item >= 1) {
                      return Stack(children: [
                        const Icon(CupertinoIcons.cart_fill),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  color: Colors.red),
                              child: Text(
                                '$item',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ]);
                    } else {
                      return const Icon(CupertinoIcons.cart_fill);
                    }
                  })*/
              ),
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_alt, size: 40,),
              ),
            ],
          ),
        )
    );
  }
}

