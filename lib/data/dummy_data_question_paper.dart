class DummyDataQuestionPaper {
  String subCode;
  String previous;
  String subName;

  DummyDataQuestionPaper({
    required this.subCode,
    required this.previous,
    required this.subName,
  });
}

List<DummyDataQuestionPaper> dummyDataQuestionPaper = [
  DummyDataQuestionPaper(
      subCode: '123456', previous: 'W2020', subName: 'Dummy Dummy Dummy Dummy'),
  DummyDataQuestionPaper(
      subCode: '564565',
      previous: 'W2021',
      subName: 'Dummy1 Dummy1 Dummy1 Dummy1'),
  DummyDataQuestionPaper(
      subCode: '231136',
      previous: 'W2321',
      subName: 'Dummy2 Dummy2 Dummy2 Dummy2'),
  DummyDataQuestionPaper(
      subCode: '231136',
      previous: 'W2321',
      subName: 'Dummy2 Dummy2 Dummy2 Dummy2'),
];
