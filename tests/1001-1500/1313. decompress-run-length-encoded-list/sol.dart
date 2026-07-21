class Solution {
  List<int> decompressRLElist(List<int> nums) {
    List<int> a = [];
    for (int i = 0; i < nums.length; i += 2) {
      int freq = nums[i];
      int val = nums[i + 1];
      a.addAll(List.filled(freq, val));
    }
    return a;
  }
}
