class SyllabusModel {
  String? sId;
  String? subcode;
  String? pdflink;
  String? branchcode;
  String? efffrom;
  String? subname;
  String? category;
  String? sem;
  String? l;
  String? t;
  String? p;
  String? totalcredit;
  String? e;
  String? m;
  String? i;
  String? v;
  String? totalmarks;

  SyllabusModel(
      {this.sId,
      this.subcode,
      this.pdflink,
      this.branchcode,
      this.efffrom,
      this.subname,
      this.category,
      this.sem,
      this.l,
      this.t,
      this.p,
      this.totalcredit,
      this.e,
      this.m,
      this.i,
      this.v,
      this.totalmarks});

  SyllabusModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    subcode = json['subcode'];
    pdflink = json['pdflink'];
    branchcode = json['branchcode'];
    efffrom = json['efffrom'];
    subname = json['subname'];
    category = json['category'];
    sem = json['sem'];
    l = json['l'];
    t = json['t'];
    p = json['p'];
    totalcredit = json['totalcredit'];
    e = json['e'];
    m = json['m'];
    i = json['i'];
    v = json['v'];
    totalmarks = json['totalmarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['subcode'] = this.subcode;
    data['pdflink'] = this.pdflink;
    data['branchcode'] = this.branchcode;
    data['efffrom'] = this.efffrom;
    data['subname'] = this.subname;
    data['category'] = this.category;
    data['sem'] = this.sem;
    data['l'] = this.l;
    data['t'] = this.t;
    data['p'] = this.p;
    data['totalcredit'] = this.totalcredit;
    data['e'] = this.e;
    data['m'] = this.m;
    data['i'] = this.i;
    data['v'] = this.v;
    data['totalmarks'] = this.totalmarks;
    return data;
  }
}
