class Solution {
    public int removePalindromeSub(String s) {
        String reversed = new StringBuilder(s).reverse().toString();
        return s.equals(reversed) ? 1 : 2;
    }
}
