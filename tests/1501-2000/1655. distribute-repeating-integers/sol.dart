class Solution {
  bool canDistribute(List<int> nums, List<int> quantity) {
    quantity.sort((a, b) => b.compareTo(a));
    Map<int, int> freqCounts = {};
    Map<int, int> freqMap = {};
    for (int n in nums) {
      freqMap[n] = (freqMap[n] ?? 0) + 1;
    }
    freqMap.values.forEach((f) {
      freqCounts[f] = (freqCounts[f] ?? 0) + 1;
    });
    
    bool backtrack(int i) {
      if (i == quantity.length) return true;
      for (int freq in freqCounts.keys.toList()) {
        int count = freqCounts[freq]!;
        if (freq >= quantity[i] && count > 0) {
          freqCounts[freq] = count - 1;
          int newFreq = freq - quantity[i];
          freqCounts[newFreq] = (freqCounts[newFreq] ?? 0) + 1;
          if (backtrack(i + 1)) return true;
          freqCounts[freq] = count;
          int newCount = freqCounts[newFreq]!;
          if (newCount == 1) {
            freqCounts.remove(newFreq);
          } else {
            freqCounts[newFreq] = newCount - 1;
          }
        }
      }
      return false;
    }
    
    return backtrack(0);
  }
}
