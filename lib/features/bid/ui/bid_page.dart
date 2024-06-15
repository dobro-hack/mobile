import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../common/widgets/green_elev_button.dart';
import '../domain/bid_provider.dart';
import 'confirmation_page.dart';
import 'widgets/date_text_field.dart';

class BidPage extends ConsumerStatefulWidget {
  const BidPage({super.key});

  @override
  ConsumerState<BidPage> createState() => _BidPageState();
}

class _BidPageState extends ConsumerState<BidPage> {
  late TextEditingController _dateController;
  DateTime? _selectedDate;
  bool _isDateAvailable = true;

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _checkDateAvailability(DateTime date) async {
    // Устанавливаем выбранную дату
    _selectedDate = date;

    // Обновляем текстовое поле с датой
    _dateController.text = DateFormat('dd.MM.yyyy').format(date);

    // Проверяем доступность даты через провайдер
    final isAvailable = await ref.read(dateAvailabilityProvider(date).future);

    // Обновляем выбранную дату в провайдере состояния
    ref.read(selectedDateProvider.notifier).setDate(date);
    // Обновляем состояние
    setState(() {
      _isDateAvailable = isAvailable;
    });
  }

  void _showConfirmationModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                'Заявка отправлена, отслеживать статус можно в разделе "Меню"',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 20.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                'Обычно расмотрение происходит за 2-3 рабочих дня',
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              GreenElevButton(
                onPressed: () {
                  context.pop();
                  context.pop();
                },
                text: 'Понятно',
              ),
            ],
          ),
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
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/cancel.svg',
          ),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text('Заявка'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: Colors.red,
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
                          'Чтобы попасть на маршрут, нужно заполнить заявление',
                          style: Theme.of(context).textTheme.labelLarge,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.red,
              ),
              Text(
                'Количество посетителей',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 8.h),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  ref
                      .read(numberOfGuestsProvider.notifier)
                      .setNumberOfGuests(int.tryParse(value) ?? 0);
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
                onDateSelected: _checkDateAvailability,
                errorText: _isDateAvailable
                    ? null
                    : 'На эту дату все места уже заняты',
              ),
              SizedBox(height: 20),
              if (_selectedDate != null && _isDateAvailable)
                Column(
                  children: [
                    Divider(
                      color: Colors.red,
                    ),
                    for (int i = 0; i < numberOfGuests; i++)
                      GuestDetailsForm(index: i + 1),
                    SizedBox(height: 20),
                    GreenElevButton(
                      onPressed: bookingStatus.isLoading
                          ? null
                          : () async {
                              // Проверяем, что дата выбрана
                              if (_selectedDate == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Пожалуйста, выберите дату')),
                                );
                                return;
                              }

                              await ref
                                  .read(bookingStatusProvider.notifier)
                                  .submitBooking();

                              // Показываем подтверждение, если отправка успешна
                              if (ref.read(bookingStatusProvider).value ??
                                  false) {
                                _showConfirmationModal(context);
                              } else if (ref
                                  .read(bookingStatusProvider)
                                  .hasError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Ошибка при отправке заявки')),
                                );
                              }
                            },
                      child: bookingStatus.isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text('Отправить заявку'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class GuestDetailsForm extends StatelessWidget {
  final int index;

  const GuestDetailsForm({required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Text(
            '${'Посетитель'.toUpperCase()} №$index',
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        TextField(decoration: InputDecoration(labelText: 'Фамилия')),
        TextField(decoration: InputDecoration(labelText: 'Имя')),
        TextField(decoration: InputDecoration(labelText: 'Отчество')),
        TextField(decoration: InputDecoration(labelText: 'Дата рождения')),
        TextField(
            decoration: InputDecoration(labelText: 'Серия и номер паспорта')),
      ],
    );
  }
}
