import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/incentives/data/incentives_repository.dart';
import 'package:psm_incentive/features/incentives/presentation/history/widgets/widgets.dart';
import 'package:psm_incentive/features/incentives/presentation/history/bloc/incentive_history_bloc.dart';
import 'package:psm_incentive/features/incentives/presentation/incentive/bloc/incentive_bloc.dart';
import 'package:psm_incentive/features/incentives/presentation/incentive/widgets/widgets.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final IncentivesRepository repository = IncentivesRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => IncentiveHistoryBloc(
            repository: repository,
          )..add(IncentiveHistoryGetRecentData()),
        ),
        BlocProvider(
          create: (context) => IncentiveBloc(repository: repository)
            ..add(IncentiveGetAmountData()),
        ),
      ],
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.homeLabel),
        actions: [
          IconButton(
            onPressed: () async {
              // TODO: Change if needed
              await Supabase.instance.client.auth.signOut();
            },
            icon: const Icon(Icons.logout_rounded),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<IncentiveBloc>().add(IncentiveGetAmountData());
          context
              .read<IncentiveHistoryBloc>()
              .add(IncentiveHistoryGetRecentData());
        },
        child: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IncentiveAmount(),
              Divider(),
              RecentHistorySection(),
            ],
          ),
        ),
      ),
    );
  }
}
