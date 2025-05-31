import 'package:bloc/bloc.dart';
import 'package:contact_app/application/entities/contact.dart';
import 'package:contact_app/data/repositories/contact_repository.dart';
import 'package:meta/meta.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository repository;
  ContactBloc(this.repository) : super(ContactState()) {
   on<LoadContacts>((event, emit) {
      final contacts = repository.getContacts();
      emit(state.copyWith(contacts: contacts));
    });

      on<AddContact>((event, emit) {
      repository.addContact(event.contact);
      add(LoadContacts());
    });

      on<UpdateContact>((event, emit) {
      repository.editContact(event.contact);
      add(LoadContacts());
    });

     on<DeleteContact>((event, emit) {
      repository.deleteContact(event.id);
      add(LoadContacts());
    });

    on<SortContacts>((event, emit) {
      final sorted = repository.sortedContacts(ascending: event.ascending);
      emit(state.copyWith(contacts: sorted));
    });

    on<ResetContacts>((event, emit) {
      final contacts = repository.getContacts();
      emit(state.copyWith(contacts: contacts));
    });
  }
}
