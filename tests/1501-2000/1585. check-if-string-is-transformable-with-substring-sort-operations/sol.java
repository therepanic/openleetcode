class Solution {
    public boolean isTransformable(String s, String t) {
        if (s.length() != t.length()) return false;
        int n = s.length();
        int[][] positions = new int[10][n];
        int[] sizes = new int[10];
        for (int index = 0; index < n; index++) {
            int digit = s.charAt(index) - '0';
            positions[digit][sizes[digit]++] = index;
        }
        int[] heads = new int[10];
        for (int index = 0; index < n; index++) {
            int digit = t.charAt(index) - '0';
            if (heads[digit] == sizes[digit]) return false;
            int sourceIndex = positions[digit][heads[digit]++];
            for (int smaller = 0; smaller < digit; smaller++) {
                if (heads[smaller] < sizes[smaller]
                        && positions[smaller][heads[smaller]] < sourceIndex) {
                    return false;
                }
            }
        }
        return true;
    }
}
