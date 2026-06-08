import java.util.*;

class Solution {
    public int maximalRectangle(char[][] matrix) {
        if (matrix.length == 0 || matrix[0].length == 0) return 0;
        int cols = matrix[0].length;
        int[] heights = new int[cols];
        int ans = 0;
        for (char[] row : matrix) {
            for (int c = 0; c < cols; c++) heights[c] = row[c] == '1' ? heights[c] + 1 : 0;
            ans = Math.max(ans, largest(heights));
        }
        return ans;
    }

    private int largest(int[] heights) {
        Deque<Integer> stack = new ArrayDeque<>();
        int best = 0;
        for (int i = 0; i <= heights.length; i++) {
            int cur = i == heights.length ? 0 : heights[i];
            while (!stack.isEmpty() && heights[stack.peek()] > cur) {
                int h = heights[stack.pop()];
                int left = stack.isEmpty() ? -1 : stack.peek();
                best = Math.max(best, h * (i - left - 1));
            }
            stack.push(i);
        }
        return best;
    }
}
