public class Solution {
    public int KConcatenationMaxSum(int[] arr, int k) {
        const int MOD = 1000000007;
        
        long Kadanes(int[] nums) {
            long best = 0;
            long total = 0;
            foreach (int x in nums) {
                total += x;
                if (total < 0) total = 0;
                best = Math.Max(best, total);
            }
            return best;
        }
        
        if (k <= 3) {
            int[] extended = new int[arr.Length * k];
            for (int i = 0; i < extended.Length; i++) {
                extended[i] = arr[i % arr.Length];
            }
            return (int)(Kadanes(extended) % MOD);
        }
        
        long sum = 0;
        foreach (int x in arr) sum += x;
        long s = Math.Max(0, sum * (k - 1)) % MOD;
        
        int[] doubleArr = new int[arr.Length * 2];
        for (int i = 0; i < doubleArr.Length; i++) {
            doubleArr[i] = arr[i % arr.Length];
        }
        
        return (int)(Math.Max(s + Kadanes(arr), Kadanes(doubleArr)) % MOD);
    }
}
