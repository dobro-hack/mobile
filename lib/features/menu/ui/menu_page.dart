import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/divider_grey.dart';
import 'widgets/my_bids.dart';
import 'widgets/my_problems.dart';
import 'widgets/contact_block.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Меню'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyBids(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const DividerGrey(),
            ),
            const MyProblems(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const DividerGrey(),
            ),
            const ContactBlock(),
          ],
        ),
      ),
    );
  }
}
