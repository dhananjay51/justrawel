import 'package:flutter/material.dart';

class  PackageDetail{
  String? status;
  PackageDetailData? data;
  String? message;

  PackageDetail({this.status, this.data, this.message});

  PackageDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new PackageDetailData.fromJson(json['data']) : null;
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

class PackageDetailData {
  List<PackageDetailDataResult>? data;

  PackageDetailData({this.data});

  PackageDetailData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PackageDetailDataResult>[];
      json['data'].forEach((v) {
        data!.add(new PackageDetailDataResult.fromJson(v));
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

class PackageDetailDataResult {
  int? id;
  List<DayWise>? dayWise;
  List<BannerImage>? bannerImage;
  List<GalleryImage>? galleryImage;
  String? title;
  Category? category;
  String? description;
  String? metaTitle;
  String? metaKeywords;
  String? metaDescription;
  String? slug;
  List<ThingsToPack>? thingsToPack;
  String? baseCamp;
  String? bestTimeToVisit;
  String? location;
  String? state;
  int? stateId;
  String? stateSlug;
  String? country;
  int? countryId;
  String? countrySlug;
  List<Itineraries>? itineraries;
  int? duration;
  String? startingFrom;
  String? endingTo;
  List<Batches>? batches;
  bool? isTrending;
  bool? isBestseller;
  String? trekDifficulty;
  int? trekLength;
  int? altitude;
  DefaultPrice? defaultPrice;
  List<String>? carousel;
  List<Faqs>? faqs;

  String? paymentPolicy;
  String? cancellationPolicy;
  List<Blogs>? blogs;
  List<String>? youtubeVideos;
  List<String>? instaIds;
  int? reviewCount;
  int? rating;
  String? pdfFile;
  List<Prices>? prices;

  String? contact;
  SimilarPackages? similarPackages;
  List<Testimonials>? testimonials;

  PackageDetailDataResult(
      {this.id,
        this.dayWise,
        this.bannerImage,
        this.galleryImage,
        this.title,
        this.category,
        this.description,
        this.metaTitle,
        this.metaKeywords,
        this.metaDescription,
        this.slug,
        this.thingsToPack,

        this.baseCamp,
        this.bestTimeToVisit,
        this.location,
        this.state,
        this.stateId,
        this.stateSlug,
        this.country,
        this.countryId,
        this.countrySlug,
        this.itineraries,
        this.duration,
        this.startingFrom,
        this.endingTo,
        this.batches,
        this.isTrending,
        this.isBestseller,
        this.trekDifficulty,
        this.trekLength,
        this.altitude,
        this.defaultPrice,
        this.carousel,
        this.faqs,

        this.paymentPolicy,
        this.cancellationPolicy,
        this.blogs,
        this.youtubeVideos,
        this.instaIds,
        this.reviewCount,
        this.rating,
        this.pdfFile,
        this.prices,

        this.contact,
        this.similarPackages,
        this.testimonials});

  PackageDetailDataResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['day_wise'] != null) {
      dayWise = <DayWise>[];
      json['day_wise'].forEach((v) {
        dayWise!.add(new DayWise.fromJson(v));
      });
    }
    if (json['banner_image'] != null) {
      bannerImage = <BannerImage>[];
      json['banner_image'].forEach((v) {
        bannerImage!.add(new BannerImage.fromJson(v));
      });
    }
    if (json['gallery_image'] != null) {
      galleryImage = <GalleryImage>[];
      json['gallery_image'].forEach((v) {
        galleryImage!.add(new GalleryImage.fromJson(v));
      });
    }
    title = json['title'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    description = json['description'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    slug = json['slug'];
    if (json['things_to_pack'] != null) {
      thingsToPack = <ThingsToPack>[];
      json['things_to_pack'].forEach((v) {
        thingsToPack!.add(new ThingsToPack.fromJson(v));
      });
    }

    baseCamp = json['base_camp'];
    bestTimeToVisit = json['best_time_to_visit'];
    location = json['location'];
    state = json['state'];
    stateId = json['state_id'];
    stateSlug = json['state_slug'];
    country = json['country'];
    countryId = json['country_id'];
    countrySlug = json['country_slug'];
    if (json['itineraries'] != null) {
      itineraries = <Itineraries>[];
      json['itineraries'].forEach((v) {
        itineraries!.add(new Itineraries.fromJson(v));
      });
    }
    duration = json['duration'];
    startingFrom = json['starting_from'];
    endingTo = json['ending_to'];
    if (json['batches'] != null) {
      batches = <Batches>[];
      json['batches'].forEach((v) {
        batches!.add(new Batches.fromJson(v));
      });
    }
    isTrending = json['is_trending'];
    isBestseller = json['is_bestseller'];
    trekDifficulty = json['trek_difficulty'];
    trekLength = json['trek_length'];
    altitude = json['altitude'];
    defaultPrice = json['default_price'] != null
        ? new DefaultPrice.fromJson(json['default_price'])
        : null;

    carousel = json['carousel'].cast<String>();

    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(new Faqs.fromJson(v));
      });
    }

    paymentPolicy = json['payment_policy'];
    cancellationPolicy = json['cancellation_policy'];
    if (json['blogs'] != null) {
      blogs = <Blogs>[];
      json['blogs'].forEach((v) {
        blogs!.add(new Blogs.fromJson(v));
      });
    }

    if(json['insta_ids'] != null){
      instaIds = json['insta_ids'].cast<String>();

    }

    if(json['youtube_videos'] != null){
      youtubeVideos = json['youtube_videos'].cast<String>();

    }

    reviewCount = json['review_count'];
    rating = json['rating'];
    pdfFile = json['pdf_file'];
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(new Prices.fromJson(v));
      });
    }

    contact = json['contact'];
    similarPackages = json['similar_packages'] != null
        ? new SimilarPackages.fromJson(json['similar_packages'])
        : null;
    if (json['testimonials'] != null) {
      testimonials = <Testimonials>[];
      json['testimonials'].forEach((v) {
        testimonials!.add(new Testimonials.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.dayWise != null) {
      data['day_wise'] = this.dayWise!.map((v) => v.toJson()).toList();
    }
    if (this.bannerImage != null) {
      data['banner_image'] = this.bannerImage!.map((v) => v.toJson()).toList();
    }
    if (this.galleryImage != null) {
      data['gallery_image'] =
          this.galleryImage!.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['description'] = this.description;
    data['meta_title'] = this.metaTitle;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['slug'] = this.slug;
    if (this.thingsToPack != null) {
      data['things_to_pack'] =
          this.thingsToPack!.map((v) => v.toJson()).toList();
    }

    data['base_camp'] = this.baseCamp;
    data['best_time_to_visit'] = this.bestTimeToVisit;
    data['location'] = this.location;
    data['state'] = this.state;
    data['state_id'] = this.stateId;
    data['state_slug'] = this.stateSlug;
    data['country'] = this.country;
    data['country_id'] = this.countryId;
    data['country_slug'] = this.countrySlug;
    if (this.itineraries != null) {
      data['itineraries'] = this.itineraries!.map((v) => v.toJson()).toList();
    }
    data['duration'] = this.duration;
    data['starting_from'] = this.startingFrom;
    data['ending_to'] = this.endingTo;
    if (this.batches != null) {
      data['batches'] = this.batches!.map((v) => v.toJson()).toList();
    }
    data['is_trending'] = this.isTrending;
    data['is_bestseller'] = this.isBestseller;
    data['trek_difficulty'] = this.trekDifficulty;
    data['trek_length'] = this.trekLength;
    data['altitude'] = this.altitude;
    if (this.defaultPrice != null) {
      data['default_price'] = this.defaultPrice!.toJson();
    }
    if (this.carousel != null) {
      data['carousel'] = this.carousel ;//.map((v) => v.toJson()).toList();
    }
    if (this.faqs != null) {
      data['faqs'] = this.faqs!.map((v) => v.toJson()).toList();
    }

    data['payment_policy'] = this.paymentPolicy;
    data['cancellation_policy'] = this.cancellationPolicy;
    if (this.blogs != null) {
      data['blogs'] = this.blogs!.map((v) => v.toJson()).toList();
    }
    if (this.youtubeVideos != null) {
      data['youtube_videos'] =
          this.youtubeVideos ; //!.map((v) => v.toJson()).toList();
    }
    if (this.instaIds != null) {
      data['insta_ids'] = this.instaIds; //!.map((v) => v.toJson()).toList();
    }
    data['review_count'] = this.reviewCount;
    data['rating'] = this.rating;
    data['pdf_file'] = this.pdfFile;
    if (this.prices != null) {
      data['prices'] = this.prices!.map((v) => v.toJson()).toList();
    }

    data['contact'] = this.contact;
    if (this.similarPackages != null) {
      data['similar_packages'] = this.similarPackages!.toJson();
    }
    if (this.testimonials != null) {
      data['testimonials'] = this.testimonials!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DayWise {
  int? id;
  int? packageItineraryId;
  int? dayNumber;
  String? heading;
  String? description;
  int? breakfast;
  int? lunch;
  int? dinner;
  String? stayType;
  String? stayName;
  String? createdAt;
  String? updatedAt;
  List<ItineraryDayWiseImages>? itineraryDayWiseImages;

  DayWise(
      {this.id,
        this.packageItineraryId,
        this.dayNumber,
        this.heading,
        this.description,
        this.breakfast,
        this.lunch,
        this.dinner,
        this.stayType,
        this.stayName,
        this.createdAt,
        this.updatedAt,
        this.itineraryDayWiseImages});

  DayWise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageItineraryId = json['package_itinerary_id'];
    dayNumber = json['day_number'];
    heading = json['heading'];
    description = json['description'];
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    stayType = json['stay_type'];
    stayName = json['stay_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['itinerary_day_wise_images'] != null) {
      itineraryDayWiseImages = <ItineraryDayWiseImages>[];
      json['itinerary_day_wise_images'].forEach((v) {
        itineraryDayWiseImages!.add(new ItineraryDayWiseImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_itinerary_id'] = this.packageItineraryId;
    data['day_number'] = this.dayNumber;
    data['heading'] = this.heading;
    data['description'] = this.description;
    data['breakfast'] = this.breakfast;
    data['lunch'] = this.lunch;
    data['dinner'] = this.dinner;
    data['stay_type'] = this.stayType;
    data['stay_name'] = this.stayName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.itineraryDayWiseImages != null) {
      data['itinerary_day_wise_images'] =
          this.itineraryDayWiseImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItineraryDayWiseImages {
  int? id;
  int? itineraryDayWiseId;
  String? filename;
  String? caption;
  Null? altText;
  String? description;
  String? createdAt;
  String? updatedAt;

  ItineraryDayWiseImages(
      {this.id,
        this.itineraryDayWiseId,
        this.filename,
        this.caption,
        this.altText,
        this.description,
        this.createdAt,
        this.updatedAt});

  ItineraryDayWiseImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itineraryDayWiseId = json['itinerary_day_wise_id'];
    filename = json['filename'];
    caption = json['caption'];
    altText = json['alt_text'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['itinerary_day_wise_id'] = this.itineraryDayWiseId;
    data['filename'] = this.filename;
    data['caption'] = this.caption;
    data['alt_text'] = this.altText;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class BannerImage {
  int? id;
  int? packageId;
  String? image;
  String? caption;
  int? isMainBanner;
  String? mainBannerType;
  int? order;
  String? createdAt;
  String? updatedAt;

  BannerImage(
      {this.id,
        this.packageId,
        this.image,
        this.caption,
        this.isMainBanner,
        this.mainBannerType,
        this.order,
        this.createdAt,
        this.updatedAt});

  BannerImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageId = json['package_id'];
    image = json['image'];
    caption = json['caption'];
    isMainBanner = json['is_main_banner'];
    mainBannerType = json['main_banner_type'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_id'] = this.packageId;
    data['image'] = this.image;
    data['caption'] = this.caption;
    data['is_main_banner'] = this.isMainBanner;
    data['main_banner_type'] = this.mainBannerType;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class GalleryImage {
  int? id;
  int? packageId;
  String? image;
  String? caption;
  int? isMainBanner;
  String? mainBannerType;
  int? order;
  String? createdAt;
  String? updatedAt;

  GalleryImage(
      {this.id,
        this.packageId,
        this.image,
        this.caption,
        this.isMainBanner,
        this.mainBannerType,
        this.order,
        this.createdAt,
        this.updatedAt});

  GalleryImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageId = json['package_id'];
    image = json['image'];
    caption = json['caption'];
    isMainBanner = json['is_main_banner'];
    mainBannerType = json['main_banner_type'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_id'] = this.packageId;
    data['image'] = this.image;
    data['caption'] = this.caption;
    data['is_main_banner'] = this.isMainBanner;
    data['main_banner_type'] = this.mainBannerType;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;

  Category({this.id, this.name, this.slug});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class ThingsToPack {
  int? id;
  String? title;
  String? description;
  String? icon;

  ThingsToPack({this.id, this.title, this.description, this.icon});

  ThingsToPack.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}

class Itineraries {
  int? id;
  int? packageId;
  int? startingLocationId;
  int? endingLocationId;
  String? reportingPlace;
  String? reportingTime;
  int? duration;
  int? departureOption;
  String? departureTime;
  int? arrivalOption;
  String? arrivalTime;
  String? inclusions;
  String? exclusions;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<ItineraryDayWise>? itineraryDayWise;

  StartingLocation? startingLocation;
  StartingLocation? endingLocation;

  Itineraries(
      {this.id,
        this.packageId,
        this.startingLocationId,
        this.endingLocationId,
        this.reportingPlace,
        this.reportingTime,
        this.duration,
        this.departureOption,
        this.departureTime,
        this.arrivalOption,
        this.arrivalTime,
        this.inclusions,
        this.exclusions,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.itineraryDayWise,

        this.startingLocation,
        this.endingLocation});

  Itineraries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageId = json['package_id'];
    startingLocationId = json['starting_location_id'];
    endingLocationId = json['ending_location_id'];
    reportingPlace = json['reporting_place'];
    reportingTime = json['reporting_time'];
    duration = json['duration'];
    departureOption = json['departure_option'];
    departureTime = json['departure_time'];
    arrivalOption = json['arrival_option'];
    arrivalTime = json['arrival_time'];
    inclusions = json['inclusions'];
    exclusions = json['exclusions'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['itinerary_day_wise'] != null) {
      itineraryDayWise = <ItineraryDayWise>[];
      json['itinerary_day_wise'].forEach((v) {
        itineraryDayWise!.add(new ItineraryDayWise.fromJson(v));
      });
    }

    startingLocation = json['starting_location'] != null
        ? new StartingLocation.fromJson(json['starting_location'])
        : null;
    endingLocation = json['ending_location'] != null
        ? new StartingLocation.fromJson(json['ending_location'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_id'] = this.packageId;
    data['starting_location_id'] = this.startingLocationId;
    data['ending_location_id'] = this.endingLocationId;
    data['reporting_place'] = this.reportingPlace;
    data['reporting_time'] = this.reportingTime;
    data['duration'] = this.duration;
    data['departure_option'] = this.departureOption;
    data['departure_time'] = this.departureTime;
    data['arrival_option'] = this.arrivalOption;
    data['arrival_time'] = this.arrivalTime;
    data['inclusions'] = this.inclusions;
    data['exclusions'] = this.exclusions;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.itineraryDayWise != null) {
      data['itinerary_day_wise'] =
          this.itineraryDayWise!.map((v) => v.toJson()).toList();
    }
    if (this.startingLocation != null) {
      data['starting_location'] = this.startingLocation!.toJson();
    }
    if (this.endingLocation != null) {
      data['ending_location'] = this.endingLocation!.toJson();
    }
    return data;
  }
}

class ItineraryDayWise {
  int? id;
  int? packageItineraryId;
  int? dayNumber;
  String? heading;
  String? description;
  int? breakfast;
  int? lunch;
  int? dinner;
  String? stayType;
  String? stayName;
  String? createdAt;
  String? updatedAt;
  List<ItineraryDayWiseImages>? itineraryDayWiseImages;

  ItineraryDayWise(
      {this.id,
        this.packageItineraryId,
        this.dayNumber,
        this.heading,
        this.description,
        this.breakfast,
        this.lunch,
        this.dinner,
        this.stayType,
        this.stayName,
        this.createdAt,
        this.updatedAt,
        this.itineraryDayWiseImages});

  ItineraryDayWise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageItineraryId = json['package_itinerary_id'];
    dayNumber = json['day_number'];
    heading = json['heading'];
    description = json['description'];
    breakfast = json['breakfast'];
    lunch = json['lunch'];
    dinner = json['dinner'];
    stayType = json['stay_type'];
    stayName = json['stay_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['itinerary_day_wise_images'] != null) {
      itineraryDayWiseImages = <ItineraryDayWiseImages>[];
      json['itinerary_day_wise_images'].forEach((v) {
        itineraryDayWiseImages!.add(new ItineraryDayWiseImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_itinerary_id'] = this.packageItineraryId;
    data['day_number'] = this.dayNumber;
    data['heading'] = this.heading;
    data['description'] = this.description;
    data['breakfast'] = this.breakfast;
    data['lunch'] = this.lunch;
    data['dinner'] = this.dinner;
    data['stay_type'] = this.stayType;
    data['stay_name'] = this.stayName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.itineraryDayWiseImages != null) {
      data['itinerary_day_wise_images'] =
          this.itineraryDayWiseImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




class StartingLocation {
  int? id;
  int? countryId;
  int? stateId;
  String? name;
  Null? bannerImage;
  String? slug;
  String? description;
  Null? tagLine;
  String? metaTitle;
  String? metaKeywords;
  String? metaDescription;
  int? status;
  String? createdAt;
  String? updatedAt;

  StartingLocation(
      {this.id,
        this.countryId,
        this.stateId,
        this.name,
        this.bannerImage,
        this.slug,
        this.description,
        this.tagLine,
        this.metaTitle,
        this.metaKeywords,
        this.metaDescription,
        this.status,
        this.createdAt,
        this.updatedAt});

  StartingLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    name = json['name'];
    bannerImage = json['banner_image'];
    slug = json['slug'];
    description = json['description'];
    tagLine = json['tag_line'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['name'] = this.name;
    data['banner_image'] = this.bannerImage;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['tag_line'] = this.tagLine;
    data['meta_title'] = this.metaTitle;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Batches {
  int? id;
  int? packageId;
  int? packageItineraryId;
  String? startdate;
  String? lastdate;
  int? availability;
  int? totalSlots;
  int? bookedSlots;
  String? createdAt;
  String? updatedAt;

  Batches(
      {this.id,
        this.packageId,
        this.packageItineraryId,
        this.startdate,
        this.lastdate,
        this.availability,
        this.totalSlots,
        this.bookedSlots,
        this.createdAt,
        this.updatedAt});

  Batches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageId = json['package_id'];
    packageItineraryId = json['package_itinerary_id'];
    startdate = json['startdate'];
    lastdate = json['lastdate'];
    availability = json['availability'];
    totalSlots = json['total_slots'];
    bookedSlots = json['booked_slots'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_id'] = this.packageId;
    data['package_itinerary_id'] = this.packageItineraryId;
    data['startdate'] = this.startdate;
    data['lastdate'] = this.lastdate;
    data['availability'] = this.availability;
    data['total_slots'] = this.totalSlots;
    data['booked_slots'] = this.bookedSlots;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class DefaultPrice {
  int? price;
  int? discountedPrice;

  DefaultPrice({this.price, this.discountedPrice});

  DefaultPrice.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    discountedPrice = json['discounted_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    return data;
  }
}

class Faqs {
  int? id;
  int? packageId;
  String? question;
  String? answer;
  String? order;
  String? createdAt;
  String? updatedAt;

  Faqs(
      {this.id,
        this.packageId,
        this.question,
        this.answer,
        this.order,
        this.createdAt,
        this.updatedAt});

  Faqs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageId = json['package_id'];
    question = json['question'];
    answer = json['answer'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_id'] = this.packageId;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

class Prices {
  int? travelModeId;
  String? travelModeName;
  int? occupancyId;
  String? occupancyName;
  int? riderId;
  String? riderName;
  int? price;
  int? discountedPrice;
  int? qty =0;
  int? id;

  Prices(
      {this.travelModeId,
        this.travelModeName,
        this.occupancyId,
        this.occupancyName,
        this.riderId,
        this.riderName,
        this.price,
        this.discountedPrice,
        this.qty,
        this.id});

  Prices.fromJson(Map<String, dynamic> json) {
    travelModeId = json['travel_mode_id'];
    travelModeName = json['travel_mode_name'];
    occupancyId = json['occupancy_id'];
    occupancyName = json['occupancy_name'];
    if(json['rider_id'] !=Null){
      riderId = json['rider_id'];

    }
    riderName = json['rider_name'];
    price = json['price'];
    discountedPrice = json['discounted_price'];
    qty = json['qty'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['travel_mode_id'] = this.travelModeId;
    data['travel_mode_name'] = this.travelModeName;
    data['occupancy_id'] = this.occupancyId;
    data['occupancy_name'] = this.occupancyName;
    data['rider_id'] = this.riderId;
    data['rider_name'] = this.riderName;
    data['price'] = this.price;
    data['discounted_price'] = this.discountedPrice;
    data['qty'] = this.qty;
    data['id'] = this.id;
    return data;
  }
}

class SimilarPackages {
  Original? original;
  Null? exception;

  SimilarPackages({this.original, this.exception});

  SimilarPackages.fromJson(Map<String, dynamic> json) {
    original = json['original'] != null
        ? new Original.fromJson(json['original'])
        : null;
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.original != null) {
      data['original'] = this.original!.toJson();
    }
    data['exception'] = this.exception;
    return data;
  }
}

class Original {
  String? status;
  List<Data>? data;
  String? message;

  Original({this.status, this.data, this.message});

  Original.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? id;
  String? title;

  String? slug;
  String? countrySlug;
  String? stateSlug;
  int? duration;
  Category? category;
  DefaultPrice? defaultPrice;

  Data(
      {this.id,
        this.title,

        this.slug,
        this.countrySlug,
        this.stateSlug,
        this.duration,
        this.category,
        this.defaultPrice});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];

    slug = json['slug'];
    countrySlug = json['country_slug'];
    stateSlug = json['state_slug'];
    duration = json['duration'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    defaultPrice = json['default_price'] != null
        ? new DefaultPrice.fromJson(json['default_price'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;

    data['slug'] = this.slug;
    data['country_slug'] = this.countrySlug;
    data['state_slug'] = this.stateSlug;
    data['duration'] = this.duration;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.defaultPrice != null) {
      data['default_price'] = this.defaultPrice!.toJson();
    }
    return data;
  }
}

class Testimonials {
  int? id;
  String? googleReviewId;
  String? googleReviewLink;
  String? authorName;
  String? authorImageUrl;
  String? reviewText;
  String? reviewImageUrl;
  String? reviewImageUrls;
  String? reviewPhotoIds;
  String? reviewRating;
  int? packageId;
  int? categoryId;
  int? isCommon;
  int? status;
  String? createdAt;
  String? updatedAt;

  Testimonials(
      {this.id,
        this.googleReviewId,
        this.googleReviewLink,
        this.authorName,
        this.authorImageUrl,
        this.reviewText,
        this.reviewImageUrl,
        this.reviewImageUrls,
        this.reviewPhotoIds,
        this.reviewRating,
        this.packageId,
        this.categoryId,
        this.isCommon,
        this.status,
        this.createdAt,
        this.updatedAt});

  Testimonials.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    googleReviewId = json['google_review_id'];
    googleReviewLink = json['google_review_link'];
    authorName = json['author_name'];
    authorImageUrl = json['author_image_url'];
    reviewText = json['review_text'];
    reviewImageUrl = json['review_image_url'];
    reviewImageUrls = json['review_image_urls'];
    reviewPhotoIds = json['review_photo_ids'];
    reviewRating = json['review_rating'];
    packageId = json['package_id'];
    categoryId = json['category_id'];
    isCommon = json['is_common'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['google_review_id'] = this.googleReviewId;
    data['google_review_link'] = this.googleReviewLink;
    data['author_name'] = this.authorName;
    data['author_image_url'] = this.authorImageUrl;
    data['review_text'] = this.reviewText;
    data['review_image_url'] = this.reviewImageUrl;
    data['review_image_urls'] = this.reviewImageUrls;
    data['review_photo_ids'] = this.reviewPhotoIds;
    data['review_rating'] = this.reviewRating;
    data['package_id'] = this.packageId;
    data['category_id'] = this.categoryId;
    data['is_common'] = this.isCommon;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
