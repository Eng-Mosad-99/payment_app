import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/Features/checkout/data/models/payment_intent_inputs_model.dart';
import 'package:payment_app/Features/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment_app/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment_app/core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ThankYouView()),
          );
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return CustomButton(
          buttonText: 'Continue',
          onTap: () async {
            // final customerId = await getCustomerId() ?? "";
            PaymentIntentInputsModel paymentIntentInputsModel =
                PaymentIntentInputsModel(
                  amount: "100",
                  currency: 'USD',
                  customerId: 'cus_UPf0UBcpbucLHE',
                );
            BlocProvider.of<PaymentCubit>(
              context,
            ).makePayment(paymentInputs: paymentIntentInputsModel);
          },
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }
}
