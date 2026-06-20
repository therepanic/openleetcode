public class Solution {
    public int NumberOfBoomerangs(int[][] points) {
        int result = 0;
        foreach (var p in points) {
            var distances = new Dictionary<int, int>();
            foreach (var q in points) {
                int d = (p[0] - q[0]) * (p[0] - q[0]) + (p[1] - q[1]) * (p[1] - q[1]);
                if (distances.ContainsKey(d)) {
                    distances[d]++;
                } else {
                    distances[d] = 1;
                }
            }
            foreach (var count in distances.Values) {
                result += count * (count - 1);
            }
        }
        return result;
    }
}
