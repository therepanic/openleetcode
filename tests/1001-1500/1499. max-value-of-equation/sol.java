class Solution {
    public int findMaxValueOfEquation(int[][] points, int k) {
        java.util.Deque<int[]> window = new java.util.ArrayDeque<>();
        int answer = Integer.MIN_VALUE;
        for (int[] point : points) {
            int x = point[0];
            int y = point[1];
            while (!window.isEmpty() && x - window.peekFirst()[1] > k) {
                window.pollFirst();
            }
            if (!window.isEmpty()) {
                answer = Math.max(answer, x + y + window.peekFirst()[0]);
            }
            int value = y - x;
            while (!window.isEmpty() && window.peekLast()[0] <= value) {
                window.pollLast();
            }
            window.offerLast(new int[]{value, x});
        }
        return answer;
    }
}
