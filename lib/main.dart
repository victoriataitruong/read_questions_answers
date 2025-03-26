import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Read Questions & Answers',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ReadQA(),
    );
  }
}

class ReadQA extends StatefulWidget {
  const ReadQA({super.key});

  @override
  ReadQAState createState() => ReadQAState();
}

class ReadQAState extends State<ReadQA> {
  final FlutterTts flutterTts = FlutterTts();
  bool isReading = false;

  final List<Map<String, String>> qaList = [
    {
      'question': '1. What is Flutter?',
      'answer':
          'Flutter is an open-source UI software development kit created by Google.',
    },
    {
      'question': '2. What is Dart?',
      'answer':
          'Dart is a programming language designed for client-side development for mobile and web apps.',
    },
    {
      'question': '3. What is a widget?',
      'answer':
          'In Flutter, a widget is a basic building block of the user interface, representing a UI element such as a button, text, or layout structure. Widgets are either stateful (can change over time) or stateless (remain fixed), and they can be combined to create complex UIs.',
    },
    {
      'question': '4. What is the concept of class in Flutter?',
      'answer':
          'In Flutter, a class is a blueprint for creating objects (instances), defining attributes and methods.',
    },
    {
      'question':
          '5. What is the difference between Stateless Widgets and Stateful Widgets?',
      'answer':
          'Stateless widgets do not have mutable state and do not change over time, while Stateful widgets have mutable state and can be updated during the app’s lifecycle.',
    },
    {
      'question':
          '6. What is the difference between GetX, BLoC, and Provider? Which one do you prefer and why?',
      'answer':
          'GetX is a simple and powerful state management solution, BLoC is based on streams and provides a more reactive programming model, and Provider is a simpler solution that uses InheritedWidget for state management. The choice depends on the app’s complexity and needs.',
    },
    {
      'question':
          '7. What is the difference between unit, widget, and integration tests in Flutter?',
      'answer':
          'Unit tests focus on testing individual functions or methods, widget tests verify the UI components, and integration tests check how all the components work together.',
    },
    {
      'question': '8. How would you monitor errors in a Flutter application?',
      'answer':
          'To monitor errors in a Flutter app, you can use tools like Sentry, Firebase Crashlytics, or Bugsnag to automatically capture and report crashes and exceptions. Additionally, you can handle errors globally using FlutterError.onError, debug with dart:developer, and customize error handling with custom widgets for release builds.',
    },
    {
      'question':
          '9. What do you understand about the material and Cupertino aspects of Flutter design?',
      'answer':
          'Material design is a Google design system that provides a modern, consistent UI, while Cupertino provides iOS-styled UI components for creating apps that follow Apple’s design principles.',
    },
    {
      'question':
          '10. Before releasing an app to production, what steps would you consider to make sure the functionalities are working fine and optimized?',
      'answer':
          'I would perform thorough testing, check for performance optimizations, ensure proper error handling, run security audits, and verify that the app runs smoothly across devices.',
    },
    {
      'question': '11. Why does Flutter use Dart?',
      'answer':
          'It is used in Flutter for building fast and efficient applications.',
    },
    {
      'question':
          '12. What is the difference between hot restart and hot reload?',
      'answer':
          'Hot reload allows you to inject code changes into a running app, while hot restart fully reloads the app, including the app’s state.',
    },
    {
      'question': '13. Differentiate required and optional parameters in Dart.',
      'answer':
          'Required parameters are mandatory when calling a function, whereas optional parameters can be omitted when calling the function.',
    },
    {
      'question':
          '14. What are streams? What different types of streams does Flutter support?',
      'answer':
          'Streams represent asynchronous data flows in Dart. Flutter supports single-subscription streams and broadcast streams for handling multiple listeners.',
    },
    {
      'question': '15. What is the purpose of a single subscription stream?',
      'answer':
          'A single subscription stream allows only one listener at a time to receive data events, useful for handling a single source of data like a network request.',
    },
    {
      'question': '16. What are null-aware operations?',
      'answer':
          'Null-aware operations in Dart are used to handle nullable values, such as using the `?.` operator to avoid errors when a variable is null.',
    },
    {
      'question': '17. Why do we pass functions to a widget?',
      'answer':
          'Passing functions to widgets allows for interaction between parent and child widgets and facilitates dynamic behavior.',
    },
    {
      'question': '18. What is a Future in Flutter?',
      'answer':
          'A Future in Flutter represents a value that will be available at some point in the future, usually after an asynchronous operation.',
    },
    {
      'question':
          '19. What is the difference between Flutter SDK and Flutter framework?',
      'answer':
          'The Flutter SDK is the complete toolkit for developing Flutter apps, including all necessary tools and libraries. The Flutter framework is a part of the SDK that provides pre-built components and APIs for building the user interface and app behavior.',
    },
    {
      'question':
          '20. What is the difference between GetX, BLoC and Provider?',
      'answer':
          'GetX, BLoC, and Provider are all state management solutions in Flutter. They help manage the state of your application, which refers to the data or information that can change over time and affect how the UI is displayed. Provider is the go-to due to its simplicity and scalability. However, if working on something with complex logic or a long-term project, I’d prefer BLoC for its more structured approach. GetX would be my choice when speed and ease of development are the top priorities.',
    },
    {
      'question': '21. What is `Image` widget used for?',
      'answer':
          '`Image` is a widget used to display images in Flutter. You can load images from the network, assets, or file system.',
    },
    {
      'question': '22. What is `flutter pub get`?',
      'answer':
          '`flutter pub get` is a command used to fetch the dependencies listed in the `pubspec.yaml` file. It downloads and installs the packages required for your Flutter project.',
    },
    {
      'question': '23. What is the `Padding` widget used for?',
      'answer':
          '`Padding` is a widget used to apply padding around a widget. It allows you to create space between the child widget and its boundaries.',
    },
    {
      'question': '24. What is the `IconButton` widget?',
      'answer':
          '`IconButton` is a Flutter widget that allows you to create a button with an icon. It is commonly used for actions like navigation or settings.',
    },
    {
      'question': '25. What are `async` and `await` in Dart?',
      'answer':
          '`async` and `await` are used to work with asynchronous code in Dart. `async` marks a function as asynchronous, while `await` pauses execution until a future completes.',
    },
    {
      'question': '26. What is `Future` in Dart?',
      'answer':
          '`Future` is a class in Dart that represents a potential value or error that will be available at some point in the future. It is used for handling asynchronous operations.',
    },
    {
      'question': '27. How would you implement dark mode in Flutter?',
      'answer':
          'You can implement dark mode in Flutter by using `ThemeData` to define different themes for light and dark modes, and then toggling between them based on the user\'s preference.',
    },
    {
      'question': '28. What is the `Dart DevTools`?',
      'answer':
          '`Dart DevTools` is a suite of performance and debugging tools for Flutter and Dart applications. It provides features like widget inspection, debugging, performance tracking, and more.',
    },
    {
      'question': '29. How do you debug Flutter apps?',
      'answer':
          'You can debug Flutter apps using the built-in debugging tools in IDEs like VS Code or Android Studio. Flutter also provides the `flutter debug` command, and you can set breakpoints to inspect the code.',
    },
    {
      'question': '30. What is `flutter upgrade`?',
      'answer':
          '`flutter upgrade` is a command used to upgrade your Flutter SDK to the latest stable version, ensuring you have access to the latest features and fixes.',
    },
    {
      'question': '31. What is `StreamBuilder`?',
      'answer':
          '`StreamBuilder` is a widget that listens to a stream and rebuilds itself whenever the stream emits a new event. It is used to display real-time data in Flutter.',
    },
    {
      'question': '32. How do you handle errors in Flutter?',
      'answer':
          'Errors in Flutter can be handled using `try-catch` blocks for synchronous code and `Future.catchError` or `Stream.catchError` for asynchronous operations.',
    },
    {
      'question': '33. What is the purpose of a `Navigator` in Flutter?',
      'answer':
          'The `Navigator` is used for managing the app’s routes and allowing navigation between different screens or pages in a Flutter app.',
    },
    {
      'question': '34. What is `InheritedWidget`?',
      'answer':
          '`InheritedWidget` is a special widget in Flutter that allows data to be passed down the widget tree efficiently, enabling shared data across multiple widgets.',
    },
    {
      'question':
          '35. What are some best practices for performance optimization in Flutter?',
      'answer':
          'Some best practices include using `const` constructors for widgets, avoiding unnecessary rebuilds, minimizing the use of images with large sizes, and lazy loading data.',
    },
    {
      'question': '36. What is `flutter doctor`?',
      'answer':
          '`flutter doctor` is a command that checks your environment for any issues with Flutter installation and setup, including the dependencies and tools required.',
    },
    {
      'question': '37. How do you implement state management in Flutter?',
      'answer':
          'State management can be implemented in Flutter using solutions like Provider, Riverpod, GetX, or BLoC to manage and update the app’s state efficiently.',
    },
    {
      'question': '38. What is `SetState`?',
      'answer':
          '`setState` is a method in Flutter that tells the framework to re-render the widget by marking the widget as dirty and scheduling a rebuild.',
    },
    {
      'question':
          '39. What is the difference between `const` and `final` in Dart?',
      'answer':
          '`const` is used to define compile-time constants, while `final` is used to define variables whose value is set once but can be determined at runtime.',
    },
    {
      'question': '40. What is a `FutureBuilder`?',
      'answer':
          '`FutureBuilder` is a widget that builds itself based on the latest snapshot of interaction with a `Future`. It’s often used to display asynchronous data in a widget tree.',
    },
    {
      'question':
          '41. What is the difference between a `ListView` and a `GridView`?',
      'answer':
          'A `ListView` is a scrollable list of widgets arranged vertically, while a `GridView` arranges widgets in a 2D grid with rows and columns.',
    },
    {
      'question':
          '42. How can you optimize the performance of ListView or GridView?',
      'answer':
          'By using `ListView.builder` or `GridView.builder` to lazily load items, caching data, and minimizing widget rebuilds.',
    },
    {
      'question': '43. How do you handle dependencies in Flutter?',
      'answer':
          'Dependencies in Flutter are handled via the `pubspec.yaml` file, where packages are declared and managed using the `flutter pub get` command.',
    },
    {
      'question': '44. What is `flutter run` used for?',
      'answer':
          '`flutter run` is a command that builds and runs the Flutter application on the connected device or emulator.',
    },
    {
      'question': '45. How do you store data in Flutter?',
      'answer':
          'Data can be stored in Flutter using shared preferences, SQLite, Firebase, or other databases, depending on the app’s requirements.',
    },
    {
      'question': '46. What is a `BuildContext` in Flutter?',
      'answer':
          '`BuildContext` is an object that refers to the location of a widget in the widget tree. It is used to locate and interact with other widgets.',
    },
    {
      'question': '47. What is the `MaterialApp` widget?',
      'answer':
          '`MaterialApp` is the root widget of a Flutter application that provides many useful features such as routing, themes, and localization.',
    },
    {
      'question': '48. What is the `Navigator.push()` method?',
      'answer':
          'The `Navigator.push()` method is used to navigate to a new screen by pushing a new route onto the navigation stack.',
    },
    {
      'question': '49. What is the `Scaffold` widget?',
      'answer':
          '`Scaffold` is a layout structure in Flutter that provides the basic visual structure for implementing material design elements like app bars, drawers, and floating action buttons.',
    },
    {
      'question': '50. What are `InheritedWidget` and `Provider` used for?',
      'answer':
          '`InheritedWidget` is used for sharing data across widgets, while `Provider` is a higher-level solution that simplifies state management and data access.',
    },
    {
      'question': '51. What is `flutter clean`?',
      'answer':
          '`flutter clean` is a command that removes any temporary files and cached builds, allowing you to perform a fresh build of the project.',
    },
    {
      'question': '52. What is `flutter run --release`?',
      'answer':
          '`flutter run --release` is used to build and run the Flutter app in release mode, which is optimized for performance and disables debugging features.',
    },
    {
      'question': '53. What is the purpose of `flutter build apk`?',
      'answer':
          '`flutter build apk` compiles the Flutter app into a release APK file for Android, ready for distribution on the Google Play Store.',
    },
    {
      'question': '54. How do you test a widget in Flutter?',
      'answer':
          'You can test a widget using the `flutter_test` package to verify the widget’s behavior and appearance, including interactions like taps and input.',
    },
    {
      'question': '55. What are `const` constructors in Flutter?',
      'answer':
          'A `const` constructor is used to create compile-time constant objects, which can be more efficient by reducing runtime overhead.',
    },
    {
      'question': '56. What is the purpose of the `setState` function?',
      'answer':
          '`setState` is used to update the state of a widget and trigger a rebuild of the widget tree.',
    },
    {
      'question': '57. How do you implement infinite scrolling in Flutter?',
      'answer':
          'You can implement infinite scrolling using a `ListView` with a `ScrollController` to detect when the user reaches the end of the list and fetch more data.',
    },
    {
      'question': '58. What is `GestureDetector`?',
      'answer':
          '`GestureDetector` is a widget that allows you to detect user gestures, such as taps, drags, and swipes, and handle them accordingly.',
    },
    {
      'question': '59. What is a `GlobalKey`?',
      'answer':
          'A `GlobalKey` is used to uniquely identify and interact with a widget, even from outside the widget tree.',
    },
    {
      'question': '60. What is `flutter packages get`?',
      'answer':
          '`flutter packages get` is used to download the dependencies listed in the `pubspec.yaml` file.',
    },
    {
      'question': '61. How do you create custom widgets in Flutter?',
      'answer':
          'You create custom widgets by extending the `StatelessWidget` or `StatefulWidget` class and implementing the `build()` method.',
    },
    {
      'question': '62. How would you handle user authentication in Flutter?',
      'answer':
          'User authentication in Flutter can be handled using Firebase Auth, OAuth, or other third-party libraries for authentication and user management.',
    },
    {
      'question': '63. What is `flutter doctor` and how is it useful?',
      'answer':
          '`flutter doctor` checks your environment for missing dependencies and setup issues, ensuring that your development setup is ready to use Flutter.',
    },
    {
      'question': '64. How do you perform localization in Flutter?',
      'answer':
          'Localization can be performed using the `flutter_localizations` package, which allows you to translate app content into different languages.',
    },
    {
      'question':
          '65. What are `ElevatedButton`, `FlatButton`, and `TextButton`?',
      'answer':
          '`ElevatedButton` creates a raised button, `FlatButton` creates a flat button, and `TextButton` creates a simple text-based button.',
    },
    {
      'question': '66. What is `ValueListenableBuilder`?',
      'answer':
          '`ValueListenableBuilder` is a widget that listens to a `ValueListenable` and rebuilds itself whenever the value changes.',
    },
    {
      'question': '67. What are `MaterialPageRoute` and `CupertinoPageRoute`?',
      'answer':
          '`MaterialPageRoute` is used for material design-style navigation, while `CupertinoPageRoute` is used for iOS-style navigation in Flutter apps.',
    },
    {
      'question': '68. What are `async*` and `yield*` in Dart?',
      'answer':
          '`async*` creates an asynchronous generator function, and `yield*` is used to yield values from an asynchronous generator.',
    },
    {
      'question': '69. How do you test asynchronous code in Flutter?',
      'answer':
          'Asynchronous code can be tested in Flutter using `Future.delayed` or mock services to simulate asynchronous behavior.',
    },
    {
      'question': '70. What is `StreamController`?',
      'answer':
          '`StreamController` is used to create and manage streams in Dart, allowing you to add events to the stream and listen for data changes.',
    },
    {
      'question': '71. What is the purpose of the `SingleChildScrollView`?',
      'answer':
          'The `SingleChildScrollView` allows a single widget to scroll, which is useful when you have a large amount of content in a small space.',
    },
    {
      'question': '72. How do you manage memory in Flutter?',
      'answer':
          'Memory management in Flutter involves avoiding memory leaks by disposing of controllers, streams, and other resources when they are no longer needed.',
    },
    {
      'question': '73. How do you handle timeouts in Flutter?',
      'answer':
          'Timeouts in Flutter can be handled using `Future.delayed` or by setting timeout durations for network requests or other async operations.',
    },
    {
      'question': '74. How do you create animations in Flutter?',
      'answer':
          'Animations in Flutter can be created using the `AnimationController` and `Tween` classes, along with `AnimatedBuilder` for custom animations.',
    },
    {
      'question': '75. What are `Tween`, `Curve`, and `AnimationController`?',
      'answer':
          'A `Tween` defines the interpolation between two values, `Curve` determines the speed of the animation, and `AnimationController` controls the animation’s duration and status.',
    },
    {
      'question': '76. How do you set up CI/CD for Flutter?',
      'answer':
          'CI/CD for Flutter can be set up using services like GitHub Actions, GitLab CI, or Bitbucket Pipelines to automate testing, building, and deployment.',
    },
    {
      'question': '77. What is a `FutureBuilder`?',
      'answer':
          '`FutureBuilder` is a widget that builds itself based on the latest snapshot of interaction with a `Future`, often used for asynchronous data.',
    },
    {
      'question': '78. How do you implement push notifications in Flutter?',
      'answer':
          'Push notifications can be implemented in Flutter using Firebase Cloud Messaging (FCM) or other services to send notifications to the app.',
    },
    {
      'question': '79. What is the difference between `main()` and `runApp()`?',
      'answer':
          '`main()` is the entry point of the application, while `runApp()` initializes the app and runs the widget tree.',
    },
    {
      'question': '80. What is `Container` in Flutter?',
      'answer':
          '`Container` is a basic layout widget used to customize the appearance and position of other widgets by setting properties like width, height, padding, margin, and decoration.',
    },
    {
      'question': '81. How do you handle deep linking in Flutter?',
      'answer':
          'Deep linking can be handled using the `uni_links` package or Flutter’s built-in routing system to open specific app screens via URLs.',
    },
    {
      'question': '82. What is the `flutter_launcher_icons` package?',
      'answer':
          '`flutter_launcher_icons` is a package used to customize the app’s launcher icon for different platforms.',
    },
    {
      'question':
          '83. How do you deploy a Flutter app to the Google Play Store?',
      'answer':
          'To deploy a Flutter app to the Play Store, you need to create a release APK, sign it, and upload it to the Google Play Console.',
    },
    {
      'question': '84. What is `AssetImage` in Flutter?',
      'answer':
          '`AssetImage` is used to load image assets from the app’s resources for display in widgets like `Image`.',
    },
    {
      'question': '85. How do you handle app updates in Flutter?',
      'answer':
          'App updates in Flutter are managed using the platform-specific store (Google Play, App Store) and tools like Firebase App Distribution for testing beta versions.',
    },
    {
      'question': '86. What is the purpose of `SafeArea` in Flutter?',
      'answer':
          '`SafeArea` is used to ensure that widgets are not drawn in areas of the screen that are covered by notches, system UI, or other screen obstructions.',
    },
    {
      'question': '87. How do you integrate a REST API in Flutter?',
      'answer':
          'You can integrate a REST API in Flutter using the `http` package to make HTTP requests and handle the responses asynchronously.',
    },
    {
      'question': '88. What is the `Flexible` widget used for?',
      'answer':
          '`Flexible` is used in a `Row` or `Column` widget to allocate space proportionally between child widgets based on their flex properties.',
    },
    {
      'question': '89. What is a `SliverList`?',
      'answer':
          '`SliverList` is a part of Flutter’s custom scroll view that creates efficient scrolling lists, optimized for large lists with dynamic content.',
    },
    {
      'question': '90. What is `TextEditingController`?',
      'answer':
          '`TextEditingController` is used to manage the state of a `TextField` widget, allowing you to retrieve and manipulate the input value.',
    },
    {
      'question': '91. How do you integrate Google Maps in Flutter?',
      'answer':
          'Google Maps can be integrated using the `google_maps_flutter` package, allowing you to display and interact with maps in your app.',
    },
    {
      'question': '92. What is the `StreamBuilder` widget?',
      'answer':
          '`StreamBuilder` is used to listen to a stream and build widgets based on the latest snapshot of the stream’s data.',
    },
    {
      'question': '93. How do you ensure app security in Flutter?',
      'answer':
          'App security can be ensured by using proper authentication, encrypting sensitive data, using secure communication channels, and preventing code injection attacks.',
    },
    {
      'question': '94. What is `StatefulWidget`?',
      'answer':
          '`StatefulWidget` is a type of widget that has mutable state and can be updated and rebuilt based on user interaction or changes.',
    },
    {
      'question': '95. What is the `Key` class used for?',
      'answer':
          '`Key` is used to uniquely identify widgets in a widget tree, which helps Flutter efficiently update the UI during state changes.',
    },
    {
      'question': '96. How do you prevent widget rebuilds in Flutter?',
      'answer':
          'You can prevent unnecessary rebuilds by using keys, optimizing state management, and using `const` constructors for immutable widgets.',
    },
    {
      'question': '97. How do you implement a drawer in Flutter?',
      'answer':
          'A drawer in Flutter can be implemented using the `Drawer` widget and `Scaffold` to provide a sliding menu for the app.',
    },
    {
      'question': '98. How do you debug layout issues in Flutter?',
      'answer':
          'Layout issues can be debugged using Flutter’s debugging tools like the `Flutter Inspector` or by printing the layout constraints using `debugPrint`.',
    },
    {
      'question': '99. What is `InheritedWidget`?',
      'answer':
          '`InheritedWidget` is a widget that allows you to pass data down the widget tree to all descendants.',
    },
    {
      'question': '100. What is the purpose of the `build()` method?',
      'answer':
          'The `build()` method is used to describe the UI of a widget by returning a widget tree based on the widget’s state or data.',
    },
        {
      'question': '101. What is the difference between unit, widget and integration tests in Flutter?',
      'answer':
          'Unit Test: Focuses on testing small, isolated pieces of logic (e.g., functions or methods). Widget Test: Tests individual widgets and their interactions within the UI, but doesnt involve the entire app. Integration Test: Validates complete app workflows, including interactions between various components and external systems, in a real or simulated environment.',
    },
            {
      'question': '102. Before releasing a app to production, what steps you consider to make sure the functionalities are working fine and also if it is optimized or not?',
      'answer':
          'Before releasing an app to production, ensure thorough functional testing (unit, integration, E2E, UAT) and performance optimization (load/stress testing, profiling, caching). Additionally, conduct security audits, code reviews, scalability checks, and set up monitoring, error tracking, and deployment strategies to ensure the app performs well and remains secure in production.',
    },
  ];

