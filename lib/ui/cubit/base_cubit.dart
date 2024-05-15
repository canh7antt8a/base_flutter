// class BaseCubit extends Cubit<AppState> {
//   BaseCubit() : super(const AppState());
//   Future<void> initData() async {
//     try {} on DioException catch (e) {}
//   }
// }

import 'package:base_flutter/foundation/mixin/log_mixin.dart';
import 'package:base_flutter/ui/app_cubit.dart';
import 'package:base_flutter/ui/cubit/base_state.dart';
import 'package:base_flutter/ui/navigation/app_navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S extends BaseState> extends BaseCubitDelegate<S>
    with LogMixin {
  BaseCubit(super.initialState);
}

abstract class BaseCubitDelegate<S extends BaseState> extends Cubit<S> {
  BaseCubitDelegate(super.initialState);
  late final AppCubit appCubit;
  late final AppNavigator navigator;
}
