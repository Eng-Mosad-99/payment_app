import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_app/Features/checkout/data/models/payment_intent_inputs_model.dart';
import 'package:payment_app/Features/checkout/repos/checkout_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.checkoutRepo}) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  void makePayment({required PaymentIntentInputsModel paymentInputs}) async {
    emit(PaymentLoading());

    var result = await checkoutRepo.makePayment(inputs: paymentInputs);
    result.fold(
      (failure) => emit(PaymentFailure(errorMessage: failure.errorMessage)),
      (success) => emit(PaymentSuccess()),
    );
  }
int index = 0;
 void changeMethod(int index) {
     log('Selected Payment Method Index: $index');
  emit(PaymentMethodChanged(selectedIndex: index));
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
