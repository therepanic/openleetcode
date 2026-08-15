class Solution {
public:
    bool checkPalindromeFormation(string a, string b) {
        return check(a, b) || check(b, a);
    }
    
private:
    bool check(const string& a, const string& b) {
        int i = 0, j = a.length() - 1;
        while (i < j && a[i] == b[j]) {
            i++;
            j--;
        }
        return isPalindrome(a.substr(i, j - i + 1)) || isPalindrome(b.substr(i, j - i + 1));
    }
    
    bool isPalindrome(const string& s) {
        int left = 0, right = s.length() - 1;
        while (left < right) {
            if (s[left] != s[right]) return false;
            left++;
            right--;
        }
        return true;
    }
};
