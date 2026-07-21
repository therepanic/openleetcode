public class Solution {
    public int CountNegatives(int[][] grid) {
        int count = 0;
        foreach (var row in grid) {
            foreach (int num in row) {
                if (num < 0) count++;
            }
        }
        return count;
    }
}
