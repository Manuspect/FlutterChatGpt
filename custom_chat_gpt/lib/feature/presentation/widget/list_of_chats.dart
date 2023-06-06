// import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/app_colors.dart';

class ListOfChats extends StatefulWidget {
  final List<String> chatNames;
  const ListOfChats({super.key, required this.chatNames});

  @override
  State<ListOfChats> createState() => _ListOfChatsState();
}

class _ListOfChatsState extends State<ListOfChats> {
  // late List<String> chatNames;

  @override
  void initState() {
    // print('in init state');
    // chatNames =
    //     BlocProvider.of<ChatBloc>(context).repository.chats.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

        return Builder(builder: (context) {
        // print(widget.chatNames);
          return ListView(
            children: [
              ...widget.chatNames
                  .map(
                    (e) => ListTile(
                      onTap: () {

                        // TODO: добавить логику смены чата
                        // BlocProvider.of<ChatBloc>(context).add(ChatChanged(message: e));
                      },
                      leading: const Icon(Icons.message_rounded),
                      title: Text(e),
                      trailing: SizedBox(
                        width: 120,
                        child: Row(
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.file_upload_outlined,
                                color: AppColors.iconBlueColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.edit_outlined,
                                color: AppColors.iconBlueColor,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline,
                                color: AppColors.iconRedColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList()
            ],
          );
        });

  }
}
