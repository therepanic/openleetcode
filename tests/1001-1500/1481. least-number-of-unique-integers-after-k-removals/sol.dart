class Solution {
  int findLeastNumOfUniqueInts(List<int> arr, int k) {
    Map<int, int> counts = {};
    for (int n in arr) {
      counts[n] = (counts[n] ?? 0) + 1;
    }

    List<int> frequencies = counts.values.toList()..sort();
    int remaining = frequencies.length;

    for (int freq in frequencies) {
      if (k < freq) break;
      k -= freq;
      remaining--;
    }

    return remaining;
  }
}
