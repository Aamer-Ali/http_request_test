class StateList {
  List<Statelist> statelist;

  StateList({this.statelist});

  StateList.fromJson(Map<String, dynamic> json) {
    if (json['statelist'] != null) {
      statelist = new List<Statelist>();
      json['statelist'].forEach((v) {
        statelist.add(new Statelist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.statelist != null) {
      data['statelist'] = this.statelist.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Statelist {
  Error error;
  Record record;

  Statelist({this.error, this.record});

  Statelist.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    record =
    json['record'] != null ? new Record.fromJson(json['record']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    if (this.record != null) {
      data['record'] = this.record.toJson();
    }
    return data;
  }
}

class Error {
  String iserror;
  String errordescription;
  int rowcount;

  Error({this.iserror, this.errordescription, this.rowcount});

  Error.fromJson(Map<String, dynamic> json) {
    iserror = json['iserror'];
    errordescription = json['errordescription'];
    rowcount = json['rowcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iserror'] = this.iserror;
    data['errordescription'] = this.errordescription;
    data['rowcount'] = this.rowcount;
    return data;
  }
}

class Record {
  String stateno;
  String statename;
  String statecode;
  String statestatus;

  Record({this.stateno, this.statename, this.statecode, this.statestatus});

  Record.fromJson(Map<String, dynamic> json) {
    stateno = json['stateno'];
    statename = json['statename'];
    statecode = json['statecode'];
    statestatus = json['statestatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stateno'] = this.stateno;
    data['statename'] = this.statename;
    data['statecode'] = this.statecode;
    data['statestatus'] = this.statestatus;
    return data;
  }
}
