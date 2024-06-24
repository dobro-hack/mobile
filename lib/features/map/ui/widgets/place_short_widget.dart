import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/theme/app_colors.dart';
import '../../../../common/utils/asset_type.dart';
import '../../data/models/place.dart';
import 'place_bottom_modal.dart';

class PlaceShortWidget extends StatelessWidget {
  const PlaceShortWidget({
    super.key,
    required this.place,
  });

  final Place place;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPlaceModal(context, place);
      },
      child: Container(
        width: 76.w,
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 32.r,
              backgroundColor: AppColors.greyBackgroundLight,
              backgroundImage: NetworkImage(place.icon),
              child: ImageTypeDetector.isSvg(place.icon)
                  ? SvgPicture.network(place.icon)
                  : null,
            ),
            SizedBox(height: 4.h),
            Text(
              // place.location?.lat.toString() ?? '',
              place.name,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
