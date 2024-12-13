import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/filter/data/filter_repository.dart';
import 'package:psm_incentive/features/filter/presentation/period_picker/bloc/period_picker_bloc.dart';
import 'package:psm_incentive/features/incentives/data/incentives_repository.dart';
import 'package:psm_incentive/features/incentives/presentation/history/bloc/incentive_history_bloc.dart';
import 'package:psm_incentive/features/incentives/presentation/history/widgets/history_list.dart';

class IncentiveHistoryPage extends StatelessWidget {
  const IncentiveHistoryPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const IncentiveHistoryPage(),
      );

  @override
  Widget build(BuildContext context) {
    final IncentivesRepository repository = IncentivesRepository();
    final FilterRepository filterRepository = FilterRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => IncentiveHistoryBloc(repository: repository)
            ..add(IncentiveHistoryGetHistoryData()),
        ),
        BlocProvider(
          create: (context) => PeriodPickerBloc(repository: filterRepository)
            ..add(PeriodPickerGetPeriodList()),
        )
      ],
      child: const IncentiveHistoryPageView(),
    );
  }
}

class IncentiveHistoryPageView extends StatelessWidget {
  const IncentiveHistoryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incentive Logging'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context
              .read<IncentiveHistoryBloc>()
              .add(IncentiveHistoryGetHistoryData());
        },
        child: const HistoryList(),
      ),
    );
  }
}
