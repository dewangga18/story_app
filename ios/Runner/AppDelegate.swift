import UIKit
import Flutter
import GoogleMaps  

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyArinIQmH2Fpv76Uwtln4UyPI4x4MKso4M")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
