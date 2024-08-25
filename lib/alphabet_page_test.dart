import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lenche/providers/alphabet_provider.dart';
import 'package:provider/provider.dart';


class AlphabetPageTest extends StatelessWidget {
  const AlphabetPageTest({super.key});

  Future<List<Map<String, dynamic>>> _fetchData() async {
    final DocumentSnapshot snapshot =
    await FirebaseFirestore.instance.collection('alphabett').doc('TzevGt8ifd5Y8gyq060M').get();

    final List<dynamic> list1 = snapshot['name'];
    final List<dynamic> list2 = snapshot['audioUrl'];

    List<Map<String, dynamic>> combinedList = [];
    for (int i = 0; i < list1.length; i++) {
      combinedList.add({
        'name': list1[i],
        'audioUrl': list2[i],
      });
    }

    return combinedList;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AlphabetProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Audio List')),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: _fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data found'));
            } else {
              final data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  final playerProvider =
                  Provider.of<AlphabetProvider>(context);
                  return ListTile(
                    title: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24),),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.play_arrow,
                        size: 32,
                        color: playerProvider.currentlyPlayingIndex == index
                            ? Colors.blue
                            : Colors.black,
                      ),
                      onPressed: () =>
                          playerProvider.playAudio(item['audioUrl'], index),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}