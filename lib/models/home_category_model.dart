
class CategorytModel {
  String? status;
  CategoryData? data;
  String? message;
  CategorytModel({this.status, this.data, this.message});

  CategorytModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new CategoryData.fromJson(json['data']) : null;
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
class  CategoryData {
  List<CategoryDataResult>? categoryDataResult;

  CategoryData({this.categoryDataResult});

  CategoryData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      categoryDataResult = <CategoryDataResult>[];
      json['data'].forEach((v) {
        categoryDataResult!.add(new CategoryDataResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoryDataResult != null) {
      data['data'] = this.categoryDataResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryDataResult {
  int? id;
  String? title;
  String? image;
  String? url;
  String? order;
  int? status;
  String? createdAt;
  String? updatedAt;



  CategoryDataResult(
      {this.id,
        this.title,
        this.image,
        this.url,
        this.order,
        this.status,
        this.createdAt,
        this.updatedAt});

  CategoryDataResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    url = json['url'];
    order = json['order'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['url'] = this.url;
    data['order'] = this.order;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}