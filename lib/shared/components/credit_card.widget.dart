import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

class CreditCard extends StatefulWidget {
  CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool isCvvFocused = false;

  bool useGlassMorphism = false;

  bool useBackgroundImage = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  UnderlineInputBorder? border;

  @override
  void initState() {
    border = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CreditCardWidget(
        cardNumber: cardNumber,
        expiryDate: expiryDate,
        cardHolderName: cardHolderName,
        cvvCode: cvvCode,
        showBackView: isCvvFocused,
        onCreditCardWidgetChange:
            (CreditCardBrand) {}, //true when you want to show cvv(back) view
      ),
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CreditCardForm(
              formKey: formKey,
              obscureCvv: true,
              obscureNumber: true,
              cardNumber: cardNumber,
              cvvCode: cvvCode,
              isHolderNameVisible: true,
              isCardNumberVisible: true,
              isExpiryDateVisible: true,
              cardHolderName: cardHolderName,
              expiryDate: expiryDate,
              themeColor: Colors.blue,
              cardNumberDecoration: InputDecoration(
                labelText: 'Número do Cartão',
                hintText: 'XXXX XXXX XXXX XXXX',
                focusedBorder: border,
                enabledBorder: border,
              ),
              expiryDateDecoration: InputDecoration(
                focusedBorder: border,
                enabledBorder: border,
                labelText: 'Validade',
                hintText: 'XX/XX',
              ),
              cvvCodeDecoration: InputDecoration(
                focusedBorder: border,
                enabledBorder: border,
                labelText: 'CVV',
                hintText: 'XXX',
              ),
              cardHolderDecoration: InputDecoration(
                focusedBorder: border,
                enabledBorder: border,
                labelText: 'Nome no Cartão',
              ),
              onCreditCardModelChange: onCreditCardModelChange,
            ),
          ],
        ),
      ),
    ]);
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
