import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/app_colors.dart';

class QuestionTextField extends StatelessWidget {
  QuestionTextField({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      // expands: true,
      autofocus: true,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {

            if (_controller.text.isNotEmpty) {
              BlocProvider.of<ChatBloc>(context).add(
                SendChatMessage(message: _controller.text),
              );
          
              _controller.clear();
            }
          },
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 60),
        suffixIconColor: AppColors.iconBlueColor,
        focusColor: AppColors.inputFieldBackground,
        label: const Text('Send a message'),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.iconBlueColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.iconBlueColor,
          ),
        ),
      ),
    );
  }
}
