public class Solution {
    public int MinChanges(int[] nums, int k) {
        var freq = new Dictionary<int, Dictionary<int, int>>();
        for (int i = 0; i < nums.Length; i++) {
            int rem = i % k;
            if (!freq.ContainsKey(rem)) freq[rem] = new Dictionary<int, int>();
            if (freq[rem].ContainsKey(nums[i])) freq[rem][nums[i]]++;
            else freq[rem][nums[i]] = 1;
        }
        
        int n = 1 << 10;
        int[] dp = new int[n];
        for (int i = 1; i < n; i++) dp[i] = int.MinValue;
        for (int i = 0; i < k; i++) {
            int mx = dp.Max();
            int[] tmp = new int[n];
            for (int x = 0; x < n; x++) {
                int c = dp[x];
                if (freq.ContainsKey(i)) {
                    foreach (var kv in freq[i]) {
                        int xx = kv.Key, cc = kv.Value;
                        int idx = x ^ xx;
                        tmp[idx] = Math.Max(tmp[idx], Math.Max(c + cc, mx));
                    }
                }
            }
            dp = tmp;
        }
        return nums.Length - dp[0];
    }
}