  // Function to speak text
  Future<void> speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1);
    print(
      "Speaking: $text",
    ); // Debug log to check the current text being spoken
    await flutterTts.speak(text);
  }

  // Function to read the Q&A
  Future<void> readQA() async {
    if (isReading)
      return; // Prevent starting the reading if it's already in progress
    setState(() {
      isReading = true;
    });

    for (var qa in qaList) {
      print(
        "Reading question: ${qa['question']}",
      ); // Debug log before reading question
      await speak(qa['question']!); // Speak the question
      await Future.delayed(const Duration(seconds: 3)); // Wait before answering

      print(
        "Reading answer: ${qa['answer']}",
      ); // Debug log before reading answer
      await speak(qa['answer']!); // Speak the answer
      await Future.delayed(
        const Duration(seconds: 3),
      ); // Wait before moving to the next QA
    }

    setState(() {
      isReading = false; // Reset the flag when reading is done
    });
  }

  @override
  void dispose() {
    flutterTts.stop(); // Stop speaking and release resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Victoria Futter and Dart Audio Study Guide')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                print(
                  "Start Reading button pressed",
                ); // Debug log when the button is pressed
                readQA(); // Start reading questions and answers aloud
              },
              child: const Text('Start Reading'),
            ),
          ],
        ),
      ),
    );
  }
}
