import 'question.dart';

class QuizBrain {

  int _questionNum = 0;

  List<Question> _questionBank = [
    Question(q:'Max Planck’s great discovery was that radiation energy is emitted in packets he called Quanta.', a: true),
    Question(q:'When two particles are entangled and it is observed that one has its spin up and it takes a microsecond for the other\'s spin to come down.', a: false),
    Question(q:'In the Heisenberg uncertainty principle, the position and momentum of a particle cannot be observed precisely at the same time.', a: true),
    Question(q:'Niels Bohr used quantum mechanics to describe Carbon.', a: false),
    Question(q:'The square of a particle’s wave function describes the probability that it is at a particular place.', a: true),
    Question(q:'The Dirac equation shows that every particle has a wave function.', a: false),
    Question(q:'In quantum mechanics, the angular momentum of a particle is called "spin".', a: true),
    Question(q:'Positron was the first antiparticle to be discovered.', a: true),
    Question(q:'Momentum is one of the four basic forces.', a: false),
    Question(q:'In 1915, Einstein published the general theory of relativity.', a: true),
    Question(q:'Blue light has a greater frequency than red light.', a: true)
  ];

  void nextQuestion() {
    if (_questionNum < _questionBank.length - 1) {
      _questionNum++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNum].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionNum].questionAns;
  }

  bool gameOver() {
    if (_questionNum >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  //Restart Game
  void restart() {
    _questionNum = 0;
  }

}
