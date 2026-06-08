import java.util.*;

class Solution {
    public int largestRectangleArea(int[] heights) {
        Deque<Integer> stack = new ArrayDeque<>();
        int ans = 0;
        for (int i = 0; i <= heights.length; i++) {
            int cur = i == heights.length ? 0 : heights[i];
            while (!stack.isEmpty() && heights[stack.peek()] > cur) {
                int h = heights[stack.pop()];
                int left = stack.isEmpty() ? -1 : stack.peek();
                ans = Math.max(ans, h * (i - left - 1));
            }
            stack.push(i);
        }
        return ans;
    }
}
