# front_end_padelapp

A new Flutter project.

# Google Maps
## Dependencies
- google_maps_flutter
- geolocator
## ApiKey
- https://console.cloud.google.com/
### IOS
- ios/Runner/AppDelegate.swift
```
import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyABG3I7QtxODtnBvT-94XLGkxm9zqhftMI")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
```
### ANDROID
- android/app/build.gradle
```
minSdkVersion 20
compileSdkVersion 34
```

- android/app/src/main/AndroidManifest.xml
```
 <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="AIzaSyABG3I7QtxODtnBvT-94XLGkxm9zqhftMI"/>
```

### Service
- LocationService