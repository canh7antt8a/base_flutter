import 'dart:async';

import 'package:base_flutter/data/api/exceptions/app_exception_wrapper.dart';
import 'package:base_flutter/ui/cubit/base_cubit.dart';
import 'package:base_flutter/ui/cubit/common/common_state.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CommonCubit extends BaseCubit<CommonState> {
  CommonCubit() : super(const CommonState());
  FutureOr<void> onExceptionEmitted({
    required AppExceptionWrapper appExceptionWrapper,
  }) {
    emit(state.copyWith(appExceptionWrapper: appExceptionWrapper));
  }
}
