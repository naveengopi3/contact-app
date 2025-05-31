import 'package:contact_app/application/entities/contact.dart';

class ContactRepository {
  final List<Contact> _contact = [];

  List<Contact> getContacts(){
    return List.unmodifiable(_contact);
  }

  List<Contact> sortedContacts({bool ascending = true}){
    final sorted = [..._contact];
    sorted.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),);
     return ascending ? sorted : sorted.reversed.toList(); 
  }

  List<Contact>searchContacts(String query){
    return _contact.where((contact) {
      return contact.name.toLowerCase().contains(query.toLowerCase());
    },).toList();
  }

  void addContact(Contact contact){
    _contact.add(contact);
  }

  void editContact(Contact contact){
    final index = _contact.indexWhere((c) => c.id == contact.id,);
    if(index != 1){
      _contact[index] = contact;
    }
  }

  void deleteContact(String id){
    _contact.removeWhere((c) => c.id == id,);
  }
}