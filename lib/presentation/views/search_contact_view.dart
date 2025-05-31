import 'package:contact_app/presentation/views/contact_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/application/entities/contact.dart';
import 'package:contact_app/core/constant/app_colors.dart';
import 'package:contact_app/data/repositories/contact_repository.dart';

class SearchContactView extends StatefulWidget {
  final ContactRepository repository;

  const SearchContactView({super.key, required this.repository});

  @override
  State<SearchContactView> createState() => _SearchContactViewState();
}

class _SearchContactViewState extends State<SearchContactView> {
  final _searchController = TextEditingController();
  List<Contact> _filteredContacts = [];

  @override
  void initState() {
    super.initState();
    _filteredContacts = widget.repository.getContacts();
  }

  void _filterContacts(String query) {
    final allContacts = widget.repository.getContacts();
    final filtered = allContacts.where((contact) {
      return contact.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      _filteredContacts = filtered;
    });
  }

  void _deleteContact(String id) {
    widget.repository.deleteContact(id);
    _filterContacts(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentOrange,
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search contacts',
            border: InputBorder.none,
          ),
          onChanged: _filterContacts,
        ),
      ),
      body: _filteredContacts.isEmpty
          ? const Center(child: Text('No contacts found'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredContacts.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final contact = _filteredContacts[index];
                return ListTile(
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ContactEditView(
                          contact: contact,
      
                        ),
                      ),
                    );
                  },
                  leading: const CircleAvatar(
                    maxRadius: 30,
                    backgroundImage: AssetImage("assets/img/user.png"),
                  ),
                  title: Text(
                    contact.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    contact.phoneNumber,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      _deleteContact(contact.id);
                    },
                    icon: Icon(Icons.delete, color: AppColors.red, size: 30),
                  ),
                );
              },
            ),
    );
  }
}
