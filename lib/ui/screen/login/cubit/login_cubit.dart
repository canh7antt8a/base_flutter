import 'dart:developer';

import 'package:base_flutter/data/api/app_api_service.dart';
import 'package:base_flutter/data/api/exceptions/app_exception.dart';
import 'package:base_flutter/data/api/exceptions/app_exception_wrapper.dart';
import 'package:base_flutter/ui/cubit/base_cubit.dart';
import 'package:base_flutter/ui/screen/login/cubit/login_state.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit({required this.apiServices}) : super(const LoginState());
  AppApiService apiServices;
  Future<void> initData() async {
    try {} on DioException catch (_) {}
  }

  Future<void> handleLogin() async {
    await runBlocCatching(
        action: () async {
          emit(state.copyWith(isLoading: true));
          final data = await apiServices.login(
              email: "eve.holt@reqres.in", password: "cityslicka");
          print(data?.token);
          emit(state.copyWith(isLoading: false));
        },
        handleLoading: false,
        doOnSubscribe: () async {},
        doOnError: (AppException e) async {
          print("do onError: $e");
        });
  }
}
