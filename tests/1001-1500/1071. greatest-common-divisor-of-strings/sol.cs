public class Solution {
    public string GcdOfStrings(string str1, string str2) {
        if (str1 + str2 != str2 + str1) {
            return "";
        }
        
        int Gcd(int len1, int len2) {
            int minVal = Math.Min(len1, len2);
            for (int i = minVal; i >= 1; i--) {
                if (len1 % i == 0 && len2 % i == 0) {
                    return i;
                }
            }
            return 1;
        }
        
        return str1.Substring(0, Gcd(str1.Length, str2.Length));
    }
}
