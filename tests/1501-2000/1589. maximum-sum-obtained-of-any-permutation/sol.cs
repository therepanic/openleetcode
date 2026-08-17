public class Solution {
    public int MaxSumRangeQuery(int[] nums, int[][] requests) {
        var events = new List<(int, int)>();
        const int MOD = 1_000_000_007;
        
        foreach (var req in requests) {
            events.Add((req[0], 1));
            events.Add((req[1]+1, -1));
        }
        
        events.Sort((a, b) => a.Item1.CompareTo(b.Item1));
        
        int cnt = 0;
        int prev = -1;
        var weight = new Dictionary<long, long>();
        
        foreach (var (pos, delta) in events) {
            if (prev != -1 && cnt != 0) {
                if (!weight.ContainsKey(cnt)) weight[cnt] = 0;
                weight[cnt] += pos - prev;
            }
            prev = pos;
            cnt += delta;
        }
        
        var sorted = weight.OrderByDescending(kv => kv.Key).ToList();
        
        Array.Sort(nums);
        Array.Reverse(nums);
        long ans = 0;
        int idx = 0;
        
        foreach (var kv in sorted) {
            long wg = kv.Key;
            long num = kv.Value;
            for (long i = 0; i < num; i++) {
                ans = (ans + (long)nums[idx] * wg) % MOD;
                idx++;
            }
        }
        
        return (int)ans;
    }
}
