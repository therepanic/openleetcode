class Solution {
    public String replaceDigits(String s) {
        char[] chars = s.toCharArray();
        for (int i = 1; i < chars.length; i += 2) {
            char ch = chars[i - 1];
            int digit = chars[i] - '0';
            chars[i] = (char)(ch + digit);
        }
        return new String(chars);
    }
}
