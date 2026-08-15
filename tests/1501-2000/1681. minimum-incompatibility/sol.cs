public class Solution {
    public int MinimumIncompatibility(int[] nums, int k) {
        int n = nums.Length;
        int sz = n / k;
        
        var counts = new Dictionary<int, int>();
        foreach (int num in nums) {
            counts[num] = counts.GetValueOrDefault(num, 0) + 1;
        }
        foreach (var v in counts.Values) {
            if (v > k) return -1;
        }
        
        Array.Sort(nums);
        
        var validSubsets = new Dictionary<int, int>();
        for (int mask = 0; mask < (1 << n); mask++) {
            if (BitCount(mask) == sz) {
                var subset = new List<int>();
                for (int i = 0; i < n; i++) {
                    if (((mask >> i) & 1) == 1) {
                        subset.Add(nums[i]);
                    }
                }
                if (subset.Distinct().Count() == sz) {
                    int max = subset.Max();
                    int min = subset.Min();
                    validSubsets[mask] = max - min;
                }
            }
        }
        
        var memo = new Dictionary<int, int>();
        int Solve(int remainingMask) {
            if (remainingMask == 0) return 0;
            if (memo.ContainsKey(remainingMask)) return memo[remainingMask];
            
            int firstElement = 0;
            int bit = remainingMask & -remainingMask;
            while ((bit >> firstElement) != 1) firstElement++;
            int res = int.MaxValue;
            
            foreach (var kvp in validSubsets) {
                int mask = kvp.Key;
                int cost = kvp.Value;
                if ((mask & remainingMask) == mask && ((mask >> firstElement) & 1) == 1) {
                    int next = Solve(remainingMask ^ mask);
                    if (next != int.MaxValue) {
                        res = Math.Min(res, cost + next);
                    }
                }
            }
            
            memo[remainingMask] = res;
            return res;
        }
        
        int ans = Solve((1 << n) - 1);
        return ans == int.MaxValue ? -1 : ans;
    }
    
    private int BitCount(int x) {
        int count = 0;
        while (x > 0) {
            count += x & 1;
            x >>= 1;
        }
        return count;
    }
}
