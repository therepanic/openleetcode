class Solution {
public:
    int characterReplacement(string s, int k) {
        int maxCount = 0;
        int left = 0;
        vector<int> freq(26, 0);
        
        for (int right = 0; right < s.length(); right++) {
            freq[s[right] - 'A']++;
            maxCount = max(maxCount, freq[s[right] - 'A']);
            
            if (right - left + 1 - maxCount > k) {
                freq[s[left] - 'A']--;
                left++;
            }
        }
        
        return s.length() - left;
    }
};
