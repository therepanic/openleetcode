class Solution {
public:
    int atMostNGivenDigitSet(vector<string>& digits, int n) {
        int d = digits.size();
        string s = to_string(n);
        int k = s.length();
        
        long long ans;
        if (d == 1) {
            ans = k - 1;
        } else {
            ans = (pow(d, k) - d) / (d - 1);
        }
        
        for (int i = 0; i < k; i++) {
            char ch = s[i];
            int cnt = 0;
            for (const string& digit : digits) {
                if (digit[0] < ch) {
                    cnt++;
                }
            }
            ans += cnt * pow(d, k - i - 1);
            
            bool found = false;
            for (const string& digit : digits) {
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
};
