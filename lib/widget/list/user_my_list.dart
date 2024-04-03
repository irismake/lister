import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/listModel.dart';
import '../../model/provider/lists_provider.dart';
import '../../page/edit/edit_page.dart';
import '../custom/custom_book_mark_button.dart';

class UserMyList extends StatelessWidget {
  const UserMyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GetListsProvider>(
      builder: (context, provider, child) {
        final List<ListData> usersLists = provider.userLists();
        return usersLists == null
            ? Container(
                color: Color(0xffF8F9FA),
                child: Center(
                  child: SizedBox(
                    height: 100.0.h,
                    // width: 165.0.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "아직 리스트가 비어있어요.",
                          style: TextStyle(
                            color: Color(0xFF495057),
                            fontSize: 15.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                            height: 1.5.h,
                          ),
                        ),
                        SizedBox(
                          height: 52.0.h,
                          width: 165.0.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Color(0xFFE9ECEF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              // textStyle: TextStyle(
                              //   color: Color(0xff212529),
                              //   fontSize: 15.sp,
                              //   fontFamily: 'Pretendard',
                              //   fontWeight: FontWeight.w700,
                              //   height: 1,
                              // ),
                              // minimumSize: Size(165.0.w, 52.0.h),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditPage()),
                              );
                            },
                            child: Text(
                              '리스트 만들기',
                              style: TextStyle(
                                color: Color(0xff212529),
                                fontSize: 15.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w700,
                                height: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: usersLists.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      // Map<String, dynamic> listData =
                      //     await ApiService.getListDetail(mainLists[index].id);
                      // final title = utf8.decode(listData['title'].toString().codeUnits);
                      // final description =
                      //     utf8.decode(listData['description'].toString().codeUnits);
                      // final userName =
                      //     utf8.decode(listData['user_name'].toString().codeUnits);
                      // final updateDate = DateFormat('yy.MM.dd')
                      //     .format(DateTime.parse(listData['updated_at']));
                      // List<String> keywords = [];
                      // keywords
                      //     .add(utf8.decode(listData['keyword_1'].toString().codeUnits));
                      // keywords
                      //     .add(utf8.decode(listData['keyword_2'].toString().codeUnits));
                      // print(keywords);

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ListDetailPage(
                      //             title: title,
                      //             description: description,
                      //             userName: userName,
                      //             updateDate: updateDate,
                      //             keywords: keywords,
                      //           )),
                      // );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 12.0.w),
                      child: SizedBox(
                        width: 160.0,
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200.0,
                                  width: double.infinity,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF1F3F5),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                                Text(
                                  '${utf8.decode(usersLists[index].title.runes.toList())}',
                                  style: TextStyle(
                                    color: Color(0xFF343A40),
                                    fontSize: 16.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                    height: 1.5.h,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                Text(
                                  '${DateFormat('yy.MM.dd').format(DateTime.parse(usersLists[index].updatedAt))}',
                                  style: TextStyle(
                                    color: Color(0xFF868E96),
                                    fontSize: 12.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 1.5.h,
                                  ),
                                )
                              ],
                            ),
                            CustomBookMarkButton(
                              index: index,
                              listId: usersLists[index].id,
                              isBookMarked: usersLists[index].isBookmarked,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
