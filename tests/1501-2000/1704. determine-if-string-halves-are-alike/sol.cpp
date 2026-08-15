class Solution {
public:
    bool halvesAreAlike(string s) {
        string vowels = "aeiouAEIOU";
        int mid = s.length() / 2;
        int count = 0;
        for (int i = 0; i < mid; i++) {
            if (vowels.find(s[i]) != string::npos) count++;
        }
        for (int i = mid; i < s.length(); i++) {
            if (vowels.find(s[i]) != string::npos) count--;
        }
        return count == 0;
    }
};
