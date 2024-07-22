class CustomPackageModel {
  String? status;
  List<CustomoPackageData>? data;
  String? message;
  CustomPackageModel({this.status, this.data, this.message});
  CustomPackageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <CustomoPackageData>[];
      json['data'].forEach((v) {
        data!.add(new CustomoPackageData.fromJson(v));
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
class CustomoPackageData {
  int? id;
  int? countryId;
  String? name;
  String? bannerImage;
  String? slug;
  String? description;
  String? alphaCode;
  String? gstCode;
  String? tagLine;
  int? priceStartingFrom;
  String? metaTitle;
  String? metaKeywords;
  String ? metaDescription;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? packagesCount;

  CustomoPackageData(
      {this.id,
        this.countryId,
        this.name,
        this.bannerImage,
        this.slug,
        /*
        this.description,
        this.alphaCode,
        this.gstCode,
        this.tagLine,
        this.priceStartingFrom,
        this.metaTitle,
        this.metaKeywords,
        this.metaDescription,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.packagesCount

         */
      }
      );

  CustomoPackageData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    name = json['name'];
    bannerImage = json['banner_image'];
    slug = json['slug'];
    description = json['description'];
    /*
    alphaCode = json['alpha_code'];
    gstCode = json['gst_code'];
    tagLine = json['tag_line'];
    priceStartingFrom = json['price_starting_from'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    packagesCount = json['packages_count'];

     */
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['banner_image'] = this.bannerImage;
    data['slug'] = this.slug;
    data['description'] = this.description;
    /*
    data['alpha_code'] = this.alphaCode;
    data['gst_code'] = this.gstCode;
    data['tag_line'] = this.tagLine;
    data['price_starting_from'] = this.priceStartingFrom;
    data['meta_title'] = this.metaTitle;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['packages_count'] = this.packagesCount;

     */
    return data;
  }
}
