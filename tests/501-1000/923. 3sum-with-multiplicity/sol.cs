public class Solution {
    public int ThreeSumMulti(int[] arr, int target) {
        Array.Sort(arr);
        Dictionary<int, int> cnt = new Dictionary<int, int>();
        foreach (int x in arr) {
            if (cnt.ContainsKey(x)) cnt[x]++;
            else cnt[x] = 1;
        }
        long res = 0;
        int i = 0, l = arr.Length;
        const int MOD = 1_000_000_007;
        
        while (i < l) {
            int j = i, k = l - 1;
            
            while (j < k) {
                int s = arr[i] + arr[j] + arr[k];
                if (s < target) {
                    j += cnt[arr[j]];
                } else if (s > target) {
                    k -= cnt[arr[k]];
                } else {
                    if (arr[i] != arr[j] && arr[j] != arr[k]) {
                        res += (long)cnt[arr[i]] * cnt[arr[j]] * cnt[arr[k]];
                    } else if (arr[i] == arr[j] && arr[j] != arr[k]) {
                        long c = cnt[arr[i]];
                        res += c * (c - 1) * cnt[arr[k]] / 2;
                    } else if (arr[i] != arr[j] && arr[j] == arr[k]) {
                        long c = cnt[arr[j]];
                        res += cnt[arr[i]] * c * (c - 1) / 2;
                    } else {
                        long c = cnt[arr[i]];
                        res += c * (c - 1) * (c - 2) / 6;
                    }
                    j += cnt[arr[j]];
                    k -= cnt[arr[k]];
                }
            }
            
            i += cnt[arr[i]];
        }
        
        return (int)(res % MOD);
    }
}
