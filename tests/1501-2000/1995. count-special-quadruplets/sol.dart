class Solution {
  int countQuadruplets(List<int> nums) {
    int res = 0;
    int n = nums.length;
    for (int w = 0; w < n; w++) {
      for (int x = w + 1; x < n; x++) {
        for (int y = x + 1; y < n; y++) {
          for (int z = y + 1; z < n; z++) {
            if (nums[w] + nums[x] + nums[y] == nums[z]) {
              res++;
            }
          }
        }
      }
    }
    return res;
  }
}
