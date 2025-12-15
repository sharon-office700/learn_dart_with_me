// ============================================================
// EXERCISE 2.1: Build an API Client Simulator
// ============================================================


// Helper for random
import 'dart:async';
import 'dart:math' as Math;

// Simulates network latency
Future<T> simulateNetwork<T>(T data, {int delayMs = 100}) async {
  await Future.delayed(Duration(milliseconds: delayMs));
  return data;
}

// Sometimes fails
Future<T> unreliableNetwork<T>(T data, {double failureRate = 0.3}) async {
  await Future.delayed(Duration(milliseconds: 100));
  if (Math.Random().nextDouble() < failureRate) {
    throw NetworkException('Connection failed');
  }
  return data;
}

class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
  @override
  String toString() => 'NetworkException: $message';
}

// TODO: Implement these functions

/// Fetches user data with timeout. If the request takes longer than
/// [timeout], throw a TimeoutException.
Future<Map<String, dynamic>> fetchUserWithTimeout(
  String userId,
  Duration timeout,
) async {
  // Your code here
  // Hint: Use Future.timeout()
  var data = {
              "userId": userId, 
              "Duration": timeout
              };
  print("✅");
  return await simulateNetwork(data);
  
}

/// Fetches user data with retry. If the request fails, retry up to
/// [maxRetries] times with [delay] between attempts.
Future<Map<String, dynamic>> fetchUserWithRetry(
  String userId, {
  int maxRetries = 3,
  Duration delay = const Duration(milliseconds: 500),
}) async {
  // Your code here
  // Should print retry attempts
  print("✅");
  var data = {
    "userId": userId,
    "maxRetries": maxRetries,
    "delay": delay
  };

  var response;
  while (maxRetries != 0) {
    try {
      response = await unreliableNetwork(data);
      // response = await unreliableNetwork({"data": "sharon"});  <== can also do this as well cuz ye dictionary data accept karta hai 

      return response;  
    } catch (NetworkException) {
        print("Error catched @: $NetworkException");
        Future.delayed(delay);
        maxRetries = maxRetries - 1;
    }
  }
  
  return response;
    
}

/// Fetches multiple users in parallel. Returns a list of results,
/// where each result is either the user data or an error message.
Future<List<dynamic>> fetchUsersParallel(List<String> userIds) async {
  // Your code here
  // Should not fail if one user fetch fails
  // Hint: Use Future.wait with individual try/
  print("✅");
  var response_list = [];

  for (var user in userIds) {
    print("Checking for user: $user");
    try {
      var response = await unreliableNetwork(user);
      response_list.add(response);
    } catch (NetworkException) {
      response_list.add(NetworkException.toString());  //sirf NetworkException rakha toh bhi chalega
    }
  }

  // print("response_list: $response_list");

  return response_list;

  // return [{"data": "None"}];
}

// Problem number 3 
/// Fetches user dashboard data: user info, posts, and notifications
/// in parallel. Returns all data as a record.
Future<({Map<String, dynamic> user, List<String> posts, int notificationCount})>
    fetchDashboard(String userId) async {
  // Your code here
  // All three should fetch in parallel
  print("✅");

  var user = {
    "user": "sharon",
    "isActive": true
  };

  var posts = ["this is my first post 🔑", "2nd post !!!"];

  var notificationCount = 4;

  var notificationCount_response = await simulateNetwork(notificationCount);
  var posts_reponse = await simulateNetwork(posts);
  var user_response = await simulateNetwork(user);

  return (user: user_response, posts: posts_reponse, notificationCount: notificationCount_response);
  

  // dummy return for testing 
  // return (
  //   user: {
  //     'id': userId,
  //     'username': 'DummyUser123',
  //     'last_login': '2025-12-15'
  //   },
  //   posts: [
  //     'Welcome to the dashboard!',
  //     'Check out the new features.'
  //   ],
  //   notificationCount: 5
  // );
}

/// Implements a simple cache. First checks cache, if not found,
/// fetches from network and stores in cache for next time.
class CachedFetcher {
  final Map<String, Map<String, dynamic>> _cache = {};

  Future<Map<String, dynamic>> fetchUser(String userId) async {
    // Your code here
    // 1. Check cache first
    // 2. If not in cache, fetch from network
    if (_cache.containsKey(userId)) {
      print("data present in cache 😃 ");
      return await simulateNetwork(_cache[userId]!, delayMs: 0);
    } else {
    // 3. Store in cache
    // 4. Return result

      _cache.addAll({userId: {"dynamic": "addition"}});

      print("added the new data in : $_cache[$userId]");
      return await simulateNetwork(_cache[userId]!);
    }
  }
}


void main() async {
  print('=== Testing fetchUserWithTimeout ===');
  try {
    final user = await fetchUserWithTimeout('user1', Duration(milliseconds: 50));
    print('Success: $user');
  } on TimeoutException {
    print('Request timed out (expected)');
  }

  print('\n=== Testing fetchUserWithRetry ===');
  try {
    final user = await fetchUserWithRetry('user1', maxRetries: 3);
    print('Success after retries: $user');
  } catch (e) {
    print('Failed after all retries: $e');
  }

  print('\n=== Testing fetchUsersParallel ===');
  final users = await fetchUsersParallel(['user1', 'user2', 'user3']);
  print('Results: $users');

  print('\n=== Testing fetchDashboard ===');
  final dashboard = await fetchDashboard('user1');
  print('User: ${dashboard.user}');
  print('Posts: ${dashboard.posts}');
  print('Notifications: ${dashboard.notificationCount}');

  print('\n=== Testing CachedFetcher ===');
  final cache = CachedFetcher();
  final stopwatch = Stopwatch()..start();

  await cache.fetchUser('user1');  // Should be slow (network)
  print('First fetch: ${stopwatch.elapsedMilliseconds}ms');

  stopwatch.reset();
  await cache.fetchUser('user1');  // Should be fast (cache)
  print('Second fetch: ${stopwatch.elapsedMilliseconds}ms');  // Should be ~0
}

