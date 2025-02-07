# Weather App

A new Flutter project.

## Assignment Overview
This Weather App is built using **Flutter & Dart**. 
It allows users to **enter a city name**, fetch its **latitude & longitude** using Geolocator
and retrieve real-time **weather data** such as **temperature and description** from the 
OpenWeather API (https://www.api-ninjas.com/api/).

## Features
- **Search Weather by City**: Enter a city name, and get latitude/longitude using Geolocator.
- **Fetch Real-Time Weather**: Retrieves current temperature.
- **Weather Description**: Displays a friendly description based on temperature.
- **Platform Support**: Works on both **Android & iOS**.

---

## Getting Started

### **Clean the Project**

Before running, make sure to clean any previous build:
```sh
flutter clean
```

### **Get Required Dependencies**

Ensure all required packages are installed by running:
```sh
flutter pub get
```

---

## Running the App on Different Environments

### ✅ Run on **Android**
```sh
flutter run --no-sound-null-safety
```

If multiple devices are connected, specify the device:
```sh
flutter run -d emulator-5554  # Example for Android Emulator
```

### Run on **iOS**

```sh
flutter run -d ios
```

For running on a real iOS device:
1. Open **ios/** folder in Xcode.
2. Set up provisioning profile.
3. Run:

   ```sh
   flutter run --release
   ```

---

## Additional Notes
- **Change App Name & Logo**: If you want to update the app name and logo, follow these:
    - Use `flutter_launcher_icons` for icons
    - Edit `pubspec.yaml` and run:
  
      ```sh
      flutter pub run flutter_launcher_icons:main
      ```
      
    - For app name changes, update `android/app/src/main/AndroidManifest.xml` and `ios/Runner/Info.plist`.

- **Check Internet Connection**: The app automatically detects network issues and displays an error screen 
- if offline.

---

## License
This project is open-source and free to use.

---

**Now you’re all set! Run the app and check the weather of any city worldwide!**


