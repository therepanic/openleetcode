class Solution {
    public int heightChecker(int[] heights) {
        int count = 0;
        int[] s = heights.clone();
        Arrays.sort(s);
        for (int i = 0; i < heights.length; i++) {
            if (heights[i] != s[i]) {
                count++;
            }
        }
        return count;
    }
}
