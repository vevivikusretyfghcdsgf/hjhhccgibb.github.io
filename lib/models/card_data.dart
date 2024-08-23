import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<CardData>> fetchCards() async {
  final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('lessons')
    .where('lesson', isEqualTo: 0.1).get();
  return snapshot.docs.map((doc) => CardData.fromDocument(doc)).toList();
}

class CardData {
  final String imageUrl;
  final String text;
  final String audioUrl;

  CardData({required this.imageUrl, required this.text, required this.audioUrl});

  factory CardData.fromDocument(DocumentSnapshot doc) {
    return CardData(
      imageUrl: doc['image'],
      text: doc['name'],
      audioUrl: doc['audioUrl'],
    );
  }
}