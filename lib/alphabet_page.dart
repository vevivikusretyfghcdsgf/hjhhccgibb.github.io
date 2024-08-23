import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lenche/providers/alphabet_provider.dart';
import 'package:provider/provider.dart';

class AlphabetPage extends StatelessWidget {
  const AlphabetPage({super.key});

  Future<List<Map<String, dynamic>>> _fetchData() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('alphabet').get();

    return snapshot.docs.map((doc) {
      return {
        'name': doc['name'],
        'audioUrl': doc['audioUrl'],
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => AlphabetProvider(),
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
                final playerProvider = Provider.of<AlphabetProvider>(context);
                return ListTile(
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(item['name']!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                      const SizedBox(width: 8),
                      if (playerProvider.currentlyPlayingIndex == index)
                        const Icon(Icons.volume_up, color: Colors.blue,)
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.play_arrow, size: 32,),
                    onPressed: () => playerProvider.playAudio(item['audioUrl'], index),
                  ),
                );
              },
            );
          }
        },
      ),
    ));
  }
}