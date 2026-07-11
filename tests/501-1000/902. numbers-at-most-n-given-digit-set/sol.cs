public class Solution {
    public int AtMostNGivenDigitSet(string[] digits, int n) {
        int d = digits.Length;
        string s = n.ToString();
        int k = s.Length;
        
        long ans;
        if (d == 1) {
            ans = k - 1;
        } else {
            ans = ((long)Math.Pow(d, k) - d) / (d - 1);
        }
        
        for (int i = 0; i < k; i++) {
            char ch = s[i];
            int cnt = 0;
            foreach (string digit in digits) {
                if (digit[0] < ch) {
                    cnt++;
                }
            }
            ans += cnt * (long)Math.Pow(d, k - i - 1);
            
            bool found = false;
            foreach (string digit in digits) {
                if (digit[0] == ch) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                break;
            }
            if (i == k - 1) {
                ans++;
            }
        }
        
        return (int)ans;
    }
}
