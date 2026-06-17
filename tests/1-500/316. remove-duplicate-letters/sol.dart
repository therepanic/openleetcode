class Solution {
  String removeDuplicateLetters(String s) {
    Map<String, int> lastOccur = {};
    for (int i = 0; i < s.length; i++) {
      lastOccur[s[i]] = i;
    }
    
    List<String> stack = [];
    Set<String> visited = {};
    
    for (int i = 0; i < s.length; i++) {
      String char = s[i];
      if (visited.contains(char)) {
        continue;
      }
      
      while (stack.isNotEmpty && char.compareTo(stack.last) < 0 && i < (lastOccur[stack.last] ?? -1)) {
        visited.remove(stack.removeLast());
      }
      
      visited.add(char);
      stack.add(char);
    }
    
    return stack.join('');
  }
}
