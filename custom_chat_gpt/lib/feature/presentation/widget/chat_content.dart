import 'package:custom_chat_gpt/feature/data/datasources/response_remote_datasource.dart';
import 'package:custom_chat_gpt/feature/data/models/message_to_send_model.dart';
import 'package:custom_chat_gpt/feature/data/repositories/repository_impl.dart';
import 'package:custom_chat_gpt/feature/domain/repositories/repository.dart';
import 'package:custom_chat_gpt/feature/presentation/bloc/test_bloc/chat_bloc.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/ai_response_card.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/user_question_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatContent extends StatefulWidget {
  const ChatContent({super.key});

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  RepositoryImpl repository = RepositoryImpl();
  List<String> messages = [];
  List<String> answers = [];

  late Stream stream;
  // late Stream<List<ChatMessage>> chats;
  late List<ChatMessage> chats;
  @override
  void initState() {
    stream = BlocProvider.of<ChatBloc>(context)
        .repository
        .remoteDatasource
        .channel
        .stream;

    // chats = BlocProvider.of<ChatBloc>(context).repository.getChats();
    chats = BlocProvider.of<ChatBloc>(context).repository.getHistory;

    super.initState();
  }

  // bool isAIResponse = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      buildWhen: (previous, current) {
        // if (current is MessageSended) {
        //   messages.add(current.message);
        // }
        return true;
      },
      // bloc: SendQuestionBloc(),
      builder: (context, state) {
        // print(messages.length);
        return Container(
          // height: 720,
          child: chats.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    chatMessages(),
                    StreamBuilder(
                      stream: stream,
                      // stream: repository.remoteDatasource.channel.stream,
                      builder: (context, snapshot) {
                        print(snapshot.connectionState.toString());
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return const CircularProgressIndicator();
                          case ConnectionState.active:
                            {
                              print(state);
                              if (snapshot.hasData) {
                                if (!(state is ResponseGot)) {
                                  BlocProvider.of<ChatBloc>(context)
                                      .add(GotResponse(message: snapshot.data));
                                }
                              }

                              // // BlocProvider.of<ChatBloc>(context)
                              // //     .add(GetResponse(message: snapshot.data));
                              // return AIResponseCard(message: snapshot.data);
                            }
                          case ConnectionState.done:
                            {
                              print('snapshot: ${snapshot.data}');
                              if (snapshot.hasData) {
                                BlocProvider.of<ChatBloc>(context)
                                    .add(GotResponse(message: snapshot.data));
                              }
                            }
                          default:
                            return const Text('...');
                        }
                        return Container();
                      },
                    ),

                    // ListView.builder(
                    //   itemCount: messages.length,
                    //   shrinkWrap: true,
                    //   itemBuilder: (context, index) {
                    //     print(index);
                    //     print(answers);
                    //     return Column(
                    //       children: [
                    //         UserQuestionCard(
                    //           message: messages[index],
                    //         ),
                    //         if (answers.isNotEmpty)
                    //           AIResponseCard(
                    //             message: answers[index != 0 ? index - 1 : 0],
                    //           ),
                    //       ],
                    //     );
                    //   },
                    // ),
                    // StreamBuilder(
                    //   stream: stream,
                    //   builder:(context, snapshot) {

                    //     BlocProvider.of<ChatBloc>(context).add(
                    //       SendMessage(message: 'message'),
                    //     );

                    //     if (snapshot.data is String) {
                    //       messages.add(snapshot.data);

                    //       return AIResponseCard(
                    //         message: snapshot.data,
                    //       );
                    //     } else {
                    //       return const Text('...');
                    //     }
                    //     // if (snapshot.hasData) {
                    //     // return Container();
                    //   }

                    // ),

                    const SizedBox(
                      height: 150,
                    )
                  ],
                )
              : const Center(
                  child: Text('Задайте вопрос'),
                ),
        );
        // );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  chatMessages() {
    print('chats in chatMessages');
    print(chats.length);
    // chats.forEach((element) {
    //   print(element.toJson());
    // });
    // print(chats.first.toJson());
    // print(chats.last.toJson());

    return chats.isNotEmpty
        ? ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: Container(
                height: MediaQuery.of(context).size.height-150,
                width: 768,
                child: ListView(
                  children: [
                    ...chats
                        .map(
                          (e) => e.role == 'User'
                              ? UserQuestionCard(
                                  message: e.content,
                                )
                              : AIResponseCard(
                                  message: e.content,
                                ),
                        )
                        .toList(),
                  ],
                )
                // ListView.builder(
                //   physics: const AlwaysScrollableScrollPhysics(),
                //   scrollDirection: Axis.vertical,
                //   shrinkWrap: true,
                //   itemCount: chats.length,
                //   itemBuilder: (context, index) {
                //     return chats[index].role == 'User'
                //         ? UserQuestionCard(
                //             message: chats[index].content,
                //           )
                //         : AIResponseCard(
                //             message: chats[index].content,
                //           );
                //   },
                // ),

                ),
          )
        : const CircularProgressIndicator();

    // StreamBuilder(
    //   stream: chats,
    //   builder: (context, snapshot) {
    //     print(snapshot.data);
    //     return snapshot.hasData
    //         ? ListView.builder(
    //             itemCount: snapshot.data?.length ?? 0,
    //             itemBuilder: (context, index) {
    //               return snapshot.data?[index].role == 'User'
    //                   ? UserQuestionCard(
    //                       message: snapshot.data![index].content,
    //                     )
    //                   : AIResponseCard(
    //                       message: snapshot.data![index].content,
    //                     );
    //             },
    //           )
    //         : CircularProgressIndicator();
    //   },
    // );
  }
}

List<String> testMessages = [
  'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
      'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
      'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
      'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
      'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
      'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
      'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
      'Non magna et enim voluptate sit ea occaecat consequat esse id. Duis nostrud voluptate in esse esse. In cillum reprehenderit tempor proident laboris culpa officia mollit ullamco aliquip laboris dolore. Velit anim do occaecat tempor amet culpa in.',
  'Eiusmod sint consectetur proident qui esse laboris. Sit aliquip enim qui ex nulla aliqua. Nostrud cillum mollit Lorem excepteur sunt officia mollit laboris magna. Aliqua eu consequat fugiat anim laborum. Proident ipsum in aute est.'
];
