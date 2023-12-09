import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:vendor/core/gen/assets.gen.dart';
import 'package:vendor/core/localization/localization.dart';
import 'package:vendor/src/models/store_review/store_review_model.dart';
import 'package:vendor/src/repository/store/profile.dart';
import 'package:timeago/timeago.dart' as timeago;

class StoreReviewsScreen extends ConsumerWidget {
  const StoreReviewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewModel = ref.watch(StoreRepository.storeReviewProvider).value;
    return Scaffold(
      appBar: AppBar(leading: BackButton(
        onPressed: () {
          context.pop();
        },
      )),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Reviews",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          reviewModel == null
              ? const CircularProgressIndicator()
              : Expanded(
                  child: reviewModel.reviewsRatings.length == 0
                      ? Text(context.localization.no_reviews_yet)
                      : ListView.separated(
                          itemCount: reviewModel.reviewsRatings.length,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                          itemBuilder: (context, index) {
                            final review = reviewModel.reviewsRatings[index];
                            return ReviewWidget(review: review);
                          },
                        ),
                ),
        ],
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  ReviewWidget({super.key, required this.review});

  final StoreReviewRating review;
  final GlobalKey key = GlobalKey(); // declare a global key

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          key: key,
          leading: Transform.translate(
            offset: Offset(0, -60.r),
            child: CircleAvatar(
              radius: 60.r,
              backgroundImage: review.user.avatar == null
                  ? AssetImage($AssetsImgsGen().avatar.path) as ImageProvider
                  : CachedNetworkImageProvider(review.user.avatar!),
            ),
          ),
          title: Text(review.user.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                timeago.format(
                  review.createdAt,
                  locale: Localizations.localeOf(context).languageCode,
                ),
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                children: buildList<Widget>(5, (index) {
                  final color = index <= review.rating - 1
                      ? Color(0xFFFFB900)
                      : Colors.grey;
                  return Icon(Icons.star, color: color, size: 17);
                }),
              ),
              ReadMoreText(
                review.review ?? context.localization.no_review,
                colorClickableText: Colors.pink,
                trimMode: TrimMode.Line,
                trimLines: 2,
                trimCollapsedText: context.localization.show_more,
                trimExpandedText: context.localization.show_less,
                style: TextStyle(
                  color: review.review == null ? Colors.grey : Colors.black,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Divider(),
        )
      ],
    );
  }
}

List<T> buildList<T>(int length, T Function(int index) buildFunction) {
  List<T> result = [];
  for (int i = 0; i < length; i++) {
    result.add(buildFunction(i));
  }
  return result;
}
