import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'models/card_data.dart';
import 'card_widget.dart';

class CardsPageTwo extends StatefulWidget {
  const CardsPageTwo({super.key});

  @override
  State<CardsPageTwo> createState() => _CardsPageTwoState();
}

class _CardsPageTwoState extends State<CardsPageTwo> with SingleTickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  int _currentIndex = 0;
  int _quizIndex = 0;
  List<CardData> _cards = [];
  bool _showQuiz = false;
  bool _isCorrect = false;
  bool _isPlayingFirstCard = true;
  bool _showSecondQuiz = false;
  String? _selectedAnswer;


  @override
  void initState() {
    super.initState();

    fetchCards().then((cards) {
      setState(() {
        _cards = cards;
      });
      _playAudioForFirstCard();
    });

    _audioPlayer.onPlayerComplete.listen((_) {

        print('222222222 $_showSecondQuiz');

        if (_isPlayingFirstCard) {
          setState(() {
            _isPlayingFirstCard = false;
            _playAudioForSecondCard();
          });
        } else if (_currentIndex + 2 < _cards.length) {
          setState(() {
            _isPlayingFirstCard = true;
            _currentIndex += 2;
            _playAudioForFirstCard();
          });
        } else if(_showSecondQuiz) {
          //_playAudioForQuizCard();
        } else {
          setState(() {
            print('jkjkjjkjjkjkjjjjjjjjkjkjjkj');
            _showQuiz = true;
          });

        }
    });
  }


  void _playAudioForFirstCard() async {
    if (_currentIndex < _cards.length) {
      try {
        await _audioPlayer.play(AssetSource(_cards[_currentIndex].audioUrl));
        //await _audioPlayer.pause();
      } catch (e) {
        print('Exception $e');
      }
    }
  }

  void _playAudioForSecondCard() async {
    if (_currentIndex + 1 < _cards.length) {
      try {
        await _audioPlayer.play(AssetSource(_cards[_currentIndex + 1].audioUrl));
        //await _audioPlayer.pause();
      } catch (e) {
        print('Exception $e');
      }
    }
  }

  void  _playAudioForQuizCard() async {
    print('11111111111111');
    if (_quizIndex < _cards.length) {
      try {
        print('2222222222222');
        await _audioPlayer.setSourceAsset(_cards[_quizIndex].audioUrl);
        await _audioPlayer.resume();

        /*_audioPlayer.onPlayerComplete.listen((_) {

            _audioPlayer.stop();

        });*/
      } catch (e) {
        print(e);
      }
    } else {
      _showSecondQuiz = false;
    }
  }

  void _checkAnswer(String selectedAnswer, String correctAnswer) {
    setState(() {
      _selectedAnswer = selectedAnswer;
      _isCorrect = selectedAnswer == correctAnswer;
      if (_isCorrect) {
        _quizIndex++;
      }});
    print('4444444444444 $_showSecondQuiz');

    Future.delayed(const Duration(seconds: 1), () {
        _nextQuizOrEnd();
      });
  }

  void _nextQuizOrEnd() {
    if (_quizIndex < _cards.length) {
      setState(() {
        _selectedAnswer = null;
        _isCorrect = false;
      });
    } else if (_showSecondQuiz == false) {
      setState(() {
        _showQuiz = false;
        _showSecondQuiz = true;
        _quizIndex = 0;
        _selectedAnswer = null;
        _isCorrect = false;
        _currentIndex = _cards.length;
      });
    } else {
      setState(() {
        _showSecondQuiz = false;
        print('11111111111111 $_showSecondQuiz');
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    print('9999999999999999 $_showSecondQuiz');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards')),
      body: Center(
        child: _cards.isEmpty
            ? const CircularProgressIndicator()
            : _showQuiz
            ? _buildQuiz()
            : _showSecondQuiz
            ? _buildSecondQuiz()
            : _currentIndex < _cards.length
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCardWidget(_cards[_currentIndex], _isPlayingFirstCard),
            if (_currentIndex + 1 < _cards.length)
              _buildCardWidget(_cards[_currentIndex + 1], !_isPlayingFirstCard),
          ],
        )
            : const Text(
          'Все карточки просмотрены!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
  Widget _buildQuiz() {
    if (_quizIndex < _cards.length) {
      final correctAnswer = _cards[_quizIndex].text;
      final answers = [..._cards.sublist(0, 4).map((c) => c.text).toList()..shuffle()];
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(_cards[_quizIndex].imageUrl),
          ...answers.map((answer) => ElevatedButton(
            onPressed: () {
              _checkAnswer(answer, correctAnswer);
            },
            child: Text(answer),
          )),
          if (_selectedAnswer != null)
            Icon(
              _isCorrect ? Icons.check : Icons.close,
              color: _isCorrect ? Colors.green : Colors.red,
              size: 48,
            ),
        ],
      );
    } else {
      return const CircularProgressIndicator();
    }

  }

  Widget _buildSecondQuiz() {
    if (_quizIndex < _cards.length) {
      final correctAnswer = _cards[_quizIndex].imageUrl;
      final answers = [..._cards.sublist(0, 4).map((c) => c.imageUrl).toList()..shuffle()];
      _playAudioForQuizCard();
      print('333333333333 $_showSecondQuiz');
      print('ppppppppppp $_quizIndex');

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('jljljjl'),
          ...answers.map((answer) => ElevatedButton(onPressed: () {
            _checkAnswer(answer, correctAnswer);
          },
              child: Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(answer)))),
          if (_selectedAnswer != null)
            Icon(
              _isCorrect ? Icons.check : Icons.close,
              color: _isCorrect ? Colors.green : Colors.red,
              size: 48,
            ),
        ],
      );
    } else {
      return const CircularProgressIndicator();
    }

  }

  Widget _buildCardWidget(CardData card, bool isHighlighted) {
    return Opacity(
      opacity: isHighlighted ? 1.0 : 0.5,
      child: CardWidget(cardData: card),
    );
  }
}
