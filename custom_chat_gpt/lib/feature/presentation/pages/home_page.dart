import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/chat_widget.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/drawer_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < 768
            ? Scaffold(
                backgroundColor: AppColors.mainBackground,
                appBar: AppBar(
                  title: Text(BlocProvider.of<ChatBloc>(context).repository.currentChat),
                ),
                drawer: const SizedBox(
                  width: 350,
                  child: Drawer(
                    child: SafeArea(child: DrawerContent()),
                  ),
                ),
                body: Container(
                  color: AppColors.mainBackground,
                  child: const ChatWidget(),
                ),
                // bottomSheet: BottomPanel(),
              )
            : const Scaffold(
                body: Row(
                  children: [
                    SizedBox(
                      width: 350,
                      child: DrawerContent(),
                    ),
                    Expanded(
                      flex: 3,
                      child: ChatWidget(),
                    ),
                  ],
                ),
                // bottomSheet: BottomPanel(),
              );
      },
    );
  }
}
