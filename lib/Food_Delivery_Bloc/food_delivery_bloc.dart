import 'package:bloc/bloc.dart';
part 'food_delivery_event.dart';
part 'food_delivery_state.dart';

class FoodDeliveryBloc
    extends Bloc<FoodDeliveryBlocEvent, FoodDeliveryBlocState> {
  FoodDeliveryBloc() : super(FoodDeliveryBlocInitial()) {
    on<FoodDeliveryIndexChangedEvent>((event, emit) {
      // logger.w(state.indexChanged);
      emit(FoodDeliveryBlocIndexChangedState(event.indexChanged));
    });
  }
}
