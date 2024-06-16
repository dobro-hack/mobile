import 'package:eco/common/theme/app_colors.dart';
import 'package:eco/features/map/domain/map_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/cell.dart';
import 'note_widget.dart';

class CellBlock extends ConsumerWidget {
  const CellBlock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(mapNotifierProvider).downloadStatus;
    print(status);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 8.h,
            left: 16.w,
            right: 16.w,
          ),
          child: Text(
            'Качество связи',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        ...cells
            .map((e) => ListTile(
                  leading: SvgPicture.asset(e.iconAsset),
                  title: Text(e.name),
                  subtitle: Text(
                    e.description,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ))
            .toList(),
        Padding(
          padding: EdgeInsets.all(16.h),
          child: NoteWidget(
            title: 'Скачайте маршрут на телефон',
            text: 'Приложение будет работать, даже если интернет пропадёт',
            bottomWidget: status == DownloadStatus.success
                ? const TextButton(onPressed: null, child: Text('Скачено'))
                : status == DownloadStatus.loading
                    ? const TextButton(
                        onPressed: null,
                        child: Text(
                          'Скачивание...',
                          style: TextStyle(color: AppColors.green),
                        ))
                    : TextButton(
                        onPressed: () async {
                          bool res = await ref
                              .read(mapNotifierProvider.notifier)
                              .downloadRoute(
                                MediaQuery.sizeOf(context),
                              );
                          if (!res) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Не удалось скачать маршрут')),
                            );
                          }
                        },
                        child: const Text('Скачать')),
          ),
        ),
      ],
    );
  }
}
