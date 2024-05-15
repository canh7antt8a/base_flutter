import 'package:base_flutter/ui/cubit/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_state.freezed.dart';

@freezed
class SurveyState extends BaseState with _$SurveyState {
  const factory SurveyState({@Default(false) bool isLoading}) = _SurveyState;
}
