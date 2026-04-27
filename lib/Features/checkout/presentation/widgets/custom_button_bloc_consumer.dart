import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_app/Features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:payment_app/Features/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment_app/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/core/widgets/custom_button.dart';
import '../../data/models/amount_model/amount_model.dart';
import '../../data/models/amount_model/details.dart';
import '../../data/models/item_list_model/item.dart';

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
            //! Stripe Payment
            // PaymentIntentInputsModel paymentIntentInputsModel =
            //     PaymentIntentInputsModel(
            //       amount: "100",
            //       currency: 'USD',
            //       customerId: 'cus_UPf0UBcpbucLHE',
            //     );
            // BlocProvider.of<PaymentCubit>(
            //   context,
            // ).makePayment(paymentInputs: paymentIntentInputsModel);

            //! PayPal Payment
            ({AmountModel amountModel, ItemListModel itemsListModel})
            transactionData = getTransactionsData();
            executePaypalPayment(context, transactionData);
          },
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }

  void executePaypalPayment(
    BuildContext context,
    ({AmountModel amountModel, ItemListModel itemsListModel}) transactionData,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.paypalClientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionData.amountModel.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionData.itemsListModel.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountModel amountModel, ItemListModel itemsListModel})
  getTransactionsData() {
    var amountModel = AmountModel(
      total: '100',
      currency: 'USD',
      details: Details(subtotal: '100', shipping: '0', shippingDiscount: 0),
    );

    List<OrderItemModel> orders = [
      OrderItemModel(name: "Apple", quantity: 4, price: '10', currency: "USD"),
      OrderItemModel(
        name: "Pineapple",
        quantity: 5,
        price: '12',
        currency: "USD",
      ),
    ];
    var itemsListModel = ItemListModel(items: orders);
    return (amountModel: amountModel, itemsListModel: itemsListModel);
  }
}
