import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lister/join/sign_up_congratulation_page.dart';
import 'package:lister/model/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

class SetPasswordPage extends StatefulWidget {
  final String userEmail;
  final String userId;
  final String userName;

  const SetPasswordPage(
      {Key? key,
      required this.userEmail,
      required this.userName,
      required this.userId})
      : super(key: key);

  @override
  State<SetPasswordPage> createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
  final noFocusColor = Color(0xffCED4DA);
  final darkGrayColor = Color(0xff495057);
  final mildGrayColor = Color(0xffADB5BD);
  final checkBoxColor = Color(0xff212529);
  final checkTextColor = Color(0xff868E96);
  final xIconColor = Color(0xff343A40);

  bool _passwordState = false;
  bool _passwordCheckState = false;
  bool _passwordCheckValid = false;
  bool _isChecked_A = false;
  bool _isChecked_B = false;
  bool _isChecked_C = false;

  FocusNode _passwordFocus = FocusNode();
  FocusNode _passwordCheckFocus = FocusNode();

  final _passwordFormkey = GlobalKey<FormState>();
  final _passwordCheckFormkey = GlobalKey<FormState>();

  String password = '';
  String passwordCheck = '';

  @override
  void initState() {
    super.initState();

    _passwordFocus.addListener(() {
      setState(() {
        final formKeyState = _passwordFormkey.currentState!;
        if (formKeyState.validate()) {
          formKeyState.save();
        }
        // if (_passwordState && _passwordCheckState) {
        //   _nextButtonState = true;
        // } else {
        //   _nextButtonState = false;
        // }
      });
    });

    _passwordCheckFocus.addListener(() {
      setState(() {
        final formKeyState = _passwordCheckFormkey.currentState!;
        if (formKeyState.validate()) {
          formKeyState.save();
        }
        // if (_passwordState && _passwordCheckState) {
        //   _nextButtonState = true;
        // } else {
        //   _nextButtonState = false;
        // }
      });
    });
  }

  String? _checkPasswordCheckValid(String? value) {
    if (_passwordCheckFocus.hasFocus) {
      _passwordCheckValid = false;
      return null;
    }
    if (password != passwordCheck && _passwordCheckValid) {
      return '비밀번호가 일치하지 않습니다';
    }
    return null;
  }

