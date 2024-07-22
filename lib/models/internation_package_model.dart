

class PackageModel {
  String? status;
  PackageData? data;
  String? message;

  PackageModel({this.status, this.data, this.message});

  PackageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new PackageData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class PackageData {
  List<PackageResult>? data;

  PackageData({this.data});

  PackageData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PackageResult>[];
      json['data'].forEach((v) {
        data!.add(new PackageResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PackageResult {
  int? id;
  String? name;
  String? slug;
  int? packageCount;
  int? startingFrom;
  String? image;

  PackageResult(
      {this.id,
        this.name,
        this.slug,
        this.packageCount,
        this.startingFrom,
        this.image});

  PackageResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    packageCount = json['package_count'];
    startingFrom = json['starting_from'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['package_count'] = this.packageCount;
    data['starting_from'] = this.startingFrom;
    data['image'] = this.image;
    return data;
  }
}
