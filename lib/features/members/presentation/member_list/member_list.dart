import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/members/presentation/member_list/bloc/member_list_bloc.dart';
import 'package:psm_incentive/features/members/presentation/member_list/widgets/widgets.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/shared/widgets/widgets.dart';
import 'package:psm_incentive/utils/constants.dart';

class MemberList extends StatelessWidget {
  const MemberList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: BlocBuilder<MemberListBloc, MemberListState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return const MemberListLoading();
          }

          if (state.displayedMemberList.isEmpty) {
            return const ErrorView(
              subtitle: 'No Member List',
            );
          }

          return ListView.builder(
            itemCount: state.displayedMemberList.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    MemberListItem(member: state.displayedMemberList[index])
                  ],
                );
              }
              return MemberListItem(member: state.displayedMemberList[index]);
            },
          );
        },
      ),
    );
  }
}
