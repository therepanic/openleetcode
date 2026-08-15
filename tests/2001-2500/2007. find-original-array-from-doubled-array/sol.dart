class Solution {
  List<int> findOriginalArray(List<int> changed) {
    if (changed.length % 2 != 0) return [];
    
    Map<int, int> count = {};
    for (int num in changed) {
      count[num] = (count[num] ?? 0) + 1;
    }
    changed.sort();
    List<int> original = [];
    
    for (int num in changed) {
      if (count[num] == 0) continue;
      if ((count[2 * num] ?? 0) == 0) return [];
      original.add(num);
      count[num] = count[num]! - 1;
      count[2 * num] = count[2 * num]! - 1;
    }
    
    return original;
  }
}
