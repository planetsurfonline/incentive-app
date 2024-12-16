import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:psm_incentive/features/search/custom_search_bar.dart';
import 'package:psm_incentive/features/store/presentation/store_picker/bloc/store_picker_bloc.dart';
import 'package:psm_incentive/shared/enum/status.dart';
import 'package:psm_incentive/shared/widgets/widgets.dart';
import 'package:psm_incentive/utils/constants.dart';
import 'package:psm_incentive/utils/extensions/build_context_x.dart';

class StoreFilterSheet extends StatelessWidget {
  const StoreFilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(largeRadius),
          topRight: Radius.circular(largeRadius),
        ),
      ),
      margin: const EdgeInsets.all(padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: context.colorScheme.primaryContainer,
            padding: const EdgeInsets.symmetric(vertical: padding),
            child: CustomSearchBar(
              onChanged: (value) {
                context
                    .read<StorePickerBloc>()
                    .add(StorePickerSearchChange(searchQuery: value));
              },
              icon: const Icon(Icons.search_outlined),
              hintText: context.strings.searchStoreLabel,
            ),
          ),
          BlocBuilder<StorePickerBloc, StorePickerState>(
            builder: (context, state) {
              if (state.status == Status.loading) {
                return const CircularProgressIndicator();
              }

              if (state.status == Status.error) {
                return Center(
                  child: ErrorView(
                    subtitle: state.message,
                  ),
                );
              }

              if (state.displayedStores.isEmpty) {
                return const Center(
                  child: ErrorView(
                    subtitle: 'Store not found',
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: state.displayedStores.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: state.selectedStore == state.displayedStores[index]
                          ? context.customColor?.borderColor
                          : context.colorScheme.primaryContainer,
                      child: ListTile(
                        onTap: () {
                          context
                              .read<StorePickerBloc>()
                              .add(StorePickerStorePicked(
                                pickedStore: state.displayedStores[index],
                              ));
                        },
                        title: Text(state.displayedStores[index].storeName),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Container(
            padding: const EdgeInsets.only(top: padding),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                    fixedSize: const WidgetStatePropertyAll(
                      Size.fromHeight(44),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(mediumRadius),
                      ),
                    ),
                  ),
              child: Text(context.strings.applyLabel),
            ),
          )
        ],
      ),
    );
  }
}
