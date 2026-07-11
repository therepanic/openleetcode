class Solution {
  bool canReorderDoubled(List<int> arr) {
    Map<int, int> freq = {};
    for (int i in arr) {
      freq[i] = (freq[i] ?? 0) + 1;
    }
    
    arr.sort((a, b) => a.abs().compareTo(b.abs()));
    for (int val in arr) {
      if (freq[val] == 0) continue;
      int target = val * 2;
      if (freq.containsKey(target) && freq[target]! > 0) {
        freq[val] = freq[val]! - 1;
        freq[target] = freq[target]! - 1;
      } else {
        return false;
      }
    }
    return true;
  }
}
