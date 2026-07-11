public class Solution {
    public int CarFleet(int target, int[] position, int[] speed) {
        int n = position.Length;
        int[][] cars = new int[n][];
        for (int i = 0; i < n; i++) {
            cars[i] = new int[] { position[i], speed[i] };
        }
        Array.Sort(cars, (a, b) => b[0].CompareTo(a[0]));
        List<double> stack = new List<double>();
        foreach (var car in cars) {
            double t = (double)(target - car[0]) / car[1];
            if (stack.Count == 0 || t > stack[stack.Count - 1]) {
                stack.Add(t);
            }
        }
        return stack.Count;
    }
}
