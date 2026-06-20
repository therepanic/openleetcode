class Solution {
    public int numberOfBoomerangs(int[][] points) {
        int result = 0;
        for (int[] p : points) {
            java.util.HashMap<Integer, Integer> distances = new java.util.HashMap<>();
            for (int[] q : points) {
                int d = (p[0] - q[0]) * (p[0] - q[0]) + (p[1] - q[1]) * (p[1] - q[1]);
                distances.put(d, distances.getOrDefault(d, 0) + 1);
            }
            for (int count : distances.values()) {
                result += count * (count - 1);
            }
        }
        return result;
    }
}
