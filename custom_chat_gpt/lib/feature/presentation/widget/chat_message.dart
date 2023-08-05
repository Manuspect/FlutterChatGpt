import 'dart:developer';

import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:custom_chat_gpt/core/constants/images.dart';
import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:custom_chat_gpt/feature/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/message_to_send_model.dart';

class ChatMessageCard extends StatefulWidget {
  final ChatMessage chatMessage;
  const ChatMessageCard({
    super.key,
    required this.chatMessage,
  });

  @override
  State<ChatMessageCard> createState() => _ChatMessageCardState();
  
}

class _ChatMessageCardState extends State<ChatMessageCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.chatMessage.isSelected) {
            widget.chatMessage.isSelected = false;
          } else {
            for (var element in chats) {
              element.isSelected = false;
            }
            widget.chatMessage.isSelected = true;
          }
          log(widget.chatMessage.isSelected.toString());
        });
        BlocProvider.of<ChatBloc>(context).add(UpdateChatEvent());
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: widget.chatMessage.role == Role.assistant ? AppColors.cellBackground : AppColors.mainBackground,
            border: widget.chatMessage.isSelected ? Border.all(color: AppColors.iconBlueColor) : Border.all()),
        width: 768.w,
        child: Column(
          children: [
            ListTile(
              leading: widget.chatMessage.role == Role.assistant
                  ? Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Image.asset(
                            Images.ai,
                            height: 25.h,
                            width: 25.w,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          const Text('7/10'),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          SvgPicture.asset(
                            Images.me,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          const Text('7/10'),
                        ],
                      ),
                    ),
              title: Text(
                widget.chatMessage.content,
                style: TextStyle(
                  fontSize: 16.sp,
                  // height: 24,
                ),
              ),
            ),
            widget.chatMessage.role == Role.assistant
                ? SizedBox(
                    height: 50.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(width: 70.w),
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
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            child: Container(
                              height: 16.h,
                              width: 134.w,
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
                      ],
                    ))
                : Container(),
          ],
        ),
      ),
    );
  }
}
