// ============================================================
// EXERCISE 2.2: Build a Real-Time Event System
// ============================================================

import 'dart:async';
import 'dart:math';

// Event types
enum EventType { click, hover, scroll, keypress, resize }

class UIEvent {
  final EventType type;
  final DateTime timestamp;
  final Map<String, dynamic> data;

  UIEvent(this.type, this.data) : timestamp = DateTime.now();

  @override
  String toString() => 'UIEvent($type, $data)';
}

// TODO: Implement the EventEmitter class
class EventEmitter {

  // Public stream getter
  Stream<UIEvent> get events => throw UnimplementedError();

  // TODO: Create a broadcast StreamController for UIEvent
  final stream_controller_b = StreamController.broadcast();

  // Emit an event
  void emit(UIEvent event) {
    // Your code here
    stream_controller_b.add(event);
  }

  // Convenience methods
  void emitClick(int x, int y) {
    // Your code here
  }

  void emitKeypress(String key) {
    // Your code here
  }

  void emitScroll(int scrollTop) {
    // Your code here
  }

  void dispose() {
    // Your code here
  }
}

// TODO: Implement EventAnalytics class
class EventAnalytics {
  final EventEmitter emitter;
  final List<StreamSubscription> _subscriptions = [];

  EventAnalytics(this.emitter);

  /// Counts events by type over a time window
  /// Returns a stream that emits counts every [windowDuration]
  Stream<Map<EventType, int>> eventCountsByWindow(Duration windowDuration) {
    // Your code here
    // Hint: Use Stream.periodic and collect events in between
    throw UnimplementedError();
  }

  /// Detects rapid clicking (more than [threshold] clicks in [window])
  /// Returns stream of "rage click" events
  Stream<UIEvent> detectRageClicks({
    int threshold = 3,
    Duration window = const Duration(seconds: 1),
  }) {
    // Your code here
    // Hint: Buffer click events and check count
    throw UnimplementedError();
  }

  /// Debounces events - only emits after [duration] of silence
  /// Useful for search-as-you-type
  Stream<UIEvent> debounce(Duration duration) {
    // Your code here
    throw UnimplementedError();
  }

  /// Throttles events - emits at most once per [duration]
  /// Useful for scroll events
  Stream<UIEvent> throttle(Duration duration) {
    // Your code here
    throw UnimplementedError();
  }

  void dispose() {
    for (var sub in _subscriptions) {
      sub.cancel();
    }
  }
}

// TODO: Implement EventLogger that logs events to "console"
class EventLogger {
  final EventEmitter emitter;
  StreamSubscription? _subscription;

  EventLogger(this.emitter);

  /// Start logging all events with timestamp
  void startLogging() {
    // Your code here
  }

  /// Stop logging
  void stopLogging() {
    // Your code here
  }

  /// Log only specific event types
  void logOnly(Set<EventType> types) {
    // Your code here
  }
}

void main() async {
  print('=== Event System Demo ===\n');

  final emitter = EventEmitter();
  final analytics = EventAnalytics(emitter);
  final logger = EventLogger(emitter);

  // Start logging
  logger.startLogging();

  // Listen for rage clicks
  analytics.detectRageClicks(threshold: 3).listen((event) {
    print('RAGE CLICK DETECTED at ${event.data}');
  });

  // Simulate user interactions
  print('Simulating user activity...\n');

  // Normal clicks
  emitter.emitClick(100, 200);
  await Future.delayed(Duration(milliseconds: 500));
  emitter.emitClick(150, 250);

  // Rage clicks (rapid succession)
  await Future.delayed(Duration(milliseconds: 200));
  print('\n--- Simulating rage clicks ---');
  for (var i = 0; i < 5; i++) {
    emitter.emitClick(200 + i * 10, 300);
    await Future.delayed(Duration(milliseconds: 100));
  }

  // Some keypresses
  await Future.delayed(Duration(milliseconds: 300));
  print('\n--- Simulating typing ---');
  for (var char in 'hello'.split('')) {
    emitter.emitKeypress(char);
    await Future.delayed(Duration(milliseconds: 150));
  }

  // Test debounce
  print('\n--- Testing debounce ---');
  final debounced = analytics.debounce(Duration(milliseconds: 300));
  debounced.listen((e) => print('Debounced: $e'));

  emitter.emitKeypress('a');
  await Future.delayed(Duration(milliseconds: 100));
  emitter.emitKeypress('b');
  await Future.delayed(Duration(milliseconds: 100));
  emitter.emitKeypress('c');
  await Future.delayed(Duration(milliseconds: 500));  // Silence - should emit

  // Cleanup
  await Future.delayed(Duration(seconds: 1));
  logger.stopLogging();
  analytics.dispose();
  emitter.dispose();

  print('\n=== Demo Complete ===');
}

