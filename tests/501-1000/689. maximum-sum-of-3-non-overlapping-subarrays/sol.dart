class Solution {
  List<int> maxSumOfThreeSubarrays(List<int> nums, int k) {
    int n = nums.length;
    int sum1 = nums.sublist(0, k).fold(0, (a, b) => a + b);
    int sum2 = nums.sublist(k, 2 * k).fold(0, (a, b) => a + b);
    int sum3 = nums.sublist(2 * k, 3 * k).fold(0, (a, b) => a + b);

    int max1 = sum1;
    int max12 = sum1 + sum2;
    int max123 = sum1 + sum2 + sum3;

    int index1 = 0;
    int index12_1 = 0;
    int index12_2 = k;
    List<int> ans = [0, k, 2 * k];

    for (int i = 1; i <= n - 3 * k; i++) {
      sum1 = sum1 - nums[i - 1] + nums[i + k - 1];
      sum2 = sum2 - nums[i + k - 1] + nums[i + 2 * k - 1];
      sum3 = sum3 - nums[i + 2 * k - 1] + nums[i + 3 * k - 1];

      if (sum1 > max1) {
        max1 = sum1;
        index1 = i;
      }

      if (max1 + sum2 > max12) {
        max12 = max1 + sum2;
        index12_1 = index1;
        index12_2 = i + k;
      }

      if (max12 + sum3 > max123) {
        max123 = max12 + sum3;
        ans = [index12_1, index12_2, i + 2 * k];
      }
    }

    return ans;
  }
}
