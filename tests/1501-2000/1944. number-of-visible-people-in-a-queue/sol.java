class Solution {
    public int[] canSeePersonsCount(int[] heights) {
        int n = heights.length;
        int[] result = new int[n];
        Deque<Integer> stack = new ArrayDeque<>();

        for (int i = n-1; i >= 0; i--) {
            int height = heights[i];
            int visibility = 0;

            while (!stack.isEmpty() && height > stack.peek()) {
                stack.pop();
                visibility++;
            }

            if (!stack.isEmpty()) {
                visibility++;
            }

            result[i] = visibility;
            stack.push(height);
        }

        return result;
    }
}
