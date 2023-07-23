import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:custom_chat_gpt/core/constants/images.dart';
import 'package:custom_chat_gpt/feature/presentation/bloc/bloc_sliding_panel/editing_bot_bloc.dart' as edit;
import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionTextField extends StatelessWidget {
  QuestionTextField({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: const BoxDecoration(color: AppColors.cellBackground),
      child: Row(
        children: [
          IconButton(
            splashRadius: 1.r,
            icon: SvgPicture.asset(
              Images.editing,
            ),
            splashColor: Colors.transparent,
            onPressed: () {
              BlocProvider.of<edit.EditingBotBloc>(context).add(edit.OpenSlidingPanelEvent());
            },
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:  EdgeInsets.only(top: 1.h),
              child: TextField(
                controller: _controller,
                // expands: true,
                autofocus: false,

                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: AppColors.iconBlueColor,
                    ),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        BlocProvider.of<ChatBloc>(context).add(
                          SendChatMessage(message: _controller.text),
                        );
                        _controller.clear();
                      }
                    },
                  ),
                  hintText: 'Send a message',
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: IconButton(
              icon: SvgPicture.asset(
                Images.refresh,
              ),
              splashRadius: 1,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
