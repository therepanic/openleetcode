class Solution {
public:
    int longestPalindrome(string s) {
        unordered_map<char, int> count;
        for (char c : s) {
            count[c]++;
        }
        
        int maxLen = 0;
        bool odd = false;
        
        for (auto& pair : count) {
            int freq = pair.second;
            if (freq % 2 == 0) {
                maxLen += freq;
            } else {
                maxLen += freq - 1;
                odd = true;
            }
        }
        
        return maxLen + (odd ? 1 : 0);
    }
};
