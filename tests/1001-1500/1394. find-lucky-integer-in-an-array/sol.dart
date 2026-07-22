class Solution {
  int findLucky(List<int> arr) {
    final freq = <int, int>{};
    for (final num in arr) {
      freq[num] = (freq[num] ?? 0) + 1;
    }
    
    int lucky = -1;
    freq.forEach((num, count) {
      if (num == count) {
        if (num > lucky) {
          lucky = num;
        }
      }
    });
    
    return lucky;
  }
}
