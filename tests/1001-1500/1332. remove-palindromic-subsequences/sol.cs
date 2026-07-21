public class Solution {
    public int RemovePalindromeSub(string s) {
        char[] arr = s.ToCharArray();
        Array.Reverse(arr);
        return s == new string(arr) ? 1 : 2;
    }
}
