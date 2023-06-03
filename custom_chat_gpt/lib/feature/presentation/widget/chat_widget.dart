import 'package:flutter/material.dart';

import 'bottom_panel.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            // color: Colors.amber,
            ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: BottomPanel(),
        ),
      ],
    );
  }
}
