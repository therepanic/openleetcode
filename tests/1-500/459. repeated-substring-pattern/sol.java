class Solution {
    public boolean repeatedSubstringPattern(String s) {
        String doubled = (s + s).substring(1, 2 * s.length() - 1);
        return doubled.contains(s);
    }
}
