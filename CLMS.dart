// Name: Bigcas Paul Sander B.
// Student ID: 424005636
// Section: BSIT 3.8

import 'dart:io';

// Mixin for timestamping and printable details
mixin PrintableDetails {
  String getTimestamp() {
    return DateTime.now().toIso8601String();
  }

  void printDetails() {
    print('Generated at: ${getTimestamp()}');
  }
}

// Abstract Parent Class
abstract class CenterRecord with PrintableDetails {
  String _id;
  String _name;

  CenterRecord(this._id, this._name);

  String get id => _id;
  set id(String value) => _id = value;

  String get name => _name;
  set name(String value) => _name = value;

  void displayInfo();
}

// Subclass 1: LearningResource
class LearningResource extends CenterRecord {
  String _category;
  int _availableCopies;

  LearningResource(String id, String name, this._category, this._availableCopies)
      : super(id, name);

  String get category => _category;
  set category(String value) => _category = value;

  int get availableCopies => _availableCopies;
  set availableCopies(int value) {
    if (value >= 0) _availableCopies = value;
  }

  @override
  void displayInfo() {
    print('Resource ID: $id | Title: $name | Category: $category | Copies: $availableCopies');
    printDetails();
  }
}

// Subclass 2: Participant
class Participant extends CenterRecord {
  String _email;
  String _enrolledCourse;

  Participant(String id, String name, this._email, this._enrolledCourse)
      : super(id, name);

  String get email => _email;
  set email(String value) => _email = value;

  String get enrolledCourse => _enrolledCourse;
  set enrolledCourse(String value) => _enrolledCourse = value;

  @override
  void displayInfo() {
    print('Participant ID: $id | Name: $name | Email: $email | Course: $enrolledCourse');
    printDetails();
  }
}

void main() {
  List<CenterRecord> records = [];
  Map<String, int> transactionLogs = {};

  bool running = true;

  while (running) {
    print('\n==================================================');
    print('   COMMUNITY LEARNING CENTER MANAGEMENT SYSTEM');
    print('   Developer: Bigcas Paul Sander B. (424005636)');
    print('==================================================');
    print('1. Add Learning Resource');
    print('2. Register Participant');
    print('3. View All Records (Polymorphism)');
    print('4. Process Resource Borrow Transaction');
    print('5. Exit');
    stdout.write('Enter your choice (1-5): ');

    String? input = stdin.readLineSync();
    try {
      int choice = int.parse(input ?? '0');

      switch (choice) {
        case 1:
          stdout.write('Enter Resource ID: ');
          String resId = stdin.readLineSync() ?? '';
          stdout.write('Enter Resource Name: ');
          String resName = stdin.readLineSync() ?? '';
          stdout.write('Enter Category: ');
          String category = stdin.readLineSync() ?? '';
          stdout.write('Enter Available Copies: ');
          int copies = int.parse(stdin.readLineSync() ?? '0');

          records.add(LearningResource(resId, resName, category, copies));
          print('Successfully added learning resource!');
          break;

        case 2:
          stdout.write('Enter Participant ID: ');
          String partId = stdin.readLineSync() ?? '';
          stdout.write('Enter Participant Name: ');
          String partName = stdin.readLineSync() ?? '';
          stdout.write('Enter Email: ');
          String email = stdin.readLineSync() ?? '';
          stdout.write('Enter Enrolled Course: ');
          String course = stdin.readLineSync() ?? '';

          records.add(Participant(partId, partName, email, course));
          print('Successfully registered participant!');
          break;

        case 3:
          if (records.isEmpty) {
            print('No records found in the system.');
          } else {
            print('\n--- ALL CENTER RECORDS ---');
            // Demonstrating polymorphism via shared parent type CenterRecord
            for (var record in records) {
              record.displayInfo();
              print('--------------------------');
            }
          }
          break;

        case 4:
          stdout.write('Enter Resource ID to borrow: ');
          String targetId = stdin.readLineSync() ?? '';
          bool found = false;

          for (var record in records) {
            if (record is LearningResource && record.id == targetId) {
              found = true;
              if (record.availableCopies > 0) {
                record.availableCopies -= 1;
                transactionLogs[targetId] = (transactionLogs[targetId] ?? 0) + 1;
                print('Borrow successful! Remaining copies: ${record.availableCopies}');
              } else {
                print('Error: No copies available for this resource.');
              }
            }
          }
          if (!found) {
            print('Error: Learning resource with ID "$targetId" not found.');
          }
          break;

        case 5:
          running = false;
          print('Exiting application. Thank you!');
          break;

        default:
          print('Invalid choice. Please enter a number between 1 and 5.');
      }
    } catch (e) {
      print('Error: Invalid input format detected. Please try again.');
    }
  }
}

