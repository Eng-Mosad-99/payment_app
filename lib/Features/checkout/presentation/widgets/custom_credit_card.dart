
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key, required this.formKey, this.autovalidateMode});
final GlobalKey<FormState> formKey ;
final AutovalidateMode? autovalidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';
  bool isCvvFocused = false;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          isHolderNameVisible: true,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView:
              isCvvFocused,
          onCreditCardWidgetChange:
              (brand) {}, 
        ),
        CreditCardForm(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          autovalidateMode: widget.autovalidateMode,
          onCreditCardModelChange: (CreditCardModel model) {
            setState(() {
              cardNumber = model.cardNumber;
              expiryDate = model.expiryDate;
              cardHolderName = model.cardHolderName;
              cvvCode = model.cvvCode;
              isCvvFocused = model.isCvvFocused;
            });
          },
          formKey: widget.formKey,
        ),
      ],
    );
  }
}
