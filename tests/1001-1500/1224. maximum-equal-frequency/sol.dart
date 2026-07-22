class Solution {
  int maxEqualFreq(List<int> nums) {
    var counts = <int, int>{};
    var frequencyCounts = <int, int>{};
    int best = 0;

    for (int i = 0; i < nums.length; i++) {
      int value = nums[i];
      int index = i + 1;
      int previous = counts[value] ?? 0;
      if (previous > 0) {
        frequencyCounts[previous] = frequencyCounts[previous]! - 1;
        if (frequencyCounts[previous] == 0) {
          frequencyCounts.remove(previous);
        }
      }
      counts[value] = previous + 1;
      int frequency = previous + 1;
      frequencyCounts[frequency] = (frequencyCounts[frequency] ?? 0) + 1;

      if (frequencyCounts.length == 1) {
        var entry = frequencyCounts.entries.first;
        int onlyFrequency = entry.key;
        int valueCount = entry.value;
        if (onlyFrequency == 1 || valueCount == 1) {
          best = index;
        }
      } else if (frequencyCounts.length == 2) {
        var keys = frequencyCounts.keys.toList()..sort();
        int low = keys[0];
        int high = keys[1];
        if ((low == 1 && frequencyCounts[low] == 1) || (high == low + 1 && frequencyCounts[high] == 1)) {
          best = index;
        }
      }
    }

    return best;
  }
}
