import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/api/api_constants.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/models/search_model.dart';
import 'package:netflix_app/presentation/downloads/search/widgets/title.dart';

class SearchIdleWidget extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const SearchIdleWidget({super.key,required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches',),
          kHeight,

          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final result = snapshot.data[index];
                return TopSearchItemTile(searchModel: result);
              },
              shrinkWrap: true,
              separatorBuilder: (context,index)=>kHeight20, 
              itemCount: 10),
              
              
          )
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  final SearchModel searchModel;
  const TopSearchItemTile({super.key,required this.searchModel});

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth *0.35,
          height: 65,
          decoration:  BoxDecoration(
            image: DecorationImage(image: NetworkImage(ApiConstants.kBaseUrl+searchModel.posterPath!),
            fit: BoxFit.cover ),
          ),
        ),
        kwidth,
        Expanded(child: Text(searchModel.movieName,style: const TextStyle(
          color: kwhiteColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),),),
        const CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kblackColor,
            radius: 23,
            child: Center(child: Icon(CupertinoIcons.play_fill,color: kwhiteColor,)),
          ),
        ),
      ],
    );
  }
}