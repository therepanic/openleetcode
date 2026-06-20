class Solution {
  List<int> topKFrequent(List<int> nums, int k) {
    Map<int, int> freq = {};
    for (int i in nums) {
      freq[i] = (freq[i] ?? 0) + 1;
    }
    var sortedEntries = freq.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sortedEntries.take(k).map((e) => e.key).toList();
  }
}
