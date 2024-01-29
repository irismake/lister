import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lister/page/list_detail_page.dart';
import 'package:lister/page/search/search_page.dart';
import 'package:lister/model/custom_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64.0.h),
        child: AppBar(
          elevation: 0,
          leadingWidth: 100,
          leading: Padding(
            padding: EdgeInsets.only(top: 16.0.h, left: 16.0.w),
            child: SvgPicture.asset(
              'assets/images/image_logo_Name.svg',
              height: 24.0.h,
              width: 86.4.w,
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
                      ),
                    ),
                  ),
                  CustomSearchBar(
                    onSearch: (String value) {},
                  ),
                ],
              ),
            ),
            Container(
              //color: Colors.green,
              height: 352.0.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 42.0.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '지금 핫한 리스트',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0.sp,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                print('더보기');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListDetailPage()),
                                );
                                // CustomNavigator(
                                //   page: page,
                                //   navigatorKey: _navigatorKeyList[index],
                                // );
                              },
                              child: Text(
                                '더보기',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0.sp,
                                  color: Color(0xff868E96),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.black,
                          height: 2.0.h,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.pink,
                    height: 282.0.h,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
