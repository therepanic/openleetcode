class Solution {
  int minSubarray(List<int> nums, int p) {
    int total = nums.fold(0, (a, b) => a + b);
    int target = total % p;
    if (target == 0) return 0;

    Map<int, int> mp = {0: -1};
    int prefix = 0;
    int res = nums.length;

    for (int i = 0; i < nums.length; i++) {
      prefix = (prefix + nums[i]) % p;
      int need = (prefix - target + p) % p;

      if (mp.containsKey(need)) {
        res = res < (i - mp[need]!) ? res : (i - mp[need]!);
      }

      mp[prefix] = i;
    }

    return res == nums.length ? -1 : res;
  }
}
