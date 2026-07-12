class Solution {
    public int carFleet(int target, int[] position, int[] speed) {
        int n = position.length;
        int[][] cars = new int[n][2];
        for (int i = 0; i < n; i++) {
            cars[i][0] = position[i];
            cars[i][1] = speed[i];
        }
        Arrays.sort(cars, (a, b) -> Integer.compare(b[0], a[0]));
        java.util.ArrayDeque<Double> stack = new java.util.ArrayDeque<>();
        for (int[] car : cars) {
            double t = (double)(target - car[0]) / car[1];
            if (stack.isEmpty() || t > stack.peek()) {
                stack.push(t);
            }
        }
        return stack.size();
    }
}
