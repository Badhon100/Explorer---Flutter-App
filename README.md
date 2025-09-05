# 📱 GitHub Repository Explorer - Flutter App

A Flutter application that allows users to explore public GitHub repositories.  
The app integrates with GitHub’s REST API, supports offline caching, and follows **Clean Architecture** with **SOLID principles**.

---

## 🚀 Features

### 🔧 Core Features
- Fetch public repositories from GitHub with keyword search.
- Sort results by **stars (descending)**.
- Pagination with 20 results per page.
- Search repositories by tag (e.g., `flutter`, `swiftui`).
- Repository details view with:
  - Full repo name
  - Description
  - Star & fork count
  - Owner avatar
  - Open in GitHub (browser).

### 📲 UI Features
- Skeleton loaders while fetching data.
- Infinite scrolling / Load more pagination.
- Offline support with cached data.
- Offline banner indication.
- Search bar with **debounced input**.
- Dark/Light mode toggle.

### ⚙️ Technical Features
- **Clean Architecture** (Data, Domain, Presentation layers).
- Repository pattern for data access.
- Dependency Injection using `get_it`.
- State Management with **Bloc**.
- Offline caching (e.g., Hive/SharedPreferences).
- Error handling with **Snackbars/Toasts** and retry logic.

### ✅ Bonus Features Implemented
- **Pull to Refresh** on repository list.
- Unit test coverage for use cases and business logic.
- Modular folder structure for scalability.

---

## 🏗️ Architecture Overview

The project follows **Clean Architecture**:

lib/
┣ core/ # Common utilities, themes, widgets
┣ features/
┃ ┗ home/
┃ ┣ data/ # Remote + Local data sources, DTOs, models
┃ ┣ domain/ # Entities, Repository interfaces, UseCases
┃ ┣ presentation/ # Bloc, Pages, Widgets
┣ main.dart # App entry point, DI setup

yaml

- **Data Layer**: Responsible for API calls and local caching.  
- **Domain Layer**: Contains business logic (use cases, entities).  
- **Presentation Layer**: Handles state management (Bloc) and UI.  

This separation ensures **testability, scalability, and maintainability**.

---

## 🛠️ Setup Instructions

1. Clone the repository:
   ```
   git clone https://github.com/Badhon100/Explorer---Flutter-App.git
Install dependencies:

```
flutter pub get


Run the app:


```
flutter run

📦 Dependencies
flutter_bloc – State management

equatable – Value equality

dio – Network requests

connectivity_plus – Connectivity checking

shared_preferences – Offline caching

get_it – Dependency injection

cached_network_image – Efficient image caching

flutter_test / bloc_test / mocktail – Unit and bloc testing

🔔 Error Handling
Snackbars shown for errors instead of breaking UI.

Cached data shown if API fails.

Retry mechanism on network recovery.

📄 Assumptions & Limitations
GitHub API rate limits may affect frequent queries (60 req/hour without token).

Only repository search is implemented (not users/issues).

Offline caching currently supports repository lists (not pagination beyond cached set).

✅ Implemented Bonus Features
Pull to Refresh

Unit Testing for BLoC & UseCases

Modular folder structure

Dark/Light Mode support

👨‍💻 Author
Developed by Nahiduzzaman Badhon.