part of 'contact_bloc.dart';


 class ContactState {
  final List<Contact> contacts;

  const ContactState({this.contacts = const []});

  ContactState copyWith({List<Contact>? contacts}) {
    return ContactState(contacts: contacts ?? this.contacts);
  }
 }
