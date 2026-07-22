class Solution {
  int minSetSize(List<int> arr) {
    final freq = <int, int>{};
    for (final num in arr) {
      freq[num] = (freq[num] ?? 0) + 1;
    }
    
    final counts = freq.values.toList();
    counts.sort((a, b) => b.compareTo(a));
    
    int sumRemoved = 0;
    int minSetSize = 0;
    for (final count in counts) {
      sumRemoved += count;
      minSetSize++;
      if (sumRemoved >= arr.length ~/ 2) {
        return minSetSize;
      }
    }
    return minSetSize;
  }
}
