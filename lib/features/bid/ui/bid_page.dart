import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/widgets/divider_grey.dart';
import '../../../common/widgets/green_elev_button.dart';
import '../../map/domain/map_notifier_provider.dart';
import '../domain/bid_provider.dart';
import 'widgets/date_text_field.dart';
import 'package:intl/intl.dart';

import 'widgets/guesr_details_form.dart';

class BidPage extends ConsumerStatefulWidget {
  const BidPage({super.key});

  @override
  ConsumerState<BidPage> createState() => _BidPageState();
}

class _BidPageState extends ConsumerState<BidPage> {
  late TextEditingController _dateController;
  late TextEditingController _countController;
  DateTime? _selectedDate;
  bool _isDateAvailable = true;
  List<GlobalKey<FormState>> keys = [];
  List<GlobalKey<GuestDetailsFormState>> keysWidget = [];

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    _countController = TextEditingController();
    _countController.text = "1";
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _checkAccess() async {
    if (_selectedDate != null && ref.read(numberOfGuestsProvider) > 0) {
      final isAvailable =
          await ref.read(dateAvailabilityProvider(_selectedDate!).future);
      keys = List.generate(ref.read(numberOfGuestsProvider),
          (index) => GlobalKey<FormState>()).toList();
      keysWidget = List.generate(ref.read(numberOfGuestsProvider),
          (index) => GlobalKey<GuestDetailsFormState>()).toList();
      setState(() {
        _isDateAvailable = isAvailable;
      });
    }
  }

  Future<void> _setDate(DateTime date) async {
    _selectedDate = date;
    _dateController.text = DateFormat('dd.MM.yyyy').format(date);
    ref.read(selectedDateProvider.notifier).setDate(date);
    _checkAccess();
  }

  void _showConfirmationModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: _SendSuccess(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final numberOfGuests = ref.watch(numberOfGuestsProvider);
    final bookingStatus = ref.watch(bookingStatusProvider);

    return Scaffold(
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
            context.pop();
          },
        ),
        title: const Text('Заявка'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          'assets/images/mascot_note.png',
                          height: 120,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          'Чтобы попасть на маршрут, нужно заполнить заявление',
                          style: Theme.of(context).textTheme.labelLarge,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const DividerGrey(),
              Text(
                'Количество посетителей',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: _countController,
                keyboardType: TextInputType.number,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onChanged: (value) {
                  ref
                      .read(numberOfGuestsProvider.notifier)
                      .setNumberOfGuests(int.tryParse(value) ?? 0);
                  _checkAccess();
                },
              ),
              SizedBox(height: 16.h),
              Text(
                'Дата входа',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 8.h),
              DateTextField(
                controller: _dateController,
                selectedDate: _selectedDate,
                onDateSelected: _setDate,
                errorText: _isDateAvailable
                    ? null
                    : 'На эту дату все места уже заняты',
              ),
              SizedBox(height: 20.h),
              if (_selectedDate != null && _isDateAvailable)
                Column(
                  children: [
                    const DividerGrey(),
                    for (int i = 0; i < numberOfGuests; i++)
                      GuestDetailsForm(
                        key: keysWidget[i],
                        index: i + 1,
                        formKey: keys[i],
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: (_selectedDate != null && _isDateAvailable)
          ? Container(
              height: 68.h,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: AppColors.greyLight))),
              child: GreenElevButton(
                onPressed: bookingStatus.isLoading
                    ? null
                    : () async {
                        if (_selectedDate == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Пожалуйста, выберите дату')),
                          );
                          return;
                        }

                        if (keys
                            .map((k) {
                              return k.currentState!.validate();
                            })
                            .toSet()
                            .contains(false)) return;
                        final uuid = const Uuid().v1();

                        List<Map<String, dynamic>> persons = [];
                        for (int i = 0; i < keys.length; i++) {
                          Map<String, dynamic> formData =
                              keysWidget[i].currentState!.getFormData();
                          persons.add(formData);
                        }

                        await ref
                            .read(bookingStatusProvider.notifier)
                            .submitBooking(uuid, persons);

                        if (ref.read(bookingStatusProvider).value ?? false) {
                          _showConfirmationModal(context);
                        } else if (ref.read(bookingStatusProvider).hasError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Ошибка при отправке заявки')),
                          );
                        }
                      },
                child: bookingStatus.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Отправить заявку'),
              ),
            )
          : null,
    );
  }
}

class _SendSuccess extends ConsumerWidget {
  const _SendSuccess();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(mapNotifierProvider).downloadStatus;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/mascot_love.png',
          height: 120,
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          'Заявка отправлена',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontSize: 20.sp),
        ),
        SizedBox(height: 8.h),
        Text(
          'Скачайте маршрут на телефон. Приложение будет работать, даже если интернет пропадёт',
          style: Theme.of(context).textTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        status == DownloadStatus.success
            ? const GreenElevButton(onPressed: null, child: Text('Скачено'))
            : status == DownloadStatus.loading
                ? const GreenElevButton(
                    onPressed: null,
                    child: Text(
                      'Скачивание...',
                      style: TextStyle(color: AppColors.green),
                    ))
                : GreenElevButton(
                    onPressed: () async {
                      bool res = await ref
                          .read(mapNotifierProvider.notifier)
                          .downloadRoute(
                            MediaQuery.sizeOf(context),
                          );
                      if (!res) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Не удалось скачать маршрут')),
                        );
                      }
                    },
                    child: const Text('Скачать')),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.greyBackgroundLight,
            ),
            onPressed: () {
              context.pop();
              context.pop();
            },
            child: const Text('Продолжить'),
          ),
        ),
      ],
    );
  }
}
