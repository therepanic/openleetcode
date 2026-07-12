public class Solution {
    public bool SplitArraySameAverage(int[] nums) {
        int n = nums.Length;
        if (n < 2) return false;
        int total = nums.Sum();
        int[] transformed = new int[n];
        for (int i = 0; i < n; i++) {
            transformed[i] = nums[i] * n - total;
        }
        
        int mid = n >> 1;
        Dictionary<int, HashSet<int>> Generate(int[] arr) {
            var mp = new Dictionary<int, HashSet<int>>();
            int len = arr.Length;
            for (int mask = 1; mask < (1 << len); mask++) {
                int sum = 0, cnt = 0;
                for (int i = 0; i < len; i++) {
                    if ((mask & (1 << i)) != 0) {
                        sum += arr[i];
                        cnt++;
                    }
                }
                if (!mp.ContainsKey(cnt)) mp[cnt] = new HashSet<int>();
                mp[cnt].Add(sum);
            }
            return mp;
        }
        
        var mpA = Generate(transformed.Take(mid).ToArray());
        var mpB = Generate(transformed.Skip(mid).ToArray());
        
        foreach (var kvp in mpA) {
            if (kvp.Value.Contains(0) && kvp.Key != 0) return true;
        }
        foreach (var kvp in mpB) {
            if (kvp.Value.Contains(0) && kvp.Key != 0) return true;
        }
        
        foreach (var kvpA in mpA) {
            foreach (var kvpB in mpB) {
                int totalCnt = kvpA.Key + kvpB.Key;
                if (totalCnt == 0 || totalCnt == n) continue;
                foreach (int val in kvpA.Value) {
                    if (kvpB.Value.Contains(-val)) return true;
                }
            }
        }
        return false;
    }
}
