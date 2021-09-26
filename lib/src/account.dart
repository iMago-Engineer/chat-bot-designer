import 'package:chat_bot_designer/src/style_library.dart';
import 'package:flutter/material.dart';

import 'margin_box.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      width: screenSize.width * 0.25,
      height: screenSize.height - 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          horizontalMargin32(),
          Text(
            'Account',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: titleColor),
          ),
          horizontalMargin16(),
          Icon(
            Icons.account_circle,
            size: 160,
            color: iconColor,
          ),
          horizontalMargin20(),
          Text(
            'NAME',
            style: TextStyle(fontSize: 24, color: textColor),
          ),
          horizontalMargin16(),
          Text(
            'iqlab@imago.mobi',
            style: TextStyle(fontSize: 18, color: textColor),
          ),
          horizontalMargin44(),
          const ProjectList()
        ],
      ),
    );
  }
}

class ProjectList extends StatelessWidget {
  const ProjectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String?> photoUrls = [
      "https://pbs.twimg.com/media/EFPmLVdUwAApe_3.jpg",
      "https://yt3.ggpht.com/ytc/AKedOLR4sUlj5ljri1WksueI5S825TFRZ5fiwh2dgcTgCQ=s900-c-k-c0x00ffffff-no-rj",
      "data:image/png;base64,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",
      null
    ];
    return SizedBox(
        width: 200,
        height: 250,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: photoUrls.length,
            itemBuilder: (context, int index) {
              return ProjectIcon(
                  photoUrl: photoUrls[index], selected: index == 0);
            }));
  }
}

class ProjectIcon extends StatelessWidget {
  final String? photoUrl;
  final bool selected;

  const ProjectIcon({Key? key, this.photoUrl, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: 150,
        height: 150,
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color(0xffC5CAD7).withOpacity(0.35), width: 0.5),
          borderRadius: BorderRadius.circular(10),
          color: selected
              ? Colors.green.withOpacity(0.35)
              : const Color(0xffF5F8FA).withOpacity(0.35),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]
              : [],
        ),
        child: Container(
          width: 80,
          height: 80,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: photoUrl == null
              ? const Icon(
                  Icons.add,
                  color: Colors.green,
                  size: 80,
                )
              : Image.network(
                  photoUrl!,
                  fit: BoxFit.contain,
                ),
        ));
  }
}
