public class Solution {
    public int CountKDifference(int[] nums, int k) {
        var c = new Dictionary<int, int>();
        foreach (int num in nums) {
            c[num] = c.GetValueOrDefault(num) + 1;
        }
        int ans = 0;
        foreach (var kv in c) {
            ans += kv.Value * c.GetValueOrDefault(kv.Key + k);
        }
        return ans;
    }
}
