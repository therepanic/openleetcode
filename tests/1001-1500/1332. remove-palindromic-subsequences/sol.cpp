class Solution {
public:
    int removePalindromeSub(string s) {
        string rev = s;
        reverse(rev.begin(), rev.end());
        return s == rev ? 1 : 2;
    }
};
