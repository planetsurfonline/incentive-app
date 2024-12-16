import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/filter/domain/models.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/bloc/filter_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/widgets/widgets.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class JobRoleFilterSection extends StatelessWidget {
  const JobRoleFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<JobRole> jobRoles = JobRole.jobRoles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilterItemHeader(title: context.strings.jobRoleLabel),
        Wrap(
          runSpacing: mediumSmallPadding,
          spacing: smallPadding,
          children: [
            ...jobRoles.map(
              (role) => BlocBuilder<FilterBloc, FilterState>(
                builder: (context, state) {
                  return SelectableFilterItem(
                      item: role,
                      isSelected: state.jobRole == role,
                      onSelected: () {
                        // TODO: Update role in filter state
                        context
                            .read<FilterBloc>()
                            .add(FilterChangeSelectedJobRole(
                              selectedJobRole: role,
                            ));
                      });
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
