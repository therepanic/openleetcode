class Solution {
  String smallestSubsequence(String s) {
    Map<String, int> fqMap = {};
    List<String> stack = [];
    Set<String> visited = {};
    for (var ch in s.split('')) {
      fqMap[ch] = (fqMap[ch] ?? 0) + 1;
    }
    for (var ch in s.split('')) {
      fqMap[ch] = fqMap[ch]! - 1;
      if (visited.contains(ch)) {
        continue;
      }
      while (stack.isNotEmpty && ch.compareTo(stack.last) < 0 && fqMap[stack.last]! > 0) {
        visited.remove(stack.removeLast());
      }
      visited.add(ch);
      stack.add(ch);
    }
    return stack.join();
  }
}
