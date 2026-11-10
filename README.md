# Community-Learning-Management-System

# Community Learning Center Management System 

A command-line console application written in **Dart** that demonstrates core Object-Oriented Programming (OOP) concepts such as inheritance, abstract classes, mixins, polymorphism, and type checking.

---

##  Features

- **Add Learning Resources**: Register new books, tools, or learning materials with tracking for available copies.
- **Register Participants**: Add participants/users to the system with their IDs, names, and emails.
- **View All Records**: Display details of all added resources and participants using **polymorphism**.
- **Borrow Resources**: Check out resources by ID, automatically decrementing available copies with validation for out-of-stock items.
- **Reusable Mixins**: Automatically append timestamps to record displays using a Dart mixin.

---

##  Concepts & Principles Demonstrated

- **Abstract Classes**: `Record` serves as a blueprint containing shared properties (`id`, `name`) and an abstract `display()` method.
- **Inheritance**: `LearningResource` and `Participant` extend `Record` to reuse common structure and specialize behavior.
- **Mixins**: `Printable` is mixed into `Record` using the `with` keyword to inject date-printing functionality.
- **Polymorphism**: The app iterates through a list of type `Record` and invokes `.display()`, executing the correct overridden method dynamically.
- **Type Checking**: Uses the `is` keyword (`record is LearningResource`) to safely filter and cast types during search/borrow operations.

---

##  Getting Started

### Prerequisites

Make sure you have the [Dart SDK](https://dart.dev/get-dart) installed on your machine.

You can verify your installation by running:
```bash
dart --version
