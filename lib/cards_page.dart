import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'models/card_data.dart';
import 'card_widget.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> with SingleTickerProviderStateMixin{
  final PageController _pageController = PageController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _currentIndex = 0;
  bool _isPlaying = false;
  List<CardData> _cards = [];
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
    duration: Duration(seconds: 1))..addStatusListener((status) {
      if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        _animationController.reverse();
      }
    });

    fetchCards().then((cards) {
      setState(() {
        _cards = cards;
      });
      _playAudioForCurrentCard();
    });

    _audioPlayer.onPlayerComplete.listen((_) {
      _animationController.stop();
      setState(() {
        _isPlaying = false;
        if (_currentIndex < _cards.length - 1) {
          _currentIndex++;
          _playAudioForCurrentCard();
        } else {
          _audioPlayer.stop();
          _animationController.stop();
          _showTextWidget();
        }
      });

    });
    /*_animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);*/
  }



  void _playAudioForCurrentCard() async {
    if (_currentIndex < _cards.length) {
      try {
        setState(() {
          _isPlaying = true;
          _animationController.repeat(reverse: true);
        });
        await _audioPlayer.setSourceAsset(_cards[_currentIndex].audioUrl);
        await _audioPlayer.resume();
        print('objectkjkjhhhjhhjhhjhjhkjj');
      } catch (e) {
        print('$e ttttttttttttttttttttttttt');
      }
    } else {
      _audioPlayer.stop();
      _animationController.stop();
      setState(() {
        _isPlaying = false;
        _showTextWidget();
      });
    }
  }

  void _showTextWidget() {
    setState(() {
      _currentIndex = _cards.length;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards')),
      body: Center(
        child: _cards.isEmpty
            ? const CircularProgressIndicator()
            : _currentIndex < _cards.length ? AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: Stack(
            key: ValueKey<int>(_currentIndex),
            alignment: Alignment.center,
            children: [
              CardWidget(cardData: _cards[_currentIndex],),
              if (_isPlaying) ScaleTransition(
                scale: Tween<double>(begin: 1.0, end: 1.5).animate(_animationController),
                child: const Icon(Icons.volume_up, size: 50, color: Colors.blueAccent,),
              )
            ],
          )



        ) : Center(child: Text('data'))
      ),
    );
  }
}
