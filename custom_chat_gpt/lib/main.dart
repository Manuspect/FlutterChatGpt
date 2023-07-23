import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:custom_chat_gpt/feature/presentation/bloc/bloc_sliding_panel/editing_bot_bloc.dart';
import 'package:custom_chat_gpt/feature/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'feature/presentation/bloc/test_bloc/chat_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EditingBotBloc>(
          create: (context) => EditingBotBloc(),
        ),
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
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
        );
      }),
    );
  }
}
