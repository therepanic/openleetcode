class Solution {
public:
    bool isPrefixString(string s, vector<string>& words) {
        string res = "";
        int i = 0;
        while (res.length() < s.length()) {
            if (i >= words.size()) return false;
            res += words[i];
            i++;
        }
        return res == s;
    }
};
