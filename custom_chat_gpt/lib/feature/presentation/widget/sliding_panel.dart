import 'package:custom_chat_gpt/common/app_colors.dart';
import 'package:custom_chat_gpt/core/constants/images.dart';
import 'package:custom_chat_gpt/feature/data/models/type_panel.dart';
import 'package:custom_chat_gpt/feature/presentation/bloc/bloc_sliding_panel/editing_bot_bloc.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/custom_button.dart';
import 'package:custom_chat_gpt/feature/presentation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingPanel extends StatefulWidget {
  final PanelController panelController;

  const SlidingPanel(this.panelController, {super.key});

  @override
  State<SlidingPanel> createState() => _SlidingPanelState();
}

class _SlidingPanelState extends State<SlidingPanel> {
  double heightPanel = 620.h;
  bool slide = false;
  bool state = false;
  int type = 1;
  bool proverka = false;
  TextEditingController textNameController = TextEditingController();
  TextEditingController textContentController = TextEditingController();
  TypePanel typePanel = TypePanel.mainPanel;
  String selectEmogi = '💻';
  List<String> listEmogi = [
    '💻',
    '🖌️',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditingBotBloc, EditingBotState>(buildWhen: (previous, current) {
      if (current is OpenSlidingPanelToState) {
        heightPanel = current.height;
        widget.panelController.animatePanelToPosition(1);

        return true;
      } else {
        heightPanel = 620.h;
      }
      return true;
    }, builder: (context, snapshot) {
      return SlidingUpPanel(
        controller: widget.panelController,
        panel: panel(context),
        onPanelSlide: (position) {
          if (position == 0) {
            BlocProvider.of<EditingBotBloc>(context).add(HideSlidingPanelEvent());
            slide = false;
            typePanel = TypePanel.mainPanel;
            proverka = false;
          }
        },
        color: Colors.transparent,
        maxHeight: heightPanel,
        minHeight: 0,
        backdropEnabled: true,
        backdropColor: Colors.black,
        backdropOpacity: 0.8,
        defaultPanelState: PanelState.CLOSED,
      );
    });
  }

