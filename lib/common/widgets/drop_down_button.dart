import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
import 'green_elev_button.dart';

class CustomSingleDropdownButton<T> extends StatefulWidget {
  final List<DropdownItem<T>> items;
  final T? initialValue;
  final String hintText;
  final String title;
  final ValueChanged<T> onChanged;

  const CustomSingleDropdownButton({
    super.key,
    required this.items,
    this.initialValue,
    required this.hintText,
    required this.title,
    required this.onChanged,
  });

  @override
  CustomSingleDropdownButtonState<T> createState() =>
      CustomSingleDropdownButtonState<T>();
}

class CustomSingleDropdownButtonState<T>
    extends State<CustomSingleDropdownButton<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  void _showDropdownSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DropdownSheet<T>(
          items: widget.items,
          initialSelectedValue: selectedValue,
          onItemSelected: (T value) {
            setState(() {
              selectedValue = value;
            });
            widget.onChanged(value);
          },
          title: widget.title,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdownSheet(context),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).inputDecorationTheme.fillColor,
            border: Border.fromBorderSide(Theme.of(context)
                .inputDecorationTheme
                .enabledBorder!
                .borderSide),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: selectedValue == null
                  ? Text(
                      widget.hintText,
                      style: Theme.of(context)
                          .inputDecorationTheme
                          .hintStyle
                          ?.copyWith(height: 1.8),
                    )
                  : Text(
                      widget.items
                          .firstWhere((item) => item.value == selectedValue)
                          .displayText,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(height: 1.8),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: SvgPicture.asset(
                'assets/icons/chevron_down.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownItem<T> {
  final T value;
  final String displayText;

  DropdownItem({required this.value, required this.displayText});
}

class DropdownSheet<T> extends StatefulWidget {
  final List<DropdownItem<T>> items;
  final T? initialSelectedValue;
  final ValueChanged<T> onItemSelected;
  final String title;

  const DropdownSheet({
    super.key,
    required this.items,
    this.initialSelectedValue,
    required this.onItemSelected,
    required this.title,
  });

  @override
  DropdownSheetState<T> createState() => DropdownSheetState<T>();
}

class DropdownSheetState<T> extends State<DropdownSheet<T>> {
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialSelectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 50,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          color: Theme.of(context).colorScheme.surfaceVariant),
      padding: const EdgeInsets.only(top: 24, bottom: 18, left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/cancel.svg',
                ),
                onPressed: () {
                  context.pop();
                },
              ),
              Expanded(
                child: Text(
                  widget.title,
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Divider(),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.items.length,
                    itemBuilder: (context, index) {
                      final item = widget.items[index];
                      return ListTile(
                        horizontalTitleGap: 0,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 0),
                        visualDensity: VisualDensity.compact,
                        title: Text(item.displayText),
                        leading: Radio<T>(
                          activeColor: Theme.of(context).colorScheme.primary,
                          // visualDensity: const VisualDensity(
                          //   horizontal: VisualDensity.minimumDensity,
                          // ),
                          // materialTapTargetSize:
                          //     MaterialTapTargetSize.shrinkWrap,
                          value: item.value,
                          groupValue: selectedValue,
                          onChanged: (T? value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                        ),
                        onTap: () {
                          setState(() {
                            selectedValue = item.value;
                          });
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          GreenElevButton(
            onPressed: selectedValue != null
                ? () {
                    widget.onItemSelected(selectedValue as T);
                    Navigator.pop(context);
                  }
                : null,
            text: 'Выбрать',
          ),
        ],
      ),
    );
  }
}
