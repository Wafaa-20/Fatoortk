import 'package:fatoortk/core/functions/navigation.dart';
import 'package:fatoortk/core/theme/app_color.dart';
import 'package:fatoortk/core/widgets/text_btn.dart';
import 'package:fatoortk/featuares/onboarding/presentation/bloc/page_changed_cubit.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/get_button_action.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/onboarding_body.dart';
import 'package:fatoortk/featuares/onboarding/presentation/widget/smooth_page_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController(initialPage: 0);
  int lastPageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageChangedCubit(),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColor.background2,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            Align(
              alignment: Alignment.topRight,
              child: TextBtn(
                text: 'Skip',
                onPressed: () => customReplacementNavigate(context, "/login"),
              ),
            ),
            BlocBuilder<PageChangedCubit, int>(
              builder: (context, state) {
                return Column(
                  children: [
                    OnboardingBody(
                        controller: controller,
                        onPageChanged: (int index) =>
                            context.read<PageChangedCubit>().updatePage(index)),
                    SmoothPageIndecator(controller: controller),
                    const SizedBox(height: 35),
                    GetButtonAction(
                      controller: controller,
                      currentIndex: state,
                      lastPageIndex: lastPageIndex,
                    )
                  ],
                );
              },
            ),
          ]),
        ),
      )),
    );
  }
}
