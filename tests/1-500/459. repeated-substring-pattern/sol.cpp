class Solution {
public:
    bool repeatedSubstringPattern(string s) {
        string doubled = (s + s).substr(1, 2 * s.size() - 2);
        return doubled.find(s) != string::npos;
    }
};
