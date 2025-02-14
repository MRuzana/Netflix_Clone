import 'package:flutter/material.dart';
import 'package:netflix_app/api/api_constants.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/models/new_and_hot_model.dart';

class VideoWidget extends StatelessWidget {
  final NewAndHotModel newAndHotModel;
  const VideoWidget({
    super.key,
    required this.newAndHotModel
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(ApiConstants.kBaseUrl+newAndHotModel.posterPath!,fit: BoxFit.cover,),
          
        ),
         Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.black,
          child: IconButton(onPressed: (){}, 
          icon: const Icon(Icons.volume_off,
          color: kwhiteColor,
          size: 20,
          )),
        ))
      ],
    );
  }
}