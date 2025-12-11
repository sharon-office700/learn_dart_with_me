// TODO: Implement all the functions below

/// Creates a function that filters a list based on a predicate.
List<T> Function(List<T>) createFilter<T>(bool Function(T) predicate) {
  // Your code here
  return (list) {
    return list.where(predicate).toList();
  };
}

/// Creates a function that applies a transformation multiple times.
int Function(int) applyTimes(int Function(int) fn, int times) {
  // Your code here
  return (int_return) {
    return (fn(int_return) * times);
  };
}

/// Composes two functions: compose(f, g)(x) = f(g(x))
int Function(int) compose(int Function(int) f, int Function(int) g) {
  // Your code here
  return (compose_func) {
    return (f(g(compose_func)));
  };
}

/// Creates a memoized version of a function (caches results).
int Function(int) memoize(int Function(int) fn) {
  // Your code here
  return (int_func) {
    int_func ++;
    return int_func; 
  };
}

void main() {
  // Test createFilter
  var isEven = (int n) => n % 2 == 0;
  var filterEvens = createFilter(isEven);
  print(filterEvens([1, 2, 3, 4, 5]));  // [2, 4]

  // Test applyTimes
  var double = (int n) => n * 2;
  var quadruple = applyTimes(double, 2);
  print("============> ${quadruple(3)}");  // 12

  // Test compose
  var addOne = (int n) => n + 1;
  var doubleThenAddOne = compose(addOne, double);
  print(doubleThenAddOne(5));  // 11

  // Test memoize
  var callCount = 0;
  var expensiveOperation = (int n) {
    callCount++;
    return n * n;
  };
  var memoized = memoize(expensiveOperation);

  print(memoized(5));  // 25
  print(memoized(5));  // 25 (from cache)
  print('Function was called $callCount times');  // Should be 1
}