class Solution {
    public boolean isEscapePossible(int[][] blocked, int[] source, int[] target) {
        Set<String> blockedSet = new HashSet<>();
        for (int[] b : blocked) {
            blockedSet.add(b[0] + "," + b[1]);
        }
        int MAX = blocked.length * (blocked.length / 2 + 1);
        int[][] dirs = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};

        return bfs(source, target, blockedSet, MAX, dirs) && bfs(target, source, blockedSet, MAX, dirs);
    }

    private boolean bfs(int[] start, int[] end, Set<String> blockedSet, int MAX, int[][] dirs) {
        Set<String> visited = new HashSet<>();
        Queue<int[]> queue = new LinkedList<>();
        queue.offer(start);
        visited.add(start[0] + "," + start[1]);
        int count = 0;

        while (!queue.isEmpty()) {
            int[] cur = queue.poll();
            int x = cur[0], y = cur[1];
            if (x == end[0] && y == end[1]) return true;
            if (count > MAX) return true;

            for (int[] dir : dirs) {
                int nx = x + dir[0];
                int ny = y + dir[1];
                String key = nx + "," + ny;
                if (nx >= 0 && nx < 1000000 && ny >= 0 && ny < 1000000 && !visited.contains(key) && !blockedSet.contains(key)) {
                    visited.add(key);
                    queue.offer(new int[]{nx, ny});
                }
            }
            count++;
        }
        return false;
    }
}
