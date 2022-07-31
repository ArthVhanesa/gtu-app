class QuestionPaperModel {
  String? sId;
  String? session;
  String? subcode;
  String? pdflink;

  QuestionPaperModel({this.sId, this.session, this.subcode, this.pdflink});

  QuestionPaperModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    session = json['session'];
    subcode = json['subcode'];
    pdflink = json['pdflink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['session'] = this.session;
    data['subcode'] = this.subcode;
    data['pdflink'] = this.pdflink;
    return data;
  }
}
