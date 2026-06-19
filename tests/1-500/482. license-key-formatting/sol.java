class Solution {
    public String licenseKeyFormatting(String s, int k) {
        s = s.replace("-", "").toUpperCase();
        StringBuilder result = new StringBuilder();
        int len = s.length();
        for (int i = len; i > 0; i -= k) {
            int start = Math.max(0, i - k);
            result.insert(0, s.substring(start, i));
            if (i - k > 0) {
                result.insert(0, "-");
            }
        }
        return result.toString();
    }
}
