import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/theme/app_colors.dart';
import '../../problem/data/models/problem_data.dart';
import '../../problem/domain/problem_provider.dart';

class MenuPage extends ConsumerStatefulWidget {
  const MenuPage({super.key});

  @override
  ConsumerState<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends ConsumerState<MenuPage> {
  @override
  void initState() {
    super.initState();
    ref.refresh(allProblemsProvider);
  }

  @override
  Widget build(BuildContext context) {
    final asyncProblems = ref.watch(allProblemsProvider);
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
        title: const Text('Меню'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Divider(
                color: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 12.h,
                bottom: 8.h,
                right: 16.w,
                left: 16.w,
              ),
              child: Text(
                'Мои заявки',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Text('заявки'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Divider(
                color: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 12.h,
                bottom: 8.h,
                left: 16.w,
                right: 16.w,
              ),
              child: Text(
                'Мои обращения',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            asyncProblems.when(
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                error: (Object error, StackTrace stackTrace) =>
                    Text(error.toString()),
                data: (List<ProblemData> data) {
                  return Column(
                    children: data
                        .map(
                          (e) => ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(8.w),
                              width: 48.h,
                              height: 48.h,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.black.withOpacity(0.08)),
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.green,
                              ),
                            ),
                            title: Text(
                              e.message,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(
                              e.status.name,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        )
                        .toList(),
                  );
                }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Divider(
                color: Colors.red,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 12.h, bottom: 8.h),
                    child: Text(
                      'Контакты',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Сайт',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'site.ru',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Главый по чему-то',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          '+7 (909) 135 222-2',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Эмайл главного по чему-то там',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          'priroda@mail.ru',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Версия приложения',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        // вычислять
                        Text(
                          '1.0.0',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
