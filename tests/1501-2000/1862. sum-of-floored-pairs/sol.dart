class Solution {
  int sumOfFlooredPairs(List<int> nums) {
    const int MOD = 1000000007;
    int maxi = 100001;
    int maxVal = nums.reduce((a, b) => a > b ? a : b);
    int size = 2 * maxi + 1;
    List<int> freq = List.filled(size, 0);
    for (int num in nums) {
      freq[num]++;
    }
    for (int i = 1; i < size; i++) {
      freq[i] += freq[i - 1];
    }
    
    int total = 0;
    for (int num = 1; num <= maxVal; num++) {
      int countNum = freq[num] - freq[num - 1];
      if (countNum == 0) continue;
      int floorValue = 1;
      while (floorValue * num <= maxVal) {
        int left = floorValue * num;
        int right = (floorValue + 1) * num - 1;
        if (right > maxVal) right = maxVal;
        int countInRange = freq[right] - freq[left - 1];
        total = (total + countNum * floorValue * countInRange) % MOD;
        floorValue++;
      }
    }
    return total;
  }
}
