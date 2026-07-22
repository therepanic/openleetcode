public class Solution {
    public int MakeArrayIncreasing(int[] arr1, int[] arr2) {
        Array.Sort(arr2);
        var memo = new Dictionary<(int, long), int>();
        
        int Dfs(int i, long prevMax) {
            if (i == arr1.Length) return 0;
            
            var key = (i, prevMax);
            if (memo.ContainsKey(key)) return memo[key];
            
            int j = BisectRight(arr2, prevMax);
            
            int ans = int.MaxValue / 2;
            if (arr1[i] > prevMax) {
                ans = Math.Min(ans, Dfs(i + 1, arr1[i]));
            }
            if (j < arr2.Length) {
                ans = Math.Min(ans, Dfs(i + 1, arr2[j]) + 1);
            }
            
            memo[key] = ans;
            return ans;
        }
        
        int ops = Dfs(0, long.MinValue);
        return ops >= int.MaxValue / 2 ? -1 : ops;
    }
    
    private int BisectRight(int[] arr, long target) {
        int lo = 0, hi = arr.Length;
        while (lo < hi) {
            int mid = lo + (hi - lo) / 2;
            if (arr[mid] <= target) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
}
