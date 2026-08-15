class Solution {
  List<int> frequencySort(List<int> nums) {
    Map<int, int> freq = {};
    for (int num in nums) {
      freq[num] = (freq[num] ?? 0) + 1;
    }
    nums.sort((a, b) {
      int freqCompare = freq[a]!.compareTo(freq[b]!);
      if (freqCompare != 0) return freqCompare;
      return b.compareTo(a);
    });
    return nums;
  }
}
