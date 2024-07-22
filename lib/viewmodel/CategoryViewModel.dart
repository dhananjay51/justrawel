import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:justwravel/models/home_category_model.dart';
import '../data/response/ApiResponse.dart';
import '../repository/HomeRepository.dart';
import 'package:justwravel/models/home_category_grid_model.dart';

class CategoryViewModel with ChangeNotifier {
  final _homeRepo = HomeRepository();

  ApiResponse<CategorytModel> categoryList = ApiResponse.loading();
  ApiResponse<CategoriesGrid> categoriesList = ApiResponse.loading();

  setCategoryList(ApiResponse<CategorytModel> response) {
    categoryList = response;
    notifyListeners();
  }
  setCategoriesList(ApiResponse<CategoriesGrid> response) {
    categoriesList = response;
    notifyListeners();
  }
  Future<void> fetchCategoryApi() async {
    await _homeRepo.getCategory().then((value) {
      setCategoryList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setCategoryList(ApiResponse.error(error.toString())));
  }
  Future<void> fetchCategoriesApi(String id) async {
    await _homeRepo.getCategories(id).then((value) {
      setCategoriesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setCategoriesList(ApiResponse.error(error.toString())));
  }

}


