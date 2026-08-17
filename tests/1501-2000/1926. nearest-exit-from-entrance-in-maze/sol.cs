public class Solution {
    public int NearestExit(char[][] maze, int[] entrance) {
        int n = maze.Length, m = maze[0].Length;
        bool[,] visited = new bool[n,m];
        Queue<(int,int,int)> q = new Queue<(int,int,int)>();
        q.Enqueue((entrance[0], entrance[1], 0));
        visited[entrance[0], entrance[1]] = true;
        int[][] dirs = new int[][] { new int[]{-1,0}, new int[]{1,0}, new int[]{0,-1}, new int[]{0,1} };
        
        while(q.Count > 0) {
            var (r, c, dist) = q.Dequeue();
            foreach(var d in dirs) {
                int nr = r + d[0], nc = c + d[1];
                if(nr >= 0 && nc >= 0 && nr < n && nc < m && !visited[nr,nc] && maze[nr][nc] == '.') {
                    visited[nr,nc] = true;
                    if(nr == 0 || nc == 0 || nr == n-1 || nc == m-1) return dist+1;
                    q.Enqueue((nr, nc, dist+1));
                }
            }
        }
        return -1;
    }
}
