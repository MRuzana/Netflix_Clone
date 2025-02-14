import 'package:flutter/material.dart';
import 'package:netflix_app/api/api_constants.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/main_card.dart';
import 'package:netflix_app/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final String cardTitle;
  final AsyncSnapshot snapshot;
  const MainTitleCard({
    super.key,
    required this.cardTitle,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        MainTitle(title: cardTitle),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return MainCard(imageUrl: '${ApiConstants.kBaseUrl}${snapshot.data[index].posterPath}',);
            },
            scrollDirection: Axis.horizontal,
            
          ),
        ),
      ],
    );
  }
}