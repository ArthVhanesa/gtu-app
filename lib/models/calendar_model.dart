// Unused model
// For Academic Calender use circular model

class AcademicCalenderModel {
  String? sId;
  String? date;
  List<Ptags>? ptags;

  AcademicCalenderModel({this.sId, this.date, this.ptags});

  AcademicCalenderModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    date = json['date'];
    if (json['ptags'] != null) {
      ptags = <Ptags>[];
      json['ptags'].forEach((v) {
        ptags!.add(new Ptags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['date'] = this.date;
    if (this.ptags != null) {
      data['ptags'] = this.ptags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ptags {
  Null? ptext;
  List<Atags>? atags;

  Ptags({this.ptext, this.atags});

  Ptags.fromJson(Map<String, dynamic> json) {
    ptext = json['ptext'];
    if (json['atags'] != null) {
      atags = <Atags>[];
      json['atags'].forEach((v) {
        atags!.add(new Atags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ptext'] = this.ptext;
    if (this.atags != null) {
      data['atags'] = this.atags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Atags {
  String? atext;
  String? link;

  Atags({this.atext, this.link});

  Atags.fromJson(Map<String, dynamic> json) {
    atext = json['atext'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['atext'] = this.atext;
    data['link'] = this.link;
    return data;
  }
}
