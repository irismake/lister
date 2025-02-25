import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/custom_ui_kit/custom_search_bar.dart';
import 'main_list/home_list_view.dart';

class HomePage extends StatelessWidget implements PreferredSizeWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(64.0.h);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64.0.h),
        child: AppBar(
          elevation: 0,
          leadingWidth: 100,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(
              top: statusBarHeight + 16.0.h,
              left: 16.0.w,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/image_logo_name.svg',
                  height: 24.0.h,
                  width: 86.4.w, // Ensure the SVG has a width constraint
                ),
              ],
            ),
          ),
          shape: Border(
            bottom: BorderSide(
              color: Color(0xffb2b2b2),
              width: 1,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 176.0.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '궁금한 리스트를\n검색해보세요.',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28.0.sp,
                        height: 1.4,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/search");
                    },
                    child: CustomSearchBar(
                      autoFocus: false,
                      enabled: false,
                      onSearch: (String value) {},
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '지금 핫한 리스트',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0.sp,
                    ),
                  ),
                ),

                // InkWell(
                //   onTap: () {
                //     print('더보기');
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => ListDetailPage()),
                //     );
                //     // CustomNavigator(
                //     //   page: page,
                //     //   navigatorKey: _navigatorKeyList[index],
                //     // );
                //   },
                //   child: Text(
                //     '더보기',
                //     style: TextStyle(
                //       fontWeight: FontWeight.w600,
                //       fontSize: 14.0.sp,
                //       color: Color(0xff868E96),
                //     ),
                //   ),
                //
                Padding(
                  padding: EdgeInsets.only(top: 12.0.h, bottom: 24.0),
                  child: Divider(
                    color: Colors.black,
                    thickness: 2.0.h,
                    height: 0,
                  ),
                ),

                SizedBox(
                  height: 282,
                  child: MainListView(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
