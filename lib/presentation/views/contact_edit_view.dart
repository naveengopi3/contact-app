import 'package:contact_app/application/entities/contact.dart';
import 'package:contact_app/core/constant/app_colors.dart';
import 'package:contact_app/presentation/bloc/contact/contact_bloc.dart';
import 'package:contact_app/presentation/widgets/custom_elevated_button.dart';
import 'package:contact_app/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactEditView extends StatefulWidget {
  final Contact contact;
  const ContactEditView({super.key, required this.contact});

  @override
  State<ContactEditView> createState() => _ContactEditViewState();
}

class _ContactEditViewState extends State<ContactEditView> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.contact.name);
    _phoneController = TextEditingController(text: widget.contact.phoneNumber);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentOrange,
        title: Text("Edit", style: TextStyle(fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormFields(
                controller: _nameController,
                hintText: "Name",
              ),
              SizedBox(height: screenHeight * 0.03),
              CustomTextFormFields(
                controller: _phoneController,
                hintText: "Phone Number",
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: screenHeight * 0.03),
              CustomElevatedButton(
                text: "Save",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final updated = Contact(
                      id: widget.contact.id,
                      name: _nameController.text.trim(),
                      phoneNumber: _phoneController.text.trim(),
                    );
                    Navigator.pop(context);
                    context.read<ContactBloc>().add(UpdateContact(updated));
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
