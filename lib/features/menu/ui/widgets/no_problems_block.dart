import 'package:eco/common/widgets/green_elev_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/navigation/route_name.dart';

class NoProblemsBlock extends StatelessWidget {
  const NoProblemsBlock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Text(
            'Если встретите на маршрутах мусор, костры, несанкционированное что-то сообщите нам, мы постараемся всё исправить', // textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: SizedBox(
              width: double.infinity,
              child: GreenElevButton(
                text: 'Сообщить о проблеме',
                onPressed: () {
                  context.pushNamed(RouteName.problem);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
