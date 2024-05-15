import 'package:base_flutter/ui/cubit/base_cubit.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:base_flutter/ui/screen/survey/cubit/survey_state.dart';

@Injectable()
class SurveyCubit extends BaseCubit<SurveyState> {
  SurveyCubit() : super(const SurveyState());
  Future<void> initData() async {
    try {} on DioException catch (_) {}
  }
}
