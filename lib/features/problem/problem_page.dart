import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../common/theme/app_colors.dart';

class ProblemPage extends StatelessWidget {
  const ProblemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/cancel.svg',
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text('Сообщение о проблеме'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Divider(
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 288.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/mascot_note.png',
                        height: 120,
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        'Если вы встретили проблемы на маршруте - сообщите нам. Мы постараемся это исправить',
                        style: Theme.of(context).textTheme.labelLarge,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Divider(
                color: Colors.red,
              ),
            ),
            Form(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: Container(
                      width: 48.h,
                      height: 48.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.black.withOpacity(0.08),
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.greyBackgroundLight,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 36,
                        color: AppColors.blue,
                      ),
                    ),
                    title: Text(
                      'Загрузить фото или видео',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.textBlue),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Divider(
                      color: Colors.red,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Container(
                      padding: EdgeInsets.all(8.w),
                      width: 48.h,
                      height: 48.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.black.withOpacity(0.08),
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.greyBackgroundLight,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/location.svg',
                        color: AppColors.blue,
                      ),
                    ),
                    title: Text(
                      'Указать место на карте',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColors.textBlue),
                    ),
                    subtitle: Text(
                      'Если есть сигнал GPS или можете указать место на карте вручную',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Описание проблемы',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Категория проблемы',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.red,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  foregroundColor: AppColors.white,
                ),
                onPressed: () {},
                child: Text('Войти через Госуслуги и отправить'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyBackgroundLight,
                ),
                onPressed: () {},
                child: Text('Сохранить черновик без интернета'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
