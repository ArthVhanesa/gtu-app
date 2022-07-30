class TimeTableModel {
  String? sId;
  String? branch;
  String? subcode;
  String? subname;
  String? date;
  String? time;
  String? olddate;
  String? oldtime;

  TimeTableModel(
      {this.sId,
      this.branch,
      this.subcode,
      this.subname,
      this.date,
      this.time,
      this.olddate,
      this.oldtime});

  TimeTableModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    branch = json['branch'];
    subcode = json['subcode'];
    subname = json['subname'];
    date = json['date'];
    time = json['time'];
    olddate = json['olddate'];
    oldtime = json['oldtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['branch'] = this.branch;
    data['subcode'] = this.subcode;
    data['subname'] = this.subname;
    data['date'] = this.date;
    data['time'] = this.time;
    data['olddate'] = this.olddate;
    data['oldtime'] = this.oldtime;
    return data;
  }
}
