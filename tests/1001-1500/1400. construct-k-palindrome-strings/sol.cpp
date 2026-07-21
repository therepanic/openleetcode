class Solution {
public:
    bool canConstruct(string s, int k) {
        if (s.length() < k) {
            return false;
        }

        vector<int> charCount(26, 0);
        for (char c : s) {
            charCount[c - 'a']++;
        }

        int oddCount = 0;
        for (int freq : charCount) {
            if (freq % 2 != 0) {
                oddCount++;
            }
        }

        return oddCount <= k;
    }
};
