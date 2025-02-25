import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool popState;
  final String titleText;
  final bool titleState;
  final VoidCallback? actionButtonOnTap;
  final String? actionButton;

  const CustomAppbar(
      {Key? key,
      required this.popState,
      required this.titleText,
      required this.titleState,
      required this.actionButtonOnTap,
      required this.actionButton})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(64.0.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(64.0.h),
      child: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 32.w,
              child: popState
                  ? InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/button_go_back.svg',
                        fit: BoxFit.contain,
                      ),
                    )
                  : null,
            ),
            titleState
                ? Text(
                    titleText,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0.sp,
                    ),
                  )
                : Text(
                    '',
                  ),
            SizedBox(
              width: 32.w,
              child: actionButton == null
                  ? null
                  : InkWell(
                      onTap: actionButtonOnTap,
                      child: SvgPicture.asset(
                        'assets/icons/${actionButton}.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
            ),
          ],
        ),
        titleSpacing: 16.0.w,
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xffb2b2b2),
            width: 1,
          ),
        ),
      ),
    );
  }
}
