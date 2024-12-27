
import 'package:flutter_application_2/featuers/custom/main/presentation/blocs/cubit/routes_main_nav_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutesMainNavBarCubit extends Cubit<RoutesMainNavBarState> {
  RoutesMainNavBarCubit() : super(const RoutesMainNavBarState());

  RoutesMainNavBarStateValue stateValue = RoutesMainNavBarStateValue.home;
 
  void routesNavBar({RoutesMainNavBarStateValue? value}) {
    if (value == RoutesMainNavBarStateValue.profile) {
      
      stateValue = RoutesMainNavBarStateValue.profile;
    } else if (value == RoutesMainNavBarStateValue.favourites) {
     
      stateValue = RoutesMainNavBarStateValue.favourites;
    } else if (value == RoutesMainNavBarStateValue.notifications) {
     
      stateValue = RoutesMainNavBarStateValue.notifications;
    } else {
     
      stateValue = RoutesMainNavBarStateValue.home;
    }
    emit(const RoutesMainNavBarState().copyWith(page: stateValue));
  }
}
