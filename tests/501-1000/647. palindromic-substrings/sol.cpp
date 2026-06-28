class Solution {
public:
    int countSubstrings(string s) {
        int count = 0;
        
        auto expand = [&](int left, int right) {
            int res = 0;
            while (left >= 0 && right < s.length() && s[left] == s[right]) {
                res++;
                left--;
                right++;
            }
            return res;
        };
        
        for (int i = 0; i < s.length(); i++) {
            count += expand(i, i);
            count += expand(i, i + 1);
        }
        
        return count;
    }
};
