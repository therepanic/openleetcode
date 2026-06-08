using System.Collections.Generic;

public class Solution {
    public int MaximalRectangle(char[][] matrix) {
        if (matrix.Length == 0 || matrix[0].Length == 0) return 0;
        int cols = matrix[0].Length;
        var heights = new int[cols];
        int ans = 0;
        foreach (var row in matrix) {
            for (int c = 0; c < cols; c++) heights[c] = row[c] == '1' ? heights[c] + 1 : 0;
            ans = System.Math.Max(ans, Largest(heights));
        }
        return ans;
    }

    private int Largest(int[] heights) {
        var stack = new Stack<int>();
        int best = 0;
        for (int i = 0; i <= heights.Length; i++) {
            int cur = i == heights.Length ? 0 : heights[i];
            while (stack.Count > 0 && heights[stack.Peek()] > cur) {
                int h = heights[stack.Pop()];
                int left = stack.Count == 0 ? -1 : stack.Peek();
                best = System.Math.Max(best, h * (i - left - 1));
            }
            stack.Push(i);
        }
        return best;
    }
}
