public class Solution {
    public double[] GetCollisionTimes(int[][] cars) {
        int n = cars.Length;
        int[] rightGreater = new int[n];
        Array.Fill(rightGreater, -1);
        double[] ans = new double[n];
        Array.Fill(ans, -1.0);
        List<int> stack = new List<int>();
        for (int r = n - 1; r >= 0; r--) {
            while (stack.Count > 0 && cars[stack[stack.Count - 1]][1] >= cars[r][1]) {
                stack.RemoveAt(stack.Count - 1);
            }
            if (stack.Count > 0) {
                rightGreater[r] = stack[stack.Count - 1];
            }
            stack.Add(r);
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
