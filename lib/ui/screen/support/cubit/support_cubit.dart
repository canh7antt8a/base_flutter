// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'package:base_flutter/ui/cubit/base_cubit.dart';
import 'package:base_flutter/ui/screen/support/cubit/support_state.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SupportCubit extends BaseCubit<SupportState> {
  SupportCubit() : super(const SupportState());

  Future<void> initData() async {
    try {} on DioException catch (_) {}
  }
}
