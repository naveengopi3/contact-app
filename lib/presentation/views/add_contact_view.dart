import 'package:contact_app/application/entities/contact.dart';
import 'package:contact_app/core/constant/app_colors.dart';
import 'package:contact_app/core/utils/validator.dart';
import 'package:contact_app/presentation/bloc/contact/contact_bloc.dart';
import 'package:contact_app/presentation/widgets/custom_elevated_button.dart';
import 'package:contact_app/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class AddContactView extends StatelessWidget {
  AddContactView({super.key});

  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _validator = Validator();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentOrange,
        title: Text("Add", style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormFields(
                controller: _nameController,
                hintText: "Name",
                validator: _validator.validateName,
              ),
              SizedBox(height: screenHeight * 0.03),
              CustomTextFormFields(
                controller: _phoneNumberController,
                hintText: "Phone Number",
                keyboardType: TextInputType.phone,
                validator: _validator.validatePhone,
              ),
              SizedBox(height: screenHeight * 0.03),
              CustomElevatedButton(
                text: "Add",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final contact = Contact(
                      id: const Uuid().v4(),
                      name: _nameController.text.trim(),
                      phoneNumber: _phoneNumberController.text.trim(),
                    );

                    context.read<ContactBloc>().add(AddContact(contact));
                    Navigator.pop(context);
                  }
                },
                height: 55,
                width: double.infinity,
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: AppColors.accentOrange,
                  foregroundColor: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
