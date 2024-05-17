import 'package:base_flutter/ui/cubit/base_cubit.dart';
import 'package:base_flutter/ui/screen/verify_otp/cubit/verify_otp_state.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class VerifyOtpCubit extends BaseCubit<VerifyOtpState> {
  VerifyOtpCubit() : super(const VerifyOtpState());
  Future<void> initData() async {
    try {} on DioException catch (_) {}
  }
}