  Future<void> signUp(
      String name, String email, String password, String userName) async {
    try {
      final Uri uri = Uri.parse('http://192.168.0.212:5999/user/signup');

      final Map<String, dynamic> requestBody = {
        "name": name,
        "email": email,
        "password": password,
        "username": userName,
      };

      final http.Response response = await http.post(
        uri,
        body: json.encode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);
      } else {
        print('회원가입 실패 - 상태 코드: ${response.statusCode}');
      }
    } catch (e) {
      print('회원가입 오류: $e');
    }
  }

  void _agreementPopUp() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  color: Colors.white,
                ),
                height: 280.h,
                width: double.infinity,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 160.h,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 32.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '시작하기 전, 이용약관에 동의해주세요.',
                                    style: TextStyle(
                                        fontFamily: 'PretendardRegular',
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  Container(
                                    height: 32.h,
                                    width: 32.w,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.clear,
                                      ),
                                      iconSize: 17.07.sp,
                                      color: xIconColor,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            Container(
                              height: 24.h,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale: 2.5,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Checkbox(
                                        value: _isChecked_A,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _isChecked_A = value!;
                                          });
                                        },
                                        activeColor: checkBoxColor,
                                        checkColor: Colors.white,
                                        hoverColor: Colors.black,
                                        // overlayColor: MaterialStatePropertyAll(
                                        //     Colors.green.withOpacity(0.2)),
                                        // fillColor: MaterialStatePropertyAll(
                                        //   Colors.white.withOpacity(1),
                                        // ),
                                        side: BorderSide(
                                            width: 1.sp, color: noFocusColor),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0.w,
                                  ),
                                  Text(
                                    "리스터의 모든 약관을 확인했고 동의해요.",
                                    style: TextStyle(
                                        fontFamily: 'PretendardRegular',
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        color: darkGrayColor),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                                height: 56.h,
                                //color: Colors.deepOrange,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 24.h,
                                      //color: Colors.deepOrange,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Transform.scale(
                                            scale: 2.5,
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Checkbox(
                                                value: _isChecked_B,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked_B = value!;
                                                  });
                                                },
                                                activeColor: checkBoxColor,
                                                checkColor: Colors.white,
                                                hoverColor: Colors.black,
                                                // overlayColor: MaterialStatePropertyAll(
                                                //     Colors.green.withOpacity(0.2)),
                                                // fillColor: MaterialStatePropertyAll(
                                                //   Colors.white.withOpacity(1),
                                                // ),
                                                side: BorderSide(
                                                    width: 1.sp,
                                                    color: noFocusColor),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.0.w,
                                          ),
                                          Text(
                                            "(필수) 이용약관에 동의해요.",
                                            style: TextStyle(
                                                fontFamily: 'PretendardRegular',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: checkTextColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 24.h,
                                      //color: Colors.deepOrange,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Transform.scale(
                                            scale: 2.5,
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: Checkbox(
                                                value: _isChecked_C,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked_C = value!;
                                                  });
                                                },
                                                activeColor: checkBoxColor,
                                                checkColor: Colors.white,
                                                hoverColor: Colors.black,
                                                // overlayColor: MaterialStatePropertyAll(
                                                //     Colors.green.withOpacity(0.2)),
                                                // fillColor: MaterialStatePropertyAll(
                                                //   Colors.white.withOpacity(1),
                                                // ),
                                                side: BorderSide(
                                                    width: 1.sp,
                                                    color: noFocusColor),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.0.w,
                                          ),
                                          Text(
                                            "(필수) 개인정보 수집 및 이용에 동의해요.",
                                            style: TextStyle(
                                                fontFamily: 'PretendardRegular',
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: checkTextColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            if (_isChecked_A && _isChecked_B && _isChecked_C) {
                              signUp(widget.userId, widget.userEmail, password,
                                  widget.userName);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpCongratulationPage()),);
                            }
                          });
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 151.w, vertical: 20.h),
                            backgroundColor: Colors.black),
                        child: Text(
                          "회원가입",
                          style: TextStyle(
                              fontFamily: 'PretendardRegular',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 88.h),
                child: Column(
                  children: [
                    Container(
                      height: 80.h,
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                        child: Text(
                          '마지막으로\n비밀번호를 설정해 주세요.',
                          style: TextStyle(
                            fontFamily: 'PretendardRegular',
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '비밀번호',
                              style: TextStyle(
                                fontFamily: 'PretendardRegular',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: darkGrayColor,
                              ),
                            ),
                            Text(
                              '영어, 숫자 포함 n자 이내',
                              style: TextStyle(
                                fontFamily: 'PretendardRegular',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: mildGrayColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Form(
                          key: _passwordFormkey,
                          child: CustomTextFormField(
                            hintText: '비밀번호를 설정해 주세요.',
                            focusNode: _passwordFocus,
                            isObscureText: true,
                            onChanged: (value) {
                              setState(() {
                                password = value!;
                                value == ''
                                    ? _passwordState = false
                                    : _passwordState = true;
                              });
                            },
                            validator: (value) {},
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '비밀번호 확인',
                            style: TextStyle(
                              fontFamily: 'PretendardRegular',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: darkGrayColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Form(
                          key: _passwordCheckFormkey,
                          child: CustomTextFormField(
                            hintText: '비밀번호를 다시 입력해 주세요.',
                            focusNode: _passwordCheckFocus,
                            isObscureText: true,
                            onChanged: (value) {
                              setState(() {
                                passwordCheck = value!;
                                value == ''
                                    ? _passwordCheckState = false
                                    : _passwordCheckState = true;
                              });
                            },
                            validator: (value) {
                              List<String? Function(String)> validators = [
                                _checkPasswordCheckValid,
                              ];
                              for (var validator in validators) {
                                var result = validator(value!);
                                if (result != null) {
                                  return result;
                                }
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (_passwordState && _passwordCheckState) {
                          _passwordCheckValid = true;
                          final formKeyState =
                              _passwordCheckFormkey.currentState!;
                          if (formKeyState.validate()) {
                            formKeyState.save();
                            _agreementPopUp();
                            // signUp(widget.userId, widget.userEmail, password,
                            //     widget.userName);
                          }
                        }
                      });
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      padding: EdgeInsets.symmetric(
                          horizontal: 151.w, vertical: 20.h),
                      backgroundColor: _passwordState && _passwordCheckState
                          ? Colors.black
                          : noFocusColor,
                    ),
                    child: Text(
                      "회원가입",
                      style: TextStyle(
                        fontFamily: 'PretendardRegular',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: _passwordState && _passwordCheckState
                            ? Theme.of(context).primaryColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
