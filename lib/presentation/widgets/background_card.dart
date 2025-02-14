import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(kmainImage),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButton(
                icon: Icons.play_arrow,
                title: 'My List',
              ),
              _playButton(),
              const CustomButton(
                icon: Icons.info,
                title: 'Info',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Container _playButton() {
  return Container(
    width: 100,
    height: 39,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: kwhiteColor,
    ),
    child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: kblackColor,
        ),
        label: const Text(
          'Play',
          style: TextStyle(fontSize: 18, color: kblackColor),
        )),
  );
}
