class Solution {
public:
    int minimumLength(string s) {
        int left = 0;
        int right = s.length() - 1;
        while (left < right && s[left] == s[right]) {
            char ch = s[left];
            while (left <= right && s[left] == ch) {
                left++;
            }
            while (left <= right && s[right] == ch) {
                right--;
            }
        }
        return max(0, right - left + 1);
    }
};
