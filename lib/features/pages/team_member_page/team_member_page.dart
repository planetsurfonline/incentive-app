import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/bloc/filter_bloc.dart';
import 'package:psm_incentive/features/filter/presentation/filter_sheet/filter_sheet.dart';
import 'package:psm_incentive/features/members/presentation/member_list/bloc/member_list_bloc.dart';
import 'package:psm_incentive/features/search/custom_search_bar.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/shared/widgets/widgets.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class TeamMemberPage extends StatelessWidget {
  const TeamMemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemberListBloc(),
      child: const TeamMemberPageView(),
    );
  }
}

class TeamMemberPageView extends StatefulWidget {
  const TeamMemberPageView({super.key});

  @override
  State<TeamMemberPageView> createState() => _TeamMemberPageState();
}

class _TeamMemberPageState extends State<TeamMemberPageView> {
  final ScrollController _scrollController = ScrollController();

  double _currentPosition = 0;
  double _previousScrollOffset = 0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    double currentOffset = _scrollController.offset;

    if (currentOffset > _previousScrollOffset) {
      // Scroll Down
      setState(() => _currentPosition = -currentOffset);
    } else {
      // Scroll Up
      if (currentOffset <= 32 || _currentPosition >= 0) {
        setState(() => _currentPosition = 0);
      } else {
        setState(() => _currentPosition += (currentOffset - _currentPosition));
      }
    }

    _previousScrollOffset = currentOffset;
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.teamMemberListLabel),
        actions: const [IncentiveVisibilityToggle()],
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: Stack(
          children: [
            BlocBuilder<MemberListBloc, MemberListState>(
              builder: (context, state) {
                if (state.status == Status.loading) return const SizedBox();

                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  top: _currentPosition,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(padding),
                    color: context.colorScheme.primaryContainer,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomSearchBar(
                            icon: const Icon(Icons.search),
                            hintText: context.strings.searchInvoiceLabel,
                            onChanged: (text) {
                              // TOOD: Apply search
                            },
                          ),
                        ),
                        const SizedBox(width: mediumSmallPadding),
                        FilterButton(
                          onPressed: () async {
                            final result = await showModalBottomSheet(
                              context: context,
                              builder: (_) {
                                return BlocProvider.value(
                                  value: BlocProvider.of<FilterBloc>(context),
                                  child: const FilterSheet(),
                                );
                              },
                            ) as FilterState?;

                            if (result != null) {
                              if (context.mounted) {
                                // TODO: Apply Filter
                              }
                            }
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
