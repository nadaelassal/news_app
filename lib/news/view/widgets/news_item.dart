// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/news/view/widgets/news_details_screen.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/news/data/models/news.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(this.news, {super.key});
  final News news;
  @override
  Widget build(BuildContext context) {
    final titleSmallStyle = Theme.of(context).textTheme.titleSmall;

    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(NewsDetailsScreen.routeName , arguments: news);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.network(
                news.urlToImage ??
                    'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              news.source!.name ?? '',
              style: titleSmallStyle?.copyWith(
                color: AppTheme.grey,
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              news.title ?? '',
              style: titleSmallStyle?.copyWith(
                color: AppTheme.navy,
                fontWeight: FontWeight.w500,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                timeago.format(news.publishedAt ?? DateTime.now()),
                style:
                    titleSmallStyle?.copyWith(color: AppTheme.grey, fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  }
}
