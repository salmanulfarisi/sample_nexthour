import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample_test/api_service/dioservices.dart';
import 'package:sample_test/model/login_model/login_model.dart';
import 'package:sample_test/model/login_model/login_respose_model.dart';
import 'package:sample_test/utilities/functions.dart';
import 'package:sample_test/utilities/string.dart';

class LoginApiService {
  Future<LoginResponseModel?> loginUser(LoginModel model) async {
    if (await Functions.checkIn()) {
      try {
        final b = model.toJson();
        log(b.toString());
        final response = await DioServies.postFunction(
            url: Config.login, value: model.toJson());

        if (response.statusCode == 200) {
          log('login successfull');
          final data = response.data;
          return LoginResponseModel.fromJson(data);
        } else {
          return loginResponseModelFromJson(response.data);
        }
      } on DioError catch (e) {
        if (e.response?.statusCode == 401) {
          log(e.response!.data['message'].toString());
          log(e.response!.statusCode.toString());
          Fluttertoast.showToast(msg: e.response!.data['message']);
          return loginResponseModelFromJson(e.response!.data);
        } else if (e.response?.statusCode == 403) {
          // log(e.response!.statusCode.toString());
          Fluttertoast.showToast(msg: e.response!.data['message']);
          return loginResponseModelFromJson(e.response!.data);
        } else {
          Fluttertoast.showToast(msg: e.response!.data['message']);
          return loginResponseModelFromJson(e.response!.data);
        }
        // final errorrMessage = DioExceptions.fromDioError(e);
        // log(errorrMessage.toString());
      } on TimeoutException catch (e) {
        Fluttertoast.showToast(msg: e.toString());
        return loginResponseModelFromJson(e.toString());
      } on SocketException catch (e) {
        Fluttertoast.showToast(msg: e.toString());
        return loginResponseModelFromJson(e.toString());
      }
    } else {
      log('Internet error');
      return loginResponseModelFromJson('''{"hai":"sss"}''');
    } // return null;
  }
}















// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:sample_test/api_service/dioservices.dart';
// import 'package:sample_test/model/login_model/login_model.dart';
// import 'package:sample_test/model/login_model/login_respose_model.dart';
// import 'package:sample_test/utilities/string.dart';

// class LoginApiService {
//   Future<LoginResponseModel?> loginUser(LoginModel data) async {
//     if (await connectionCheck()) {
//       try {
//         final response = await DioServies.postFunction(
//             url: Config.login, value: data.toJson());

//         if (response.statusCode! >= 200 && response.statusCode! <= 299) {
//           log('Login Sucessfully done ...................');
//           return LoginResponseModel.fromJson(response.data);
//         } else {
//           return LoginResponseModel.fromJson(response.data);
//         }
//       } on DioError catch (e) {
//         if (e.response!.statusCode == 401) {
//           return LoginResponseModel(success: true);
//         }
//       } catch (e) {
//         return LoginResponseModel();
//       }
//     } else {
//       return LoginResponseModel(success: true);
//     }

//     return null;
//   }
// }

// Future<bool> connectionCheck() async {
//   bool result = await InternetConnectionChecker().hasConnection;
//   return result;
// }

// import 'dart:async';
// import 'dart:developer';
// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:sample_test/api_service/dioservices.dart';
// import 'package:sample_test/model/login_model/login_model.dart';
// import 'package:sample_test/model/login_model/login_respose_model.dart';
// import 'package:sample_test/utilities/string.dart';

// class LoginApiService {
//   Future<LoginResponseModel?> loginUser(LoginModel model) async {
//     if (await checkIn()) {
//       try {
//         final b = model.toJson();
//         log(b.toString());
//         final response = await DioServies.postFunction(
//             url: Config.login, value: model.toJson());
//         if (response.statusCode! >= 200 && response.statusCode! <= 299) {
//           log('login successfull');
//           Fluttertoast.showToast(msg: 'successfully Login');

//           return loginResponseModelFromJson(response.data);
//         } else {
//           return loginResponseModelFromJson(response.data);
//         }
//       } on DioError catch (e) {
//         if (e.response!.statusCode == 401) {
//           // log(e.response!.data.toString());
//           log(e.response!.statusCode.toString());
//           Fluttertoast.showToast(msg: "Bad credential");
//         } else if (e.response!.statusCode == 403) {
//           log(e.response!.statusCode.toString());
//           Fluttertoast.showToast(msg: "Youor Account has been locked");
//         } else {
//           Fluttertoast.showToast(msg: 'something wrong!');
//         }
//         // final errorrMessage = DioExceptions.fromDioError(e);
//         // log(errorrMessage.toString());
//       } on TimeoutException catch (e) {
//         Fluttertoast.showToast(msg: e.toString());
//       } on SocketException catch (e) {
//         Fluttertoast.showToast(msg: e.toString());
//       }
//     } else {
//       log('Internet error');
//     }
//     return null;
//   }
// }

// checkIn() async {
//   bool result = await InternetConnectionChecker().hasConnection;
//   if (result == true) {
//     print('Got Internet');
//   } else {
//     Fluttertoast.showToast(msg: 'no internet pls check It');
//   }
//   return result;
// }
