class Solution {
  int numTriplets(List<int> nums1, List<int> nums2) {
    int countPairs(List<int> numsA, List<int> numsB) {
      Map<int, int> freq = {};
      for (int i = 0; i < numsB.length; i++) {
        for (int j = i + 1; j < numsB.length; j++) {
          int prod = numsB[i] * numsB[j];
          freq[prod] = (freq[prod] ?? 0) + 1;
        }
      }
      int count = 0;
      for (int num in numsA) {
        count += freq[num * num] ?? 0;
      }
      return count;
    }
    return countPairs(nums1, nums2) + countPairs(nums2, nums1);
  }
}
