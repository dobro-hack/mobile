import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/asset_type.dart';
import '../../data/models/place.dart';
import 'place_short_widget.dart';

class PlacesBlock extends StatelessWidget {
  const PlacesBlock({
    super.key,
    required this.places,
  });

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    List<Place> sortPlace = List.from(places);

    sortPlace.sort((a, b) {
      bool aIsRaster = ImageTypeDetector.isRaster(a.icon);
      bool bIsRaster = ImageTypeDetector.isRaster(b.icon);

      if (aIsRaster && !bIsRaster) {
        return -1;
      } else if (!aIsRaster && bIsRaster) {
        return 1;
      } else {
        return 0;
      }
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Text(
            'На маршруте',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          height: 124.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: 12.w),
              Row(
                mainAxisSize: MainAxisSize.min,
                children:
                    sortPlace.map((pl) => PlaceShortWidget(place: pl)).toList(),
              ),
              SizedBox(width: 12.w),
            ],
          ),
        ),
      ],
    );
  }
}
