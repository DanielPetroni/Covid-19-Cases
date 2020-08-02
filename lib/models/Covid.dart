class Covid {
  List<Data> data;

  Covid({this.data});

  Covid.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int uid;
  String uf;
  String state;
  int cases;
  int deaths;
  int suspects;
  int refuses;
  String datetime;

  Data(
      {this.uid,
      this.uf,
      this.state,
      this.cases,
      this.deaths,
      this.suspects,
      this.refuses,
      this.datetime});

  Data.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    uf = json['uf'];
    state = json['state'];
    cases = json['cases'];
    deaths = json['deaths'];
    suspects = json['suspects'];
    refuses = json['refuses'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['uf'] = this.uf;
    data['state'] = this.state;
    data['cases'] = this.cases;
    data['deaths'] = this.deaths;
    data['suspects'] = this.suspects;
    data['refuses'] = this.refuses;
    data['datetime'] = this.datetime;
    return data;
  }
}
