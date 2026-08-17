class Solution {
public:
    string longestNiceSubstring(string s) {
        int len_s = s.length();
        if (len_s <= 1) return "";

        unordered_map<char, int> charToFreqMap;
        for (char c : s) {
            charToFreqMap[c]++;
        }
        
        bool isBroken = false;
        int i = 0;
        while (i < s.length()) {
            char ch = s[i];
            if (islower(ch) && charToFreqMap.count(toupper(ch))) {
                // pass
            } else if (isupper(ch) && charToFreqMap.count(tolower(ch))) {
                // pass
            } else {
                isBroken = true;
                break;
            }
            i++;
        }

        if (!isBroken) return s;
        
        string longestNiceSubstr1 = longestNiceSubstring(s.substr(0, i));
        string longestNiceSubstr2 = longestNiceSubstring(s.substr(i + 1));
        
        return longestNiceSubstr1.length() >= longestNiceSubstr2.length() ? longestNiceSubstr1 : longestNiceSubstr2;
    }
};
