class Solution {
    public int nearestExit(char[][] maze, int[] entrance) {
        int n = maze.length, m = maze[0].length;
        boolean[][] visited = new boolean[n][m];
        Queue<int[]> q = new LinkedList<>();
        q.add(new int[]{entrance[0], entrance[1], 0});
        visited[entrance[0]][entrance[1]] = true;
        int[][] dirs = {{-1,0},{1,0},{0,-1},{0,1}};
        
        while(!q.isEmpty()) {
            int[] cell = q.poll();
            int r = cell[0], c = cell[1], dist = cell[2];
            for(int[] d : dirs) {
                int nr = r + d[0], nc = c + d[1];
                if(nr >= 0 && nc >= 0 && nr < n && nc < m && !visited[nr][nc] && maze[nr][nc] == '.') {
                    visited[nr][nc] = true;
                    if(nr == 0 || nc == 0 || nr == n-1 || nc == m-1) return dist+1;
                    q.add(new int[]{nr, nc, dist+1});
                }
            }
        }
        return -1;
    }
}
