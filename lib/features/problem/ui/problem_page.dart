import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/drop_down_button.dart';
import '../data/models/problem_type.dart';
import '../domain/problem_state.dart';
import 'location_picker_page.dart';

class ProblemPage extends ConsumerWidget {
  const ProblemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final problemState = ref.watch(problemStateProvider);

    Future<void> _pickImage() async {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      ref.read(problemStateProvider.notifier).updateImage(image);
    }

    Future<void> selectLocation() async {
      final selectedCoordinates = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LocationPickerPage()),
      );

      if (selectedCoordinates != null) {
        ref.read(problemStateProvider.notifier).updateCoordinates(
              LatLng(
                selectedCoordinates['latitude'],
                selectedCoordinates['longitude'],
              ),
            );
      }
    }

    void resetState() {
      ref.read(problemStateProvider.notifier).resetState();
    }

    return WillPopScope(
      onWillPop: () async {
        resetState();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/cancel.svg',
            ),
            onPressed: () {
              resetState();
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
                      onTap: _pickImage,
                      leading: Container(
                        clipBehavior: Clip.hardEdge,
                        width: 48.h,
                        height: 48.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.black.withOpacity(0.08),
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.greyBackgroundLight,
                        ),
                        child: problemState.imageFile == null
                            ? const Icon(
                                Icons.add,
                                size: 36,
                                color: AppColors.blue,
                              )
                            : Image.file(
                                File(problemState.imageFile!.path),
                                fit: BoxFit.cover,
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
                      onTap: selectLocation,
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
                        problemState.coordinates == null
                            ? 'Указать место на карте'
                            : 'Место на карте',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.textBlue),
                      ),
                      subtitle: Text(
                        problemState.coordinates == null
                            ? 'Если есть сигнал GPS или можете указать место на карте вручную'
                            : '${problemState.coordinates!.latitude}, ${problemState.coordinates!.longitude}',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Категория проблемы',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(height: 8.h),
                          CustomSingleDropdownButton(
                            items: ProblemType.values
                                .map((e) => DropdownItem<ProblemType>(
                                    value: e, displayText: e.name))
                                .toList(),
                            hintText: 'Выберите категорию',
                            title: 'Категория проблемы',
                            onChanged: (ProblemType value) {
                              ref
                                  .read(problemStateProvider.notifier)
                                  .updateCategory(value);
                            },
                          ),
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
                  onPressed: () {
                    ref
                        .read(problemStateProvider.notifier)
                        .sendProblem()
                        .then((_) {
                      // Обработка успешной отправки
                      print('Problem sent successfully');
                    }).catchError((error) {
                      // Обработка ошибки при отправке
                      print('Failed to send problem: $error');
                    });
                  },
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
      ),
    );
  }
}
