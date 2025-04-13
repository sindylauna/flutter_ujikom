class operasional_response {
  bool? status;
  List<Data>? data;

  operasional_response({this.status, this.data});

  operasional_response.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? idUmkm;
  String? jmlKaryawan;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id, this.idUmkm, this.jmlKaryawan, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUmkm = json['id_umkm'];
    jmlKaryawan = json['jml_karyawan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_umkm'] = this.idUmkm;
    data['jml_karyawan'] = this.jmlKaryawan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
