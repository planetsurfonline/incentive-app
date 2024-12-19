import 'package:bloc/bloc.dart';
import 'package:psm_incentive/features/pages/main_navigation/main_navigation_enum.dart';

class MainNavigationCubit extends Cubit<MainNavigationEnum> {
  MainNavigationCubit() : super(MainNavigationEnum.home);

  void changeTab(MainNavigationEnum tab) => emit(tab);
}
