import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/divider_grey.dart';
import '../../../../common/widgets/text_show_more.dart';
import '../../data/models/place.dart';

void showPlaceModal(BuildContext context, Place place) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.r))),
    builder: (BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/icons/cancel.svg',
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
                Expanded(
                  child: Text(
                    'О месте',
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const DividerGrey(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  place.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 4.h),
                TextShowMore(text: place.description),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const DividerGrey(),
          ),
        ],
      );
    },
  );
}
