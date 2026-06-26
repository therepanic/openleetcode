class Solution {
    public int leastBricks(List<List<Integer>> wall) {
        Map<Integer, Integer> edgeCounts = new HashMap<>();
        for (List<Integer> row : wall) {
            int edge = 0;
            for (int i = 0; i < row.size() - 1; i++) {
                edge += row.get(i);
                edgeCounts.put(edge, edgeCounts.getOrDefault(edge, 0) + 1);
            }
        }
        int maxEdges = 0;
        for (int count : edgeCounts.values()) {
            maxEdges = Math.max(maxEdges, count);
        }
        return wall.size() - maxEdges;
    }
}
