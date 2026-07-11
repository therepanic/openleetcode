class Solution {
    public int[] numberOfLines(int[] widths, String s) {
        int lines = 1;
        int current = 0;
        for (char c : s.toCharArray()) {
            int w = widths[c - 'a'];
            if (current + w > 100) {
                lines++;
                current = w;
            } else {
                current += w;
            }
        }
        return new int[]{lines, current};
    }
}
