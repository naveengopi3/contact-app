# contact_app

Flutter Contact App (Interview Assignment)

This is a simple yet complete Contact Management App built using **Flutter** and **BLoC** for state management. The app demonstrates clean architecture and core Flutter concepts including forms, navigation, validation, and dynamic UI updates.

## Project Setup

1. **Clone the repository**
   ```bash
  - git clone https://github.com/naveengopi3/contact-app.git
  - cd contact_app

2.**Install dependencies**
  -flutter pub get
  
3.**Run the app**
   -flutter run

## Features Implemented

**Core Functionality**
- Add new contact (with validation)
- Edit existing contact
- Delete contact
- View all contacts in a list
- Sort contacts A–Z, Z–A, or Reset

**UI & Architecture**
- Responsive layout with StatelessWidgets
- Clean architecture (presentation, application, data layers)
- Custom text fields and buttons

**BLoC State Management**
- flutter_bloc to manage contact list and events
- Events: Add, Edit, Delete, Sort, Reset, Load
- Reactive UI with BlocBuilder

## Known Limitations
- Contacts are stored in memory only (cleared on restart)
- No persistent database or API used

## Author
Naveen G
Self-taught Flutter Developer
