import 'package:base_flutter/foundation/mixin/log_mixin.dart';
import 'package:base_flutter/ui/app_cubit.dart';
import 'package:base_flutter/ui/cubit/base_cubit.dart';
import 'package:base_flutter/ui/di/di.dart' as di;
import 'package:base_flutter/ui/navigation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_flutter/ui/resource/dimens/app_dimen.dart';
import 'package:base_flutter/ui/resource/styles/app_colors.dart';
import 'package:provider/provider.dart';

abstract class BasePageState<T extends StatefulWidget, B extends BaseCubit>
    extends BasePageStageDelegate<T, B> with LogMixin {}

abstract class BasePageStageDelegate<T extends StatefulWidget,
    B extends BaseCubit> extends State<T> {
  final AppNavigator navigator = di.getIt.get<AppNavigator>();
  final AppCubit appCubit = di.getIt.get<AppCubit>();

  late final B cubit = di.getIt.get<B>()
    ..navigator = navigator
    ..appCubit = appCubit;

  @override
  Widget build(BuildContext context) {
    AppDimen.of(context);
    AppColors.of(context);
    return Provider(
        create: (context) => navigator,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => cubit),
          ],
          child: buildPageListeners(child: buildPage(context)),
        ));
  }

  Widget buildPageListeners({required Widget child}) => child;

  Widget buildPage(BuildContext context);
}
