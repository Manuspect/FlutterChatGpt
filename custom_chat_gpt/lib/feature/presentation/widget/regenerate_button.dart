import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/app_colors.dart';

class RegenerateButton extends StatelessWidget {
  const RegenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.cellBackground,
        border: Border.all(
          color: AppColors.regenerateButtonBorderColor,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          print('Gesture detector');
          // Удалить последний элемент из истории
          // Последний элемент (от user) поместить в сообщение
          // Удалить последний элемент из истории
          // Отправить
          BlocProvider.of<ChatBloc>(context).add(RegenerateButtonPressed());

        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.refresh,
              color: AppColors.iconBlueColor,
            ),
            Text(
              'Regenerate',
              style: TextStyle(
                color: AppColors.iconBlueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}