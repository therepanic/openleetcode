class Solution {
    public double[] getCollisionTimes(int[][] cars) {
        int n = cars.length;
        int[] rightGreater = new int[n];
        Arrays.fill(rightGreater, -1);
        double[] ans = new double[n];
        Arrays.fill(ans, -1.0);
        int[] stack = new int[n];
        int top = 0;
        for (int r = n - 1; r >= 0; r--) {
            while (top > 0 && cars[stack[top - 1]][1] >= cars[r][1]) {
                top--;
            }
            if (top > 0) {
                rightGreater[r] = stack[top - 1];
            }
            stack[top++] = r;
        }
        for (int r = n - 1; r >= 0; r--) {
            int collideId = rightGreater[r];
            while (collideId != -1 && ans[collideId] != -1 && ans[collideId] < (double)(cars[collideId][0] - cars[r][0]) / (cars[r][1] - cars[collideId][1])) {
                collideId = rightGreater[collideId];
            }
            if (collideId != -1) {
                ans[r] = (double)(cars[collideId][0] - cars[r][0]) / (cars[r][1] - cars[collideId][1]);
            }
        }
        return ans;
    }
}