  Widget panel(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(),
                color: AppColors.slidingPanelDown,
              ),
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: typePanel == TypePanel.mainPanel
                            ? mainPanel()
                            : typePanel == TypePanel.secondPanel
                                ? secondPanel()
                                : typePanel == TypePanel.editPanel
                                    ? editPanel()
                                    : const SizedBox(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 0),
                  ),
                ],
                color: AppColors.slidingPanelUp,
              ),
              child: typePanel == TypePanel.mainPanel
                  ? Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            Images.close,
                          ),
                          onPressed: () {
                            BlocProvider.of<EditingBotBloc>(context).add(CloseSlidingPanelEvent());
                          },
                        ),
                        const Text(
                          'Настройки бота',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )
                      ],
                    )
                  : typePanel == TypePanel.secondPanel
                      ? Row(
                          children: [
                            IconButton(
                              icon: SvgPicture.asset(
                                Images.arrowLeft,
                              ),
                              onPressed: () {
                                BlocProvider.of<EditingBotBloc>(context).add(OpenSlidingPanelToEvent(620.h));
                                typePanel = TypePanel.mainPanel;
                              },
                            ),
                            const Text(
                              'Выбор роли',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: const Icon(
                                Icons.check,
                                color: AppColors.iconBlueColor,
                              ),
                            )
                          ],
                        )
                      : Row(
                          children: [
                            IconButton(
                              icon: SvgPicture.asset(
                                Images.arrowLeft,
                              ),
                              onPressed: () {
                                BlocProvider.of<EditingBotBloc>(context).add(OpenSlidingPanelToEvent(620.h));
                                typePanel = TypePanel.secondPanel;
                              },
                            ),
                            const Text(
                              'Редактирование роли',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: const Icon(
                                Icons.check,
                                color: AppColors.iconBlueColor,
                              ),
                            )
                          ],
                        ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mainPanel() {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(height: 80.h),
        SizedBox(
          height: 620.h,
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              Container(
                width: 328.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: AppColors.slidingPanelUp,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 8.h),
                          child: Text(
                            'Бот',
                            style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: Image.asset(
                                Images.chatGPT,
                                height: 25.h,
                                width: 25.w,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Chat GPT',
                              style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 150.w,
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        Images.editingSecond,
                        height: 12.h,
                        width: 12.w,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                width: 328.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: AppColors.slidingPanelUp,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 8.h),
                          child: Text(
                            'Роль / другой параметр бота',
                            style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: Text(
                                '💻',
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Программист',
                              style: TextStyle(color: Colors.white, fontSize: 16.sp),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 85.w,
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        Images.editingSecond,
                        height: 12.h,
                        width: 12.w,
                      ),
                      onPressed: () {
                        BlocProvider.of<EditingBotBloc>(context).add(OpenSlidingPanelToEvent(620.h));
                        typePanel = TypePanel.secondPanel;
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget secondPanel() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 70.h),
          child: SizedBox(
            height: 490.h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: 10.h,
                  ),
                  child: GestureDetector(
                    onTap: () async {},
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 10.h,
                          ),
                          child: SvgPicture.asset(
                            Images.subtract,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 1.0.w,
                              ),
                            ),
                          ),
                          child: SizedBox(
                            width: 288.w,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: Row(
                                children: [
                                  const Text(
                                    '🖌️',
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'Дизайнер',
                                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          height: 60.h,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(),
            color: AppColors.slidingPanelUp,
          ),
          child: Center(
              child: SizedBox(
                  height: 48.h,
                  width: 344.w,
                  child: CustomButton(
                      onTap: () {
                        BlocProvider.of<EditingBotBloc>(context).add(OpenSlidingPanelToEvent(620.h));
                        typePanel = TypePanel.editPanel;
                      },
                      btnColor: AppColors.bottomBlueColor,
                      label: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          Icon(
                            Icons.add,
                            color: AppColors.iconBlueColor,
                            size: 28.r,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Добавить другую роль',
                            style: TextStyle(color: AppColors.iconBlueColor, fontSize: 16.sp),
                          ),
                        ],
                      )))),
        )
      ],
    );
  }

  Widget editPanel() {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(height: 80.h),
        SizedBox(
          height: 620.h,
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 45.w,
                    height: 40.h,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: selectEmogi,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.iconBlueColor,
                              ),
                              onChanged: (value) async {
                                setState(() {
                                  selectEmogi = value!;
                                });
                              },
                              items: listEmogi.map<DropdownMenuItem<String>>((e) {
                                return DropdownMenuItem<String>(
                                    value: e,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5.w),
                                      child: Text(e),
                                    ));
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  SizedBox(
                    height: 48.h,
                    width: 256.w,
                    child: CustomTextField(
                      color: AppColors.animate,
                      hintText: 'Имя роли',
                      controller: textNameController,
                      onTap: () {},
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 48.h,
                width: 328.w,
                child: CustomTextField(
                  color: AppColors.animate,
                  hintText: 'Содержание роли',
                  controller: textContentController,
                  onTap: () {},
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                width: 328.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColors.animate,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.animate,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          duration: const Duration(milliseconds: 100),
                          alignment: type == 1 ? Alignment.centerLeft : Alignment.centerRight,
                          child: Container(
                            height: 32.h,
                            width: 156.w,
                            decoration: BoxDecoration(
                              color: AppColors.slidingPanelUp,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                bottomLeft: Radius.circular(10.r),
                                topRight: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (type != 1) {
                                      Future.delayed(
                                        const Duration(milliseconds: 50),
                                        (() {
                                          setState(() {
                                            state = !state;
                                          });
                                        }),
                                      );
                                    }
                                    type = 1;
                                  });
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Text(
                                      style: TextStyle(color: type == 1 ? Colors.white : Colors.grey, fontSize: 16.sp),
                                      'Для всех  чатов',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (type != 2) {
                                      Future.delayed(
                                        const Duration(milliseconds: 50),
                                        (() {
                                          setState(() {
                                            state = !state;
                                          });
                                        }),
                                      );
                                    }
                                    type = 2;
                                  });
                                },
                                child: Container(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Text(
                                      style: TextStyle(color: type == 2 ? Colors.white : Colors.grey, fontSize: 16.sp),
                                      'Для этого чата',
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
