import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/ui/resource/dimens/dimens.dart';
import 'package:base_flutter/ui/resource/styles/app_colors.dart';
import 'package:base_flutter/ui/resource/styles/app_text_styles.dart';
import 'package:base_flutter/ui/screen/verify_otp/cubit/verify_otp_cubit.dart';
import 'package:base_flutter/ui/share/button/base_button.dart';
import 'package:base_flutter/ui/share/scaffold/base_page_state.dart';
import 'package:base_flutter/ui/share/scaffold/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

@RoutePage()
class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage(
      {super.key, required this.isLogin, required this.phoneNumber});
  final bool isLogin;
  final String phoneNumber;
  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends BasePageState<VerifyOtpPage, VerifyOtpCubit> {
  bool isEnabbleButton = false;
  String messageError = "";
  final box1Controller = TextEditingController(text: "");
  late Timer _timer;
  int _start = 20;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            _timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget buildPage(BuildContext context) {
    return BaseScreen(
      title: widget.isLogin ? "Đăng nhập" : "Đăng ký",
      leading: InkWell(
          onTap: () {
            context.router.pop();
          },
          child: Icon(
            Ionicons.chevron_back_outline,
            size: 26.sp,
            color: AppColors.current.primaryTextColor,
          )),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimens.d12.w),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: Dimens.d32.h),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                            top: Dimens.d32.h, bottom: Dimens.d10.h),
                        child: Text("Xác thực mã OTP",
                            style: AppTextStyles.sectionTitle()
                                .copyWith(fontWeight: FontWeight.w500))),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(bottom: Dimens.d32.h),
                        child: Text("Mã đã được gửi về ${widget.phoneNumber}",
                            style: AppTextStyles.s14w400Primary())),
                    PinCodeTextField(
                      length: 6,
                      autoFocus: true,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      appContext: context,
                      animationType: AnimationType.fade,
                      textStyle: TextStyle(
                          color: AppColors.current.primaryColor,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w500),
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 58.w,
                          fieldWidth: 45.w,
                          activeFillColor: Colors.white,
                          selectedColor: AppColors.current.primaryColor,
                          inactiveColor: Colors.grey,
                          activeColor: AppColors.current.primaryColor),
                      animationDuration: const Duration(milliseconds: 300),
                      controller: box1Controller,
                      onCompleted: (v) async {
                        if (v != "111111") {
                          setState(() {
                            messageError = "Mã xác thực không đúng";
                          });
                        } else {
                          _timer.cancel();
                        }
                      },
                      onChanged: (value) {
                        if (value.length < 6) {
                          setState(() {
                            messageError = "";
                            isEnabbleButton = false;
                          });
                        } else {
                          setState(() {
                            isEnabbleButton = true;
                          });
                        }
                      },
                      beforeTextPaste: (text) {
                        print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                    Visibility(
                      visible: messageError != "",
                      child: Container(
                        margin: EdgeInsets.only(left: 0.w),
                        child: Text(messageError,
                            style: AppTextStyles.s12w400PrimaryColor()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: Dimens.d16.h),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: Dimens.d10.h),
                          child: BaseButton(
                            label: "Tiếp tục",
                            textColor: Colors.white,
                            backgroundColor: isEnabbleButton == false
                                ? const Color(0xffFDB3B5)
                                : AppColors.current.primaryColor,
                            onPress: () {
                              if (isEnabbleButton == false) {
                              } else {
                                if (box1Controller.value.text != "111111") {
                                  setState(() {
                                    messageError = "Mã xác thực không đúng";
                                  });
                                } else {
                                  _timer.cancel();
                                }
                              }
                            },
                          ),
                        ),
                        _start != 0
                            ? Container(
                                margin: EdgeInsets.only(
                                    left: 0.w, top: Dimens.d12.h),
                                child: Text(
                                    "Chưa nhận được mã? Gửi lại trong vòng ${_start}s",
                                    style: AppTextStyles
                                        .s12w400PrimaryTextColor()),
                              )
                            : GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _start = 20;
                                    Future.delayed(
                                        const Duration(milliseconds: 1000), () {
                                      startTimer();
                                    });
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 0.w, top: Dimens.d12.h),
                                  alignment: Alignment.center,
                                  child: Text("Gửi lại",
                                      style:
                                          AppTextStyles.s12w400PrimaryColor()),
                                ),
                              )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
