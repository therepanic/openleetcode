public class Solution {
    public int HeightChecker(int[] heights) {
        int count = 0;
        int[] s = (int[])heights.Clone();
        Array.Sort(s);
        for (int i = 0; i < heights.Length; i++) {
            if (heights[i] != s[i]) {
                count++;
            }
        }
        return count;
    }
}
