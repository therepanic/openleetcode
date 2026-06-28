class Solution {
    public int numDecodings(String s) {
        int M = 1000000007;
        int n = s.length() - 1;
        
        java.util.Map<String, Integer> d = new java.util.HashMap<>();
        for (int i = 1; i <= 26; i++) d.put(String.valueOf(i), 1);
        for (int i = 0; i <= 9; i++) d.put("*" + i, 1 + (i < 7 ? 1 : 0));
        d.put("*", 9);
        d.put("**", 15);
        d.put("1*", 9);
        d.put("2*", 6);
        
        long[] dp = new long[n + 2];
        dp[0] = d.getOrDefault(s.substring(0, 1), 0);
        dp[n + 1] = 1;
        
        for (int i = 0; i < n; i++) {
            String one = s.substring(i + 1, i + 2);
            String two = s.substring(i, i + 2);
            
            long count = (d.getOrDefault(one, 0) * dp[i]) % M;
            count = (count + d.getOrDefault(two, 0) * (i > 0 ? dp[i - 1] : 1)) % M;
            dp[i + 1] = count;
            
            if (dp[i + 1] == 0) return 0;
        }
        
        return (int) dp[n];
    }
}
