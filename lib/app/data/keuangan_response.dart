class keuangan_response {
  bool? status;
  String? message;
  List<Data>? data;

  keuangan_response({this.status, this.message, this.data});

  keuangan_response.fromJson(Map<String, dynamic> json) {
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
  String? tanggal;
  int? income;
  int? outcome;
  int? profitLoss;
  String? status;
  String? statusVerifikasi;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.idUmkm,
      this.tanggal,
      this.income,
      this.outcome,
      this.profitLoss,
      this.status,
      this.statusVerifikasi,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUmkm = json['id_umkm'];
    tanggal = json['tanggal'];
    income = json['income'];
    outcome = json['outcome'];
    profitLoss = json['profit_loss'];
    status = json['status'];
    statusVerifikasi = json['status_verifikasi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_umkm'] = this.idUmkm;
    data['tanggal'] = this.tanggal;
    data['income'] = this.income;
    data['outcome'] = this.outcome;
    data['profit_loss'] = this.profitLoss;
    data['status'] = this.status;
    data['status_verifikasi'] = this.statusVerifikasi;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
