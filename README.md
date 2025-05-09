# Mini Service Booking

Flutter-based mobile application built with GetX for state management, designed to simplify service discovery and booking. Features include a user-friendly interface, reactive service filtering (by category, price, and rating), and a mock API backend for CRUD operations. The app showcases clean architecture, responsive design, and reusable widgets, making it a great example for learning Flutter and GetX.

- Download the [APK](https://github.com/abel3ri/Mini-Service-Booking/releases/download/v1.0/Mini_Service_Booking.apk)
- Tech Stack: Flutter, GetX, MockAPI
- Key Features: Service browsing, filtering, reactive UI
- GitHub: https://github.com/abel3ri/Mini-Service-Booking

## Getting Started

### Prerequisites

- Flutter SDK installed ([installation guide](https://docs.flutter.dev/get-started/install)).
- Compatible IDE (e.g., [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)).

### Installation

1. Clone the repository:
   ```bash
   git clone git@github.com:abel3ri/Mini-Service-Booking.git
   cd Mini-Service-Booking
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Folder Structure
- [getx_pattern](https://github.com/kauemurakami/getx_pattern)
```
mini_service_booking
lib/
├── app/                  # Application-specific components
│   ├── data/             # Data layer
│   │   ├── models/       # Data models (e.g., ServiceModel)
│   │   └── services/     # API and backend services (e.g., ServiceService)
│   ├── modules/          # Feature modules (UI, logic)
│   └── routes/           # App navigation routes
├── core/                 # Shared resources
│   ├── controllers/      # Shared controllers
│   ├── l10n/             # Localization resources
│   ├── services/         # Core services (e.g., navigation, storage)
│   ├── utils/            # Utility classes and helpers (e.g., Dimensions)
│   └── widgets/          # Reusable widgets (e.g., RInputField, RMainButton)
└── main.dart             # Entry point of the application
```

## Screenshots
- Intuitive and Modern-Looking UI with Dark Mode Support
<img src="https://github.com/user-attachments/assets/1813462e-3f31-44ab-b11f-c85a980a930f" alt="Screenshot 2" width="250">
<img src="https://github.com/user-attachments/assets/f37c6c80-3353-4e3f-b8a8-3f0a886c21e0" alt="Screenshot 1" width="250">
<img src="https://github.com/user-attachments/assets/cc2d9f5b-b434-48cd-a4c3-61a774a6b869" alt="Screenshot 3" width="250">

- Multilingual (English and Amharic)
<img src="https://github.com/user-attachments/assets/66c8e408-bffc-4702-8c7e-dcab0f4896ef" alt="Screenshot 2" width="250">
<img src="https://github.com/user-attachments/assets/6df9143b-89a1-4f53-83a6-0c39f072b538" alt="Screenshot 1" width="250">
<img src="https://github.com/user-attachments/assets/71ce486e-7105-4c01-8d1b-b236930bcf91" alt="Screenshot 3" width="250">

- Searching and Filtering
<img src="https://github.com/user-attachments/assets/dd3fa052-abde-41c7-83a6-3dd4395610ab" alt="Screenshot 2" width="250">
<img src="https://github.com/user-attachments/assets/8a3addaf-e2ee-483d-9713-2ab74d797377" alt="Screenshot 1" width="250">


## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes with clear descriptions.
4. Push to your fork and create a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions or feedback, feel free to reach out:

- GitHub: [@abel3ri](https://github.com/abel3ri)
- Email: [abelmerete22@gmail.com](mailto:abelmerete22@gmail.com)
