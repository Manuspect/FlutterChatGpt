import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:custom_chat_gpt/feature/presentation/bloc/bloc/send_question_bloc.dart';
import 'package:custom_chat_gpt/feature/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SendQuestionBloc>(
          create: (context) => SendQuestionBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.mainBackground,
          // colorScheme: ColorScheme.dark(
          //   background: AppColors.mainBackground,
          //   surface: AppColors.mainBackground,
          //   onPrimary: AppColors.mainBackground,
          //   primary: AppColors.mainBackground,
          //   onBackground: AppColors.mainBackground,
          //   tertiary: AppColors.mainBackground
          // )
        ),
      ),
    );
  }
}
