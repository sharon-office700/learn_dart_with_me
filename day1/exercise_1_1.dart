// TODO: Implement the following functions

/// Given a list of integers, return a new list with only even numbers, squared.
/// Example: [1, 2, 3, 4, 5] -> [4, 16]
List<int> squareEvens(List<int> numbers) {
  // Your code here
  List<int> even = [];
  for (var i in numbers) {
    // if (i % 2 == 0 ) even.add(i * *);
    // then square the even list

    (i % 2 == 0) ? even.add(i * i) : null;
  }

  return even;

}

/// Given a list of strings, return a Map where keys are the strings
/// and values are their lengths.
/// Example: ['cat', 'elephant'] -> {'cat': 3, 'elephant': 8}
Map<String, int> stringLengths(List<String> strings) {
  // Your code here
  Map<String, int> length_map = {};
  for ( var i in strings) {
    length_map[i] = i.length;
  }

  return length_map;
}

/// Given two lists, return a Set of elements that appear in both.
/// Example: [1, 2, 3], [2, 3, 4] -> {2, 3}
Set<int> commonElements(List<int> list1, List<int> list2) {
  // Your code here
  Set<int> common = {};
  for ( var i in list1) {
    for (var j in list2) {
      if (i == j) common.add(i);
    }
  }

  return common;
}

void main() {
  // Test your implementations
  print(squareEvens([1, 2, 3, 4, 5])); // Expected: [4, 16]
  print(stringLengths(['cat', 'elephant', 'dog'])); // Expected: {cat: 3, elephant: 8, dog: 3}
  print(commonElements([1, 2, 3], [2, 3, 4])); // Expected: {2, 3}
}
