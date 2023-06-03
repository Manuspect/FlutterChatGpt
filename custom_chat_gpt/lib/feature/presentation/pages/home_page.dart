import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/drawer_content.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < 768
            ? Scaffold(
                backgroundColor: AppColors.mainBackground,
                appBar: AppBar(),
                drawer: Container(
                  width: 300,
                  child: const Drawer(
                    child: DrawerContent(),
                  ),
                ),
                body: Container(
                  color: AppColors.mainBackground,
                  child: Stack(
                        children: [
                          Container(
                              // color: Colors.amber,
                              ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: BottomPanel(),
                          ),
                        ],
                      ),
                ),
                // bottomSheet: BottomPanel(),
              )
            : Scaffold(
                body: Row(
                  children: [
                    Container(
                      child: const DrawerContent(),
                      width: 300,
                    ),
                    Expanded(
                      flex: 3,
                      child: Stack(
                        children: [
                          Container(
                              // color: Colors.amber,
                              ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: BottomPanel(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // bottomSheet: BottomPanel(),
              );
      },
    );
  }

  Widget BottomPanel() {
    return Container(
      width: 768,
      height: 150,
      child: BottomSheet(
        enableDrag: false,
        backgroundColor: AppColors.mainBackground,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RegenerateButton(),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 30, top: 8, left: 8, right: 8),
                child: QuestionField(),
              ),
            ],
          );
        },
        onClosing: () {},
      ),
    );
  }

  Widget RegenerateButton() {
    return Container(
      width: 200,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.inputFieldBackground,
        border: Border.all(
          color: AppColors.regenerateButtonBorderColor,
        ),
      ),
      child: GestureDetector(
        onTap: () {},
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

  Widget QuestionField() {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {},
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 60),
        suffixIconColor: AppColors.iconBlueColor,
        focusColor: AppColors.inputFieldBackground,
        label: Text('Send a message'),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: AppColors.inputFieldBackground,
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
            )),
      ),
    );
  }
}
