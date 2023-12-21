import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNationalCode extends StatefulWidget {
  const PhoneNationalCode({super.key});

  @override
  State<PhoneNationalCode> createState() => _PhoneNationalCodeState();
}

class _PhoneNationalCodeState extends State<PhoneNationalCode> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Phone National Code"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Name...",
                  border: OutlineInputBorder(
                    borderSide: BorderSide()
                  )
                ),
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please input your name!";
                  }
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email...",
                  border: OutlineInputBorder(
                    borderSide: BorderSide()
                  )
                ),
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please input your email!";
                  } else if (!GetUtils.isEmail(value!)) {
                    return "Your email is invalid!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              IntlPhoneField(
                focusNode: focusNode,
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: "Phone Number...",
                  border: OutlineInputBorder(
                    borderSide: BorderSide()
                  )
                ),
                languageCode: "KH",
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
                onCountryChanged: (country) {
                  print("Country changed to: " + country.name);
                },
                validator: (value) {
                  if (value == null) {
                    return "Please input your phone number!";
                  }
                },
              ),
              SizedBox(height: 10,),
              MaterialButton(
                child: Text("Submit"),
                onPressed: () {
                  _formKey.currentState?.validate();
                },
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
