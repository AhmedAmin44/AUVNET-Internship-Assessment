# 🚀 AUVNET Internship Assessment

This project is a fully structured Flutter application developed for AUVNET's internship assessment. It's not just a UI showcase—it's built with a solid architectural foundation and real-world production patterns in mind.

---

## 🧱 Project Structure

The app follows **Clean Architecture** principles, ensuring scalability, modularity, and testability.

* **Domain Layer** – Holds business logic, entities, repositories, and use cases.
* **Data Layer** – Responsible for fetching and caching data (Firebase + Hive).
* **Presentation Layer** – Powered by `flutter_bloc` for reactive state management.
* **Core** – Handles shared logic like error models, network info, and service locators.

---

## 🧠 State Management

We use the **Bloc pattern (flutter\_bloc)** throughout the app to separate UI from business logic. Every feature is encapsulated in its own bloc, with clear state transitions and event handling.

---

## 🔥 Firebase Integration

Authentication is managed with **FirebaseAuth**, supporting:

* Email/password login & signup
* Email verification
  
 uses **Cloud Firestore** to store and retrieve structured data (e.g. services, categories, restaurants).
* Data is fetched as collections (e.g. /services, /categories)
* Firestore snapshots are mapped into typed model classes
**HomeRemoteDataSource** is responsible for retrieving Firestore data and transforming it into usable domain entities
  
All logic is abstracted via use cases and repositories to align with Clean Architecture.

---

## 💾 Local Caching with Hive

To enhance offline support and app performance, we use **Hive** as a lightweight NoSQL database. Upon first successful fetch from Firebase, data is cached locally. If internet is unavailable or data hasn't changed, the app loads it directly from Hive—providing fast, efficient user experience.

---

## 🌐 Smart Internet Handling

The app uses `data_connection_checker_tv` to check real-time connectivity. Before any remote fetch:

* If the internet is **connected**, it fetches from Firebase, caches to Hive.
* If the internet is **disconnected**, it gracefully falls back to the latest cached Hive data.

---

## ❌ Error Handling

Custom error models and exceptions are built into every use case and repository. Each layer (repository, remote/local sources) handles errors distinctly:

* Firebase errors are mapped to user-friendly messages
* Network issues like timeouts or no connection are caught early
* Bloc emits clean error states to the UI, so users get meaningful feedback—not crashes

---

## ✨ UI & Responsiveness

The UI is completely responsive using `flutter_screenutil` and `MediaQuery`, ensuring it looks good across all device sizes. Widgets are broken into clean components to keep screens maintainable and testable.

---

## 📦 Features Implemented

* 🔐 Auth: Sign up, login, email verification
* 🧠 Clean Bloc architecture
* 🔥 Firebase integration
* 📡 Internet-aware data layer (connectivity checks)
* 💾 Hive offline support
* 🧊 Service locator with GetIt
* 🪓 Custom exception & failure classes
* 📲 Responsive and reusable widget design
