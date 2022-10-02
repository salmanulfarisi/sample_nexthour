import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_test/api_service/dioservices.dart';
import 'package:sample_test/model/signup_model/signup_model.dart';
import 'package:sample_test/model/signup_model/signup_response_model.dart';
import 'package:sample_test/utilities/functions.dart';
import 'package:sample_test/utilities/string.dart';

class SignupService {
  Future<SignupResponseModel?> signupUser(SignupModel model) async {
    if (await Functions.checkIn()) {
      try {
        final models = model.toJson();
        print(models);
        final response = await DioServies.postFunction(
            url: Config.register, value: model.toJson());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log(response.data['message']);
          return SignupResponseModel.fromJson(model.toJson());
        } else {
          return SignupResponseModel.fromJson(model.toJson());
        }
      } on TimeoutException catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      } on SocketException catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      } on DioError catch (e) {
        if (e.response!.statusCode == 401) {
          log(e.response!.data['message']);
          log(e.response!.statusCode.toString());
          Fluttertoast.showToast(msg: e.message);
        } else if (e.response!.statusCode == 403) {
          Fluttertoast.showToast(msg: e.message);
        } else if (e.response!.statusCode == 400) {
          Fluttertoast.showToast(msg: e.message);
        } else {
          Fluttertoast.showToast(msg: 'something wrong');
        }
      }
    } else {
      log('internet error');
      return SignupResponseModel.fromJson(model.toJson());
    }
    return null;
  }
}
