class QuestionModel {
  final String text;
  final List<String> answers;

  const QuestionModel(this.text, this.answers);

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
