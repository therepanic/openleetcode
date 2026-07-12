class Solution {
    public String gcdOfStrings(String str1, String str2) {
        if (!(str1 + str2).equals(str2 + str1)) {
            return "";
        }
        
        int gcdLen = gcd(str1.length(), str2.length());
        return str1.substring(0, gcdLen);
    }
    
    private int gcd(int len1, int len2) {
        int minVal = Math.min(len1, len2);
        for (int i = minVal; i >= 1; i--) {
            if (len1 % i == 0 && len2 % i == 0) {
                return i;
            }
        }
        return 1;
    }
}
