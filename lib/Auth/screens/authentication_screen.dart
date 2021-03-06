import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:woski_garnek/Auth/screens/verify_phone_number_screen.dart';

import '../utils/helpers.dart';

class AuthenticationScreen extends StatefulWidget {
  static const id = 'AuthenticationScreen';

  const AuthenticationScreen({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  String? phoneNumber;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Wpisz numer telefonu, aby potwierdzić rezerwację",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Form(

                  key: _formKey,
                  child: IntlPhoneField(
                    autofocus: false,
                    invalidNumberMessage: 'Niepoprawny numer telefonu!!',
                    textAlignVertical: TextAlignVertical.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                    onChanged: (phone) => phoneNumber = phone.completeNumber,
                    initialCountryCode: 'PL',
                    flagsButtonPadding: const EdgeInsets.only(right: 10),
                    showDropdownIcon: false,
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: const Text(
                    'Zarezerwuj',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (isNullOrBlank(phoneNumber) ||
                        !_formKey.currentState!.validate()) {
                      showSnackBar('Wpisz poprawny numer telefonu!');
                    } else {
                      Navigator.pushNamed(
                        context,
                        VerifyPhoneNumberScreen.id,
                        arguments: phoneNumber,
                      );
                    }
                  },
                ),
                margin: const EdgeInsets.only(top: 20.0),
              )
            ],
          );
  }
}
