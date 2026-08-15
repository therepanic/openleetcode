class Solution {
public:
    string mergeAlternately(string word1, string word2) {
        string merged;
        int minLen = min(word1.length(), word2.length());
        for (int i = 0; i < minLen; i++) {
            merged += word1[i];
            merged += word2[i];
        }
        if (word1.length() > minLen) {
            merged += word1.substr(minLen);
        }
        if (word2.length() > minLen) {
            merged += word2.substr(minLen);
        }
        return merged;
    }
};
