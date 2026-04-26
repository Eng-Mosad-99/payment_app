import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_app/Features/checkout/data/models/payment_intent_inputs_model.dart';
import 'package:payment_app/Features/checkout/repos/checkout_repo.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit({required this.checkoutRepo}) : super(CheckoutInitial());
  final CheckoutRepo checkoutRepo;

  void makePayment({required PaymentIntentInputsModel paymentInputs}) async {
    emit(CheckoutLoading());

    var result = await checkoutRepo.makePayment(inputs: paymentInputs);
    result.fold(
      (failure) => emit(CheckoutFailure(errorMessage: failure.errorMessage)),
      (success) => emit(CheckoutSuccess()),
    );
  }

  @override
  void onChange(Change<CheckoutState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
