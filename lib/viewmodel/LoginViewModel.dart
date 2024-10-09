import 'package:flutter/cupertino.dart';
import 'package:justwravel/models/home_category_model.dart';
import '../data/response/ApiResponse.dart';
import '../repository/HomeRepository.dart';
import 'package:justwravel/models/home_category_grid_model.dart';
import 'package:justwravel/models/login_model.dart';
import 'package:justwravel/repository/AuthRepository.dart';

class LoginViewModel with ChangeNotifier {
  final _loignRepo = LoginRepository();

  ApiResponse<LoginModel> loginDetail = ApiResponse.loading();

  setLogin(ApiResponse<LoginModel> response) {
    loginDetail = response;
    notifyListeners();
  }
  Future<void> PostApi(LoginUser loginData) async {
    await _loignRepo.postLogin(loginData).then((value) {
      setLogin(ApiResponse.completed(value));
    }).onError((error, stackTrace) =>
        setLogin(ApiResponse.error(error.toString())));
  }
}