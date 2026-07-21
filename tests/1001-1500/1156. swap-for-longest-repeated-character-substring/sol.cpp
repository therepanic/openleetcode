class Solution {
public:
    int maxRepOpt1(string text) {
        unordered_map<char, int> total;
        for (char c : text) {
            total[c]++;
        }
        int n = text.length();
        int ans = 0;
        
        for (auto& [ch, ch_total] : total) {
            int left = 0;
            int count = 0;
            
            for (int right = 0; right < n; right++) {
                if (text[right] == ch) {
                    count++;
                }
                
                while ((right - left + 1) - count > 1) {
                    if (text[left] == ch) {
                        count--;
                    }
                    left++;
                }
                
                ans = max(ans, min(right - left + 1, ch_total));
            }
        }
        
        return ans;
    }
};
