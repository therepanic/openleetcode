class Solution {
    public int kConcatenationMaxSum(int[] arr, int k) {
        final int MOD = 1000000007;
        
        if (k <= 3) {
            int[] extended = new int[arr.length * k];
            for (int i = 0; i < extended.length; i++) {
                extended[i] = arr[i % arr.length];
            }
            return (int)(kadanes(extended) % MOD);
        }
        
        long sum = 0;
        for (int x : arr) sum += x;
        long s = Math.max(0, sum * (k - 1)) % MOD;
        
        int[] doubleArr = new int[arr.length * 2];
        for (int i = 0; i < doubleArr.length; i++) {
            doubleArr[i] = arr[i % arr.length];
        }
        
        return (int)(Math.max(s + kadanes(arr), kadanes(doubleArr)) % MOD);
    }
    
    private long kadanes(int[] nums) {
        long best = 0;
        long total = 0;
        for (int x : nums) {
            total += x;
            if (total < 0) total = 0;
            best = Math.max(best, total);
        }
        return best;
    }
}
