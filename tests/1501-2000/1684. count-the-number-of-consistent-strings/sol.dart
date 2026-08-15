class Solution {
  int countConsistentStrings(String allowed, List<String> words) {
    final allowedSet = allowed.split('').toSet();
    var result = 0;
    for (final word in words) {
      if (word.split('').every(allowedSet.contains)) result++;
    }
    return result;
  }
}
