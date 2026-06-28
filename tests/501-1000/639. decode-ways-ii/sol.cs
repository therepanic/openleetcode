public class Solution {
    public int NumDecodings(string s) {
        const int M = 1000000007;
        int n = s.Length - 1;
        
        var d = new Dictionary<string, long>();
        for (int i = 1; i <= 26; i++) d[i.ToString()] = 1;
        for (int i = 0; i <= 9; i++) d["*" + i] = 1 + (i < 7 ? 1 : 0);
        d["*"] = 9;
        d["**"] = 15;
        d["1*"] = 9;
        d["2*"] = 6;
        
        long[] dp = new long[n + 2];
        dp[0] = d.GetValueOrDefault(s[0].ToString(), 0);
        dp[n + 1] = 1;
        
        for (int i = 0; i < n; i++) {
            string one = s[i + 1].ToString();
            string two = s[i].ToString() + s[i + 1].ToString();
            
            long count = (d.GetValueOrDefault(one, 0) * dp[i]) % M;
            count = (count + d.GetValueOrDefault(two, 0) * (i > 0 ? dp[i - 1] : 1)) % M;
            dp[i + 1] = count;
            
            if (dp[i + 1] == 0) return 0;
        }
        
        return (int)dp[n];
    }
}
