class Solution {
    public int minimumEffortPath(int[][] heights) {
        if (heights == null || heights.length == 0) return 0;
        int rows = heights.length, cols = heights[0].length;
        PriorityQueue<int[]> pq = new PriorityQueue<>((a, b) -> a[0] - b[0]);
        pq.offer(new int[]{0, 0, 0});
        int maxEffort = 0;
        boolean[][] visited = new boolean[rows][cols];
        int[][] dirs = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
        while (!pq.isEmpty()) {
            int[] curr = pq.poll();
            int effort = curr[0], r = curr[1], c = curr[2];
            maxEffort = Math.max(maxEffort, effort);
            if (r == rows - 1 && c == cols - 1) return maxEffort;
            if (visited[r][c]) continue;
            visited[r][c] = true;
            for (int[] d : dirs) {
                int nr = r + d[0], nc = c + d[1];
                if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && !visited[nr][nc]) {
                    int newEffort = Math.abs(heights[nr][nc] - heights[r][c]);
                    pq.offer(new int[]{newEffort, nr, nc});
                }
            }
        }
        return maxEffort;
    }
}
