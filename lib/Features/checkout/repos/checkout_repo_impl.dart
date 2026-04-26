import 'package:dartz/dartz.dart';
import 'package:payment_app/Features/checkout/data/models/payment_intent_inputs_model.dart';
import 'package:payment_app/Features/checkout/repos/checkout_repo.dart';
import 'package:payment_app/core/errors/failures.dart';
import 'package:payment_app/core/services/stripe_service.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputsModel inputs,
  }) async {
    try {
      await stripeService.makePayment(inputs: inputs);
      return Right(null);
    } catch (e) {
      print(e);
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
