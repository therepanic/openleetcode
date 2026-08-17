public class Solution {
    public int MinSubarray(int[] nums, int p) {
        long total = 0;
        foreach (int num in nums) total += num;
        int target = (int)(total % p);
        if (target == 0) return 0;

        Dictionary<int, int> mp = new Dictionary<int, int> { [0] = -1 };
        int prefix = 0;
        int res = nums.Length;

        for (int i = 0; i < nums.Length; i++) {
            prefix = (prefix + nums[i]) % p;
            int need = (prefix - target + p) % p;

            if (mp.ContainsKey(need)) {
                res = Math.Min(res, i - mp[need]);
            }

            mp[prefix] = i;
        }

        return res == nums.Length ? -1 : res;
    }
}
