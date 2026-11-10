// Name: Bigcas Paul Sander B.
// Student ID: 424005636
// Section: BSIT 3.8

import 'dart:io';

// Mixin
mixin Printable {
  void printDate() {
    print("Date: ${DateTime.now()}");
  }
}

// Abstract Class
abstract class Record with Printable {
  String id;
  String name;

  Record(this.id, this.name);

  void display();
}

// Learning Resource Class
class LearningResource extends Record {
  String category;
  int copies;

  LearningResource(
      String id,
      String name,
      this.category,
      this.copies)
      : super(id, name);

  @override
  void display() {
    print("Resource ID: $id");
    print("Title: $name");
    print("Category: $category");
    print("Copies Available: $copies");
    printDate();
  }
}

// Participant Class
class Participant extends Record {
  String email;

  Participant(
      String id,
      String name,
      this.email)
      : super(id, name);

  @override
  void display() {
    print("Participant ID: $id");
    print("Name: $name");
    print("Email: $email");
    printDate();
  }
}

void main() {
  List<Record> records = [];

  while (true) {
    print("\n=== COMMUNITY LEARNING CENTER ===");
    print("1. Add Resource");
    print("2. Add Participant");
    print("3. View Records");
    print("4. Borrow Resource");
    print("5. Exit");

    stdout.write("Enter Choice: ");
    int choice = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

    switch (choice) {
      case 1:
        stdout.write("Resource ID: ");
        String id = stdin.readLineSync()!;

        stdout.write("Title: ");
        String title = stdin.readLineSync()!;

        stdout.write("Category: ");
        String category = stdin.readLineSync()!;

        stdout.write("Copies: ");
        int copies = int.parse(stdin.readLineSync()!);

        records.add(
          LearningResource(id, title, category, copies),
        );

        print("Resource Added Successfully!");
        break;

      case 2:
        stdout.write("Participant ID: ");
        String id = stdin.readLineSync()!;

        stdout.write("Name: ");
        String name = stdin.readLineSync()!;

        stdout.write("Email: ");
        String email = stdin.readLineSync()!;

        records.add(
          Participant(id, name, email),
        );

        print("Participant Registered!");
        break;

      case 3:
        if (records.isEmpty) {
          print("No records found.");
        } else {
          print("\n=== ALL RECORDS ===");
          for (var record in records) {
            record.display(); // Polymorphism
            print("-------------------");
          }
        }
        break;

      case 4:
        stdout.write("Enter Resource ID to Borrow: ");
        String resourceId = stdin.readLineSync()!;

        bool found = false;

        for (var record in records) {
          if (record is LearningResource &&
              record.id == resourceId) {
            found = true;

            if (record.copies > 0) {
              record.copies--;
              print("Borrow Successful!");
              print(
                  "Remaining Copies: ${record.copies}");
            } else {
              print("No copies available.");
            }
          }
        }

        if (!found) {
          print("Resource not found.");
        }
        break;

      case 5:
        print("Thank you for using the system!");
        return;

      default:
        print("Invalid choice.");
    }
  }
}


