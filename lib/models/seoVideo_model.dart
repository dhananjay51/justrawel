class SeoModel {
  String? status;
  SeoVideoData? data;
  String? message;

  SeoModel({this.status, this.data, this.message});

  SeoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new SeoVideoData.fromJson(json['data']) : null;
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

class SeoVideoData {
  String? title;
  String? slug;
  String? shortDescription;
  String? description;
  String? metaImage;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
   /*
  List<String>? bannerImageSquare;
  List<String>? bannerImageLandscape;

    */
  List<Blogs>? blogs;
  List<String>? youtubeVideos;
  List<String>? instaCarousel;
  String? moreDescription;
  List<String>? faqs;

  SeoVideoData(
      {this.title,
        this.slug,
        this.shortDescription,
        this.description,
        this.metaImage,
        this.metaTitle,
        this.metaDescription,
        this.metaKeywords,
       // this.bannerImageSquare,
       // this.bannerImageLandscape,
        this.blogs,
        this.youtubeVideos,
        this.instaCarousel,
        this.moreDescription,
       // this.faqs
      });

  SeoVideoData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
    shortDescription = json['short_description'];
    description = json['description'];
    metaImage = json['meta_image'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    /*
    if (json['banner_image_square'] != null) {
      bannerImageSquare = <Null>[];
      json['banner_image_square'].forEach((v) {
        bannerImageSquare!.add(new Null.fromJson(v));
      });
    }
    if (json['banner_image_landscape'] != null) {
      bannerImageLandscape = <Null>[];
      json['banner_image_landscape'].forEach((v) {
        bannerImageLandscape!.add(new Null.fromJson(v));
      });
    }

     */
    if (json['blogs'] != null) {
      blogs = <Blogs>[];
      json['blogs'].forEach((v) {
        blogs!.add(new Blogs.fromJson(v));
      });
    }
    youtubeVideos = json['youtube_videos'].cast<String>();
    instaCarousel = json['insta_carousel'].cast<String>();
    moreDescription = json['more_description'];
   /// faqs =  json['faqs'].cast<String>();
    /*
    if (json['faqs'] != null) {
      faqs = <Null>[];
      json['faqs'].forEach((v) {
        faqs!.add(new Null.fromJson(v));
      });
    }

     */
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['meta_image'] = this.metaImage;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_keywords'] = this.metaKeywords;
    /*
    if (this.bannerImageSquare != null) {
      data['banner_image_square'] =
          this.bannerImageSquare!.map((v) => v.toJson()).toList();
    }
    if (this.bannerImageLandscape != null) {
      data['banner_image_landscape'] =
          this.bannerImageLandscape!.map((v) => v.toJson()).toList();
    }

     */
    if (this.blogs != null) {
      data['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    }
    data['youtube_videos'] = this.youtubeVideos;
    data['insta_carousel'] = this.instaCarousel;
    data['more_description'] = this.moreDescription;
      /*
    if (this.faqs != null) {
      data['faqs'] = this.faqs!.map((v) => v.toJson()).toList();
    }
    */
    return data;


  }
}

class Blogs {
  String? title;
  String? description;
  String? image;
  String? author;
  String? estReadingTime;
  String? datePublished;
  String? dateModified;
  String? slug;

  Blogs(
      {this.title,
        this.description,
        this.image,
        this.author,
        this.estReadingTime,
        this.datePublished,
        this.dateModified,
        this.slug});

  Blogs.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
    author = json['author'];
    estReadingTime = json['Est. reading time'];
    datePublished = json['datePublished'];
    dateModified = json['dateModified'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['author'] = this.author;
    data['Est. reading time'] = this.estReadingTime;
    data['datePublished'] = this.datePublished;
    data['dateModified'] = this.dateModified;
    data['slug'] = this.slug;
    return data;
  }
}
