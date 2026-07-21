class Solution {
  bool canBeEqual(List<int> target, List<int> arr) {
    List<int> counts = List.filled(1001, 0);
    
    for (int i = 0; i < target.length; i++) {
      counts[target[i]]++;
      counts[arr[i]]--;
    }
    
    return counts.every((c) => c == 0);
  }
}
