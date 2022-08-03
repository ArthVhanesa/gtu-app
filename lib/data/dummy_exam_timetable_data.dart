final course = <String>["BE - Bachelor of Engineering"];
final sem = ["Sem 1", "Sem 2", "Sem 3", "Sem 4", "Sem 5"];

class ExamTimetableData {
  String subCode;
  String subName;
  String date;
  String time;
  String marks;

  ExamTimetableData({
    required this.subCode,
    required this.subName,
    required this.date,
    required this.time,
    required this.marks,
  });
}

List<ExamTimetableData> examTimetableData = [
  ExamTimetableData(
      subCode: '3110005',
      subName: 'Basic Electrical Engineering',
      date: '20 Jan 2020',
      time: '10:30 AM TO 01:30 PM',
      marks: '70'),
  ExamTimetableData(
      subCode: '3110005',
      subName: 'Basic Electrical Engineering',
      date: '20 Jan 2020',
      time: '10:30 AM TO 01:30 PM',
      marks: '70'),
  ExamTimetableData(
      subCode: '3110005',
      subName: 'Basic Electrical Engineering',
      date: '20 Jan 2020',
      time: '10:30 AM TO 01:30 PM',
      marks: '70'),
  ExamTimetableData(
      subCode: '3110005',
      subName: 'Basic Electrical Engineering',
      date: '20 Jan 2020',
      time: '10:30 AM TO 01:30 PM',
      marks: '70'),
];
