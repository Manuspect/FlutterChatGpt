// import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../common/app_colors.dart';
import 'question_text_field.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      width: 768,
      height: 115,
      child: BottomSheet(
        enableDrag: false,
        backgroundColor: Colors.black,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //TODO: сделать кнопку безопасной

              // BlocBuilder<ChatBloc, ChatState>(
              //   builder: (context, state) {
              //     print(state);
              //     return state is ResponseGot
              //         ? RegenerateButton()
              //         : Container();
              //   },
              // ),
              // const RegenerateButton(),
              SizedBox(
                  height: 50.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: 20.w),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          child: Container(
                            height: 10.h,
                            width: 155.w,
                            decoration: BoxDecoration(
                                color: AppColors.slidingPanelUp,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: AppColors.iconBlueColor)),
                            child: const Center(
                              child: Text(
                                'Some suggestion chip',
                                style: TextStyle(color: AppColors.iconBlueColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: SizedBox(
                          child: Container(
                            height: 16.h,
                            width: 134.w,
                            decoration: BoxDecoration(
                                color: AppColors.slidingPanelUp,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: AppColors.iconBlueColor)),
                            child: Center(
                              child: Text(
                                'Some suggestion chip',
                                style: TextStyle(color: AppColors.iconBlueColor, fontSize: 12.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: SizedBox(
                          child: Container(
                            height: 16.h,
                            width: 134.w,
                            decoration: BoxDecoration(
                                color: AppColors.slidingPanelUp,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: AppColors.iconBlueColor)),
                            child: Center(
                              child: Text(
                                'Some suggestion chip',
                                style: TextStyle(color: AppColors.iconBlueColor, fontSize: 12.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: SizedBox(
                          child: Container(
                            height: 16.h,
                            width: 134.w,
                            decoration: BoxDecoration(
                                color: AppColors.slidingPanelUp,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: AppColors.iconBlueColor)),
                            child: Center(
                              child: Text(
                                'Some suggestion chip',
                                style: TextStyle(color: AppColors.iconBlueColor, fontSize: 12.sp),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: QuestionTextField(),
              ),
            ],
          );
        },
        onClosing: () {},
      ),
    );
  }
}
