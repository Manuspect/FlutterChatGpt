import 'dart:developer';

import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:custom_chat_gpt/core/constants/images.dart';
import 'package:custom_chat_gpt/feature/data/models/message_to_send_model.dart';
import 'package:custom_chat_gpt/feature/presentation/bloc/bloc_sliding_panel/editing_bot_bloc.dart' as edit;
import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/chat_widget.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/dialogs.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/drawer_content.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/sliding_panel.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/widget_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

late List<ChatMessage> chats;
GlobalKey iconBtn = GlobalKey();
late List<ChatMessage> chatsIsSelected;

class _HomePageState extends State<HomePage> {
  PanelController panelController = PanelController();
  @override
  void dispose() {
    if (panelController.isPanelOpen) panelController.close();
    super.dispose();
  }

  @override
  void initState() {
    chats = BlocProvider.of<ChatBloc>(context).repository.history;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < 768
            ? Stack(
                children: [
                  BlocBuilder<ChatBloc, ChatState>(buildWhen: (previous, current) {
                    // if (current is ResponseGot) return true;
                    return true;
                  }, builder: (context, state) {
                    if (chats.isNotEmpty) {
                      chatsIsSelected = chats.where((element) => element.isSelected).toList();
                      log(chatsIsSelected.length.toString());
                    }
                    return Scaffold(
                      backgroundColor: AppColors.mainBackground,
                      appBar: AppBar(
                        title: Text('${BlocProvider.of<ChatBloc>(context).repository.currentChat}  💻'),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: IconButton(
                              icon: SvgPicture.asset(
                                Images.threeDots,
                                key: iconBtn,
                              ),
                              onPressed: () => taskMoreDialogFromChat(context, getWidgetPosition(iconBtn), (index) {}),
                            ),
                          ),
                        ],
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
                    );
                  }),
                  BlocBuilder<edit.EditingBotBloc, edit.EditingBotState>(
                    builder: (context, snapshot) {
                      if (snapshot is edit.OpenSlidingPanelState) {
                        panelController.animatePanelToPosition(1.0);
                      } else if (snapshot is edit.CloseSlidingPanelState) {
                        panelController.animatePanelToPosition(0.0);
                      }
                      return SlidingPanel(panelController);
                    },
                  ),
                ],
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
