public class Solution {
    public int[] CanSeePersonsCount(int[] heights) {
        int n = heights.Length;
        int[] result = new int[n];
        Stack<int> stack = new Stack<int>();

        for (int i = n-1; i >= 0; i--) {
            int height = heights[i];
            int visibility = 0;

            while (stack.Count > 0 && height > stack.Peek()) {
                stack.Pop();
                visibility++;
            }

            if (stack.Count > 0) {
                visibility++;
            }

            result[i] = visibility;
            stack.Push(height);
        }

        return result;
    }
}
