import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/divider_grey.dart';
import '../../../common/widgets/drop_down_button.dart';
import '../../../common/widgets/green_elev_button.dart';
import '../data/models/problem_type.dart';
import '../domain/problem_provider.dart';
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

    bool checkAllValues() =>
        ref.read(problemStateProvider).imageFile != null &&
        ref.read(problemStateProvider).coordinates != null &&
        ref.read(problemStateProvider).description.isNotEmpty &&
        ref.read(problemStateProvider).phone.isNotEmpty &&
        ref.read(problemStateProvider).category != null;

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

    Future<void> showConfirmationModal(
      BuildContext context,
      bool isSuccess,
      String title,
      String subtitle,
    ) async {
      await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  isSuccess
                      ? 'assets/images/mascot_love.png'
                      : 'assets/images/mascot_attention.png',
                  height: 120,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  title,
                  //'Спасибо за бдительность, сообщение отправлено',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 20.sp),
                ),
                SizedBox(height: 8.h),
                Text(
                  subtitle,
                  // 'Статус сообщения можно отслеживать в разделе “Меню” приложения',
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                GreenElevButton(
                  onPressed: () {
                    context.pop();
                    resetState();
                    context.pop();
                  },
                  text: 'Понятно',
                ),
              ],
            ),
          );
        },
      );
      resetState();
    }

    return WillPopScope(
      onWillPop: () async {
        resetState();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const DividerGrey(),
            ),
          ),
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/cancel.svg',
            ),
            onPressed: () {
              resetState();
              context.pop();
            },
          ),
          title: const Text('Сообщение о проблеме'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 288.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/mascot_attention.png',
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
                child: const DividerGrey(),
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
                      title: problemState.imageFile == null
                          ? Text(
                              'Загрузить фото или видео',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: AppColors.textBlue),
                            )
                          : Text(
                              problemState.imageFile!.name,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: const DividerGrey(),
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
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            onChanged: (value) {
                              ref
                                  .read(problemStateProvider.notifier)
                                  .updateDescription(value);
                            },
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
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Телефон для связи',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          SizedBox(height: 8.h),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            onChanged: (value) {
                              ref
                                  .read(problemStateProvider.notifier)
                                  .updatePhone(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // const DividerGrey(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 124.h,
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.greyLight))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GreenElevButton(
                  onPressed: ref.watch(problemStateProvider).isSending ||
                          !checkAllValues()
                      ? null
                      : () async {
                          await ref
                              .read(problemStateProvider.notifier)
                              .sendProblem();
                          if (ref.read(problemStateProvider).savedLocally) {
                            debugPrint(
                                'Failed to send problem: ${ref.read(problemStateProvider).errorMessage}');
                            showConfirmationModal(
                              context,
                              false,
                              'Не получилось отправить сообщение',
                              'Статус сообщения можно отслеживать в разделе “Меню”. Пожалуйста, отправьте его как только появится интернет',
                            );
                          } else {
                            debugPrint('Problem sent successfully');
                            showConfirmationModal(
                              context,
                              true,
                              'Спасибо за бдительность, сообщение отправлено',
                              'Статус сообщения можно отслеживать в разделе “Меню” приложения',
                            );
                          }
                        },
                  child: ref.watch(problemStateProvider).isSending
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Войти через Госуслуги и отправить')),
              SizedBox(height: 8.h),
              SizedBox(
                width: double.infinity,
                height: 44.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.greyBackgroundLight,
                  ),
                  onPressed: !checkAllValues()
                      ? null
                      : () async {
                          await ref
                              .read(problemStateProvider.notifier)
                              .saveProblem();
                          showConfirmationModal(
                            context,
                            false,
                            'Пожалуйста, отправьте сообщение как только появится интернет',
                            ' Статус сообщения можно отслеживать в разделе “Меню” приложения',
                          );
                        },
                  child: ref.watch(problemStateProvider).isSaving
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Сохранить черновик без интернета'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
