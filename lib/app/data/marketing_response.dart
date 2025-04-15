class marketing_response {
  bool? status;
  String? message;
  List<Data>? data;

  marketing_response({this.status, this.message, this.data});

  marketing_response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? idUmkm;
  String? bulan;
  int? tahun;
  String? targetTahunan;
  String? targetBulanan;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.idUmkm,
      this.bulan,
      this.tahun,
      this.targetTahunan,
      this.targetBulanan,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUmkm = json['id_umkm'];
    bulan = json['bulan'];
    tahun = json['tahun'];
    targetTahunan = json['target_tahunan'];
    targetBulanan = json['target_bulanan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_umkm'] = this.idUmkm;
    data['bulan'] = this.bulan;
    data['tahun'] = this.tahun;
    data['target_tahunan'] = this.targetTahunan;
    data['target_bulanan'] = this.targetBulanan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
