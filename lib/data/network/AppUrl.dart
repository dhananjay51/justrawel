class AppUrl {

  //"https://api.justwravel.in"
  //https://api.justwravel.in
  static var appBaseUrl =  "https://api.justwravel.in";
  static var appImageUrl = "https://storage.googleapis.com/storage.justwravel.com/package/images/banner/category_mobile/cropped";
  static var categotyBaseUrl = 'https://storage.googleapis.com/storage.justwravel.com/homepage/home-categories/';
  static var category = '$appBaseUrl/api/homepage/categories';
  static var homepagecategories = '$appBaseUrl/api/homepage/categories/';
  static var upcomingTrips = '$appBaseUrl/api/homepage/upcoming-trips?is_international=';
  static var bestSellers = '$appBaseUrl/api/homepage/best-sellers';
  static var treks = '$appBaseUrl/api/homepage/treks';
  static var backpackingtrips = '$appBaseUrl/api/homepage/backpacking-trips';
  static var domestictrips = '$appBaseUrl/api/homepage/domestic-trips';
  static var  internationalTrips =  '$appBaseUrl/api/homepage/international-trips';
  static var   googleReviewUrl=  '$appBaseUrl/api/homepage/google-reviews';
  static var   videoUrl=  '$appBaseUrl/api/homepage/videos';
  static var   viewAllPackageUrl=  '$appBaseUrl/api/package-listing/fd/treks';
  static var   viewallPackageBestSeller=  '$appBaseUrl/api/package-listing/fd/bestseller';
  static var   viewallPackageUpComing =  '$appBaseUrl/api/package-listing/fd/upcoming-trips';
  static var   viewallPackagebackpacking =  '$appBaseUrl/api/package-listing/fd/backpacking-trips';
  static var   categoryVaiFilter =  '$appBaseUrl/api/filters/states?category=';
  static var   seoViedoUrl =  '$appBaseUrl/api/package-listing/seo/?slug=';
  static var   treksPackage =  'treks';
  static var   upcomingtrips =  'upcoming-trips';
  static var   bestseller =  'bestseller';
  static var   backpackingtripsCategory        =     '$appBaseUrl/api/package-listing/fd/backpacking-trips/state/slugonly';
  static var   customDomestiPackage            =     '$appBaseUrl/api/domestic-CustomizedPackages';
  static var   customInternationalPackage      =     '$appBaseUrl/api/international-CustomizedPackages';
  static var   customizedpackagesstatelist     =     '$appBaseUrl/api/CustomizedPackages-state/';
  static var   custominternationalPackagelist  =     '$appBaseUrl/api/CustomizedPackages-country/';
  static var   PackageDetails  =     '$appBaseUrl/api/package-detail/parashar-lake-trek';

  }

 enum Imagepath {
  categryPath,
  categorgridPath,
  bestSellerPath,
  bestTrekPath,
  bestPackingPath,
  domesticPath,
  internationalPath,
  PackageListinPath,
  VideoImgpath
  }
extension ImageExtension on Imagepath {
  String get description {
    switch (this) {
      case Imagepath.categryPath:
        return 'https://storage.googleapis.com/storage.justwravel.com/homepage/home-categories/';
      case Imagepath.categorgridPath:
        return 'https://storage.googleapis.com/storage.justwravel.tech/package/images/banner/category_mobile/cropped/';
        case Imagepath.bestSellerPath:
        return 'This is case three';
      case Imagepath.bestTrekPath:
        return 'https://storage.googleapis.com/storage.justwravel.tech/package/images/banner/square/cropped/';
      case Imagepath.bestPackingPath:
        return 'https://storage.googleapis.com/storage.justwravel.tech/package/images/banner/square/cropped/';
      case Imagepath.domesticPath:
        return 'https://storage.googleapis.com/storage.justwravel.tech/homepage/domestic/';
      case Imagepath.internationalPath:
        return 'https://storage.googleapis.com/storage.justwravel.tech/homepage/international/';
      case Imagepath.PackageListinPath:
        return 'https://storage.googleapis.com/storage.justwravel.tech/package/images/banner/detail_desktop/cropped/';
        case Imagepath.VideoImgpath:
        return 'https://storage.googleapis.com/storage.justwravel.com/package/images/banner/video_support/cropped/';
        //'https://storage.googleapis.com/storage.justwravel.tech/package/images/banner/listing_mobile/cropped/';
        default:
        return 'Unknown case';
    }
  }
}
