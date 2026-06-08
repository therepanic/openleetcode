using System.Collections.Generic;

public class Solution {
    public int LargestRectangleArea(int[] heights) {
        var stack = new Stack<int>();
        int ans = 0;
        for (int i = 0; i <= heights.Length; i++) {
            int cur = i == heights.Length ? 0 : heights[i];
            while (stack.Count > 0 && heights[stack.Peek()] > cur) {
                int h = heights[stack.Pop()];
                int left = stack.Count == 0 ? -1 : stack.Peek();
                ans = System.Math.Max(ans, h * (i - left - 1));
            }
            stack.Push(i);
        }
        return ans;
    }
}
