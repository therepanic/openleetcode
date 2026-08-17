public class Solution {
    public int CountPairs(int[] deliciousness) {
        const long MOD = 1_000_000_007;
        int maxVal = 0;
        foreach (int d in deliciousness) maxVal = Math.Max(maxVal, d);
        int[] powers = new int[22];
        for (int i = 0; i < 22; i++) powers[i] = 1 << i;
        
        var count = new Dictionary<int, long>();
        long res = 0;

        foreach (int val in deliciousness) {
            foreach (int target in powers) {
                int complement = target - val;
                if (count.ContainsKey(complement)) {
                    res += count[complement];
                    res %= MOD;
                }
            }
            if (!count.ContainsKey(val)) count[val] = 0;
            count[val]++;
        }
        return (int)res;
    }
}
