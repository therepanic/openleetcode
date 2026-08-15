class Solution {
  int reductionOperations(List<int> nums) {
    List<int> freq = List.filled(50001, 0);
    for (int num in nums) {
      freq[num]++;
    }
    int idx = 1;
    while (freq[idx] == 0) idx++;
    int val = 0, total = 0;
    for (int i = 50000; i > idx; i--) {
      if (freq[i] > 0) {
        val += freq[i];
        total += val;
      }
    }
    return total;
  }
}
