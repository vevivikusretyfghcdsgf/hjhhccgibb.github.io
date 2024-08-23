import 'package:flutter/material.dart';

import 'models/card_data.dart';

class CardWidget extends StatelessWidget {
  final CardData cardData;

  const CardWidget({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: Card(
        //width: MediaQuery.of(context).size.width / 2,
        child: Column(
          key: ValueKey<String>(cardData.text),  // Используем текст как ключ для уникальности
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(cardData.imageUrl,
            width: MediaQuery.of(context).size.width / 2,),
            Text(cardData.text, style: const TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
