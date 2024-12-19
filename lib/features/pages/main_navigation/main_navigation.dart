import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/pages/home_page/home_page.dart';
import 'package:psm_incentive/features/pages/main_navigation/cubit/main_navigation_cubit.dart';
import 'package:psm_incentive/features/pages/main_navigation/main_navigation_enum.dart';
import 'package:psm_incentive/features/pages/team_member_page/team_member_page.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainNavigationCubit(),
      child: const MainNavigationView(),
    );
  }
}

class MainNavigationView extends StatelessWidget {
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainNavigationCubit, MainNavigationEnum>(
      builder: (context, state) {
        return Scaffold(
          body: BlocBuilder<MainNavigationCubit, MainNavigationEnum>(
            builder: (context, state) {
              if (state.index == MainNavigationEnum.home.index) {
                return const HomePage();
              }

              if (state.index == MainNavigationEnum.member.index) {
                return const TeamMemberPage();
              }

              return const SizedBox();
            },
          ),
          bottomNavigationBar:
              BlocBuilder<MainNavigationCubit, MainNavigationEnum>(
            builder: (context, state) {
              return BottomNavigationBar(
                onTap: (tab) {
                  context
                      .read<MainNavigationCubit>()
                      .changeTab(MainNavigationEnum.values[tab]);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: MainNavigationEnum.home.icon,
                    label: MainNavigationEnum.home.label(context),
                  ),
                  BottomNavigationBarItem(
                      icon: MainNavigationEnum.member.icon,
                      label: MainNavigationEnum.member.label(
                        context,
                      ))
                ],
              );
            },
          ),
        );
      },
    );
  }
}
