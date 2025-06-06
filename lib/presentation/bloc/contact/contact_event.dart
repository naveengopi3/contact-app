part of 'contact_bloc.dart';

@immutable
sealed class ContactEvent {}

class LoadContacts extends ContactEvent {}

class AddContact extends ContactEvent {
  final Contact contact;
  AddContact(this.contact);
}

class UpdateContact extends ContactEvent {
  final Contact contact;
  UpdateContact(this.contact);
}

class DeleteContact extends ContactEvent {
  final String id;
  DeleteContact(this.id);
}


class SortContacts extends ContactEvent {
  final bool ascending;
  SortContacts(this.ascending);
}

class ResetContacts extends ContactEvent {}