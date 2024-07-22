class FilterViaModel {
  String? status;
  List<FilterCategoryData>? data;
  String? message;

  FilterViaModel({this.status, this.data, this.message});

  FilterViaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <FilterCategoryData>[];
      json['data'].forEach((v) {
        data!.add(new FilterCategoryData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}
class FilterCategoryData {
  int? id;
  String? value;
  String? slug;

  FilterCategoryData({this.id, this.value, this.slug});

  FilterCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['slug'] = this.slug;
    return data;
  }
}