import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:custom_chat_gpt/core/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

void taskMoreDialogFromChat(
  BuildContext context,
  Offset offset,
  Function(int index) onTap,
) =>
    showDialog(
      useSafeArea: false,
      barrierColor: Colors.black.withOpacity(0.6),
      context: context,
      builder: (context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: AlertDialog(
            insetPadding: EdgeInsets.only(top: offset.dy + 50.h, right: offset.dx - 290.w, left: 60.w),
            alignment: Alignment.topCenter,
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: GestureDetector(
              onTap: onTap(0),
              child: Stack(
                children: [
                  Container(
                    width: 500.w,
                    height: 140.h,
                    decoration: BoxDecoration(
                      color: AppColors.cellBackground,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ],
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w,),
                      child: Padding(
                        padding:  EdgeInsets.only(top: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () async {},
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: SvgPicture.asset(
                                      Images.search,
                                    ),
                                  ),
                                  SizedBox(width: 14.w),
                                  Container(
                                    decoration:  BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0.w,
                                        ),
                                      ),
                                    ),
                                    child:  SizedBox(
                                      width: 205.w,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 10.h),
                                        child: const Text(
                                          'Поиск',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {},
                              child: Row(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(bottom: 10.h),
                                    child: SvgPicture.asset(
                                      Images.clear,
                                    ),
                                  ),
                                   SizedBox(width: 10.w),
                                  Container(
                                    decoration:  BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0.w,
                                        ),
                                      ),
                                    ),
                                    child:  SizedBox(
                                      width: 200.w,
                                      child: Padding(
                                        padding: EdgeInsets.only(bottom: 10.h),
                                        child: const Text(
                                          'Очистить историю',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(left: 3.w),
                              child: GestureDetector(
                                onTap: () async {},
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(bottom: 10.h),
                                      child: SvgPicture.asset(
                                        Images.delete,
                                      ),
                                    ),
                                     SizedBox(width: 14.w),
                                     Padding(
                                      padding: EdgeInsets.only(bottom: 10.h),
                                      child: const Text(
                                        'Удалить чат',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
