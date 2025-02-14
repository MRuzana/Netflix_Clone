import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/models/new_and_hot_model.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';
import 'package:netflix_app/presentation/widgets/video_widget.dart';

class EveryonesWatchingWIdget extends StatelessWidget {
  final NewAndHotModel newAndHotModel;

  const EveryonesWatchingWIdget({
    super.key,
    required this.newAndHotModel,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [
        kHeight,
        Text(
          newAndHotModel.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          newAndHotModel.description,
          style: const TextStyle(color: kGrey),
        ),
        kHeight50,
        VideoWidget(newAndHotModel: newAndHotModel,),
        kHeight,
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(icon: Icons.share, title: 'Share',iconSize: 25,textSize: 16,),
            kwidth,
            CustomButton(icon: Icons.add, title: 'My List',iconSize: 25,textSize: 16,),
            kwidth,
            CustomButton(icon: Icons.play_arrow, title: 'Play',iconSize: 25,textSize: 16,),
            kwidth,
          ],
        ),
      ],
    );
  }
}
