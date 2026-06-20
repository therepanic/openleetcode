class Solution {
    public int countSegments(String s) {
        int c = 0;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) != ' ' && (i == 0 || s.charAt(i - 1) == ' ')) {
                c++;
            }
        }
        return c;
    }
}
