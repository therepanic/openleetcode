public class Solution {
    public int MinimumLength(string s) {
        int left = 0;
        int right = s.Length - 1;
        while (left < right && s[left] == s[right]) {
            char ch = s[left];
            while (left <= right && s[left] == ch) {
                left++;
            }
            while (left <= right && s[right] == ch) {
                right--;
            }
        }
        return Math.Max(0, right - left + 1);
    }
}
