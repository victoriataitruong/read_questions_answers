import 'package:flutter_test/flutter_test.dart';
import 'package:read_questions_answers/main.dart';  // Make sure this path is correct

void main() {
  testWidgets('Start Reading button test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the button is present with the correct text.
    expect(find.text('Start Reading'), findsOneWidget);

    // Tap the 'Start Reading' button.
    await tester.tap(find.text('Start Reading'));
    await tester.pump();

    // Verify that the button was tapped.
    // We can expect no direct change in the UI since text-to-speech is invoked, 
    // but you can verify if some UI elements or state changes are triggered. 
    // Here we expect the button to still be present, but you might test side effects 
    // (such as logs or state updates).

    expect(find.text('Start Reading'), findsOneWidget);
  });
}
