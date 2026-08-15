public class Solution {
    public bool CheckPalindromeFormation(string a, string b) {
        return Check(a, b) || Check(b, a);
    }

    private bool Check(string a, string b) {
        int i = 0, j = a.Length - 1;
        while (i < j && a[i] == b[j]) {
            i++;
            j--;
        }
        return IsPalindrome(a.Substring(i, j - i + 1)) || IsPalindrome(b.Substring(i, j - i + 1));
    }

    private bool IsPalindrome(string s) {
        int left = 0, right = s.Length - 1;
        while (left < right) {
            if (s[left] != s[right]) return false;
            left++;
            right--;
        }
        return true;
    }
}
