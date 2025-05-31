import 'package:contact_app/core/constant/app_colors.dart';
import 'package:contact_app/data/repositories/contact_repository.dart';
import 'package:contact_app/presentation/bloc/contact/contact_bloc.dart';
import 'package:contact_app/presentation/views/add_contact_view.dart';
import 'package:contact_app/presentation/views/contact_edit_view.dart';
import 'package:contact_app/presentation/views/search_contact_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SortOption { aToZ, zToA, reset }

class HomeView extends StatelessWidget {
  final ContactRepository repository;
  const HomeView({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final contactBloc = context.read<ContactBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accentOrange,
        title: Text(
          "Contacts",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      SearchContactView(repository: repository),
                ),
              );
              contactBloc.add(LoadContacts());
            },
            icon: Icon(Icons.search, color: AppColors.black, size: 30),
          ),
          PopupMenuButton<SortOption>(
            color: AppColors.white,
            icon: Icon(Icons.sort, color: AppColors.black, size: 30),
            onSelected: (value) {
              switch (value) {
                case SortOption.aToZ:
                  contactBloc.add(SortContacts(true));
                  break;
                case SortOption.zToA:
                  contactBloc.add(SortContacts(false));
                  break;
                case SortOption.reset:
                  contactBloc.add(ResetContacts());
                  break;
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: SortOption.aToZ, child: Text('Sort A-Z')),
              PopupMenuItem(value: SortOption.zToA, child: Text('Sort Z-A')),
              PopupMenuItem(value: SortOption.reset, child: Text('Reset')),
            ],
          ),
        ],
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          final contacts = state.contacts;

          if (contacts.isEmpty) {
            return const Center(child: Text("No contacts yet"));
          }
          return ListView.separated(
            separatorBuilder: (context, index) =>
                SizedBox(height: screenHeight * 0.02),
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              final contact = contacts[index];
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContactEditView(contact: contact),
                    ),
                  );
                },
                leading: CircleAvatar(
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
                    contactBloc.add(DeleteContact(contact.id));
                  },
                  icon: Icon(Icons.delete, color: AppColors.red, size: 30),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddContactView()));
        },
        backgroundColor: AppColors.accentOrange,
        shape: CircleBorder(),
        elevation: 5,
        child: Icon(Icons.add),
      ),
    );
  }
}
