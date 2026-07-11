class Solution {
public:
    string reverseOnlyLetters(string s) {
        int start = 0;
        int end = s.length() - 1;
        while (true) {
            if (start >= end) {
                break;
            }
            
            if (isalpha(s[start]) && isalpha(s[end])) {
                swap(s[start], s[end]);
                start++;
                end--;
            } else if (!isalpha(s[start])) {
                start++;
            } else {
                end--;
            }
        }
        
        return s;
    }
};
