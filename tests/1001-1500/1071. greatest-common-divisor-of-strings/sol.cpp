class Solution {
public:
    string gcdOfStrings(string str1, string str2) {
        if (str1 + str2 != str2 + str1) {
            return "";
        }
        
        auto gcd = [](int len1, int len2) {
            int minVal = min(len1, len2);
            for (int i = minVal; i >= 1; i--) {
                if (len1 % i == 0 && len2 % i == 0) {
                    return i;
                }
            }
            return 1;
        };
        
        return str1.substr(0, gcd(str1.length(), str2.length()));
    }
};
