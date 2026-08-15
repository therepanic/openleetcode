class Solution {
    public int minChanges(int[] nums, int k) {
        java.util.Map<Integer, java.util.Map<Integer, Integer>> freq = new java.util.HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            int rem = i % k;
            freq.computeIfAbsent(rem, z -> new java.util.HashMap<>()).merge(nums[i], 1, Integer::sum);
        }
        
        int n = 1 << 10;
        int[] dp = new int[n];
        Arrays.fill(dp, Integer.MIN_VALUE);
        dp[0] = 0;
        for (int i = 0; i < k; i++) {
            int mx = Integer.MIN_VALUE;
            for (int v : dp) mx = Math.max(mx, v);
            int[] tmp = new int[n];
            for (int x = 0; x < n; x++) {
                int c = dp[x];
                if (freq.containsKey(i)) {
                    for (java.util.Map.Entry<Integer, Integer> e : freq.get(i).entrySet()) {
                        int xx = e.getKey(), cc = e.getValue();
                        tmp[x ^ xx] = Math.max(tmp[x ^ xx], Math.max(c + cc, mx));
                    }
                } else {
                    tmp[x] = Math.max(tmp[x], mx);
                }
            }
            dp = tmp;
        }
        return nums.length - dp[0];
    }
}
