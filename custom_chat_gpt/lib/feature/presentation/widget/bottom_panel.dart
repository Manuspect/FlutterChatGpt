import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../common/app_colors.dart';
import 'question_text_field.dart';
import 'regenerate_button.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      width: 768,
      height: 150,
      child: BottomSheet(
        enableDrag: false,
        backgroundColor: const Color(0xDD0C0C0C),
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // BlocBuilder<ChatBloc, ChatState>(
              //   builder: (context, state) {
              //     return state is ResponseGot
              //         ? RegenerateButton()
              //         : Container();
              //   },
              // ),
              RegenerateButton(),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 30, top: 8, left: 8, right: 8),
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
