import 'package:firebase_analytics/firebase_analytics.dart';

final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

void logMyCustomEvent() {
  analytics.logEvent(
    name: "my_custom_event",
    parameters: {
      "string_param": "Hello World",
      "int_param": 123,
    },
  );
}

void logEvent({
  required String eventName
}) {
  try {
    analytics.logEvent(
      name: eventName,
      // parameters: {
      //   "string_param": "Hello World",
      //   "int_param": 123,
      // },
    );
    print("Event has been logged: $eventName");
  } catch (e) {
    print("Log Event Error | $eventName: ${e.toString()}");
  }
}