import java.util.*;

class Solution {
    public int[] shortestAlternatingPaths(int n, int[][] redEdges, int[][] blueEdges) {
        List<List<Integer>> red = new ArrayList<>();
        List<List<Integer>> blue = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            red.add(new ArrayList<>());
            blue.add(new ArrayList<>());
        }
        for (int[] edge : redEdges) red.get(edge[0]).add(edge[1]);
        for (int[] edge : blueEdges) blue.get(edge[0]).add(edge[1]);

        int[] answer = new int[n];
        Arrays.fill(answer, -1);
        boolean[][] seen = new boolean[n][2];
        ArrayDeque<int[]> queue = new ArrayDeque<>();
        queue.offer(new int[] {0, 0});
        queue.offer(new int[] {0, 1});
        seen[0][0] = seen[0][1] = true;
        int distance = 0;

        while (!queue.isEmpty()) {
            for (int count = queue.size(); count > 0; count--) {
                int[] state = queue.poll();
                int node = state[0];
                int lastColor = state[1];
                if (answer[node] == -1) answer[node] = distance;
                List<List<Integer>> nextGraph = lastColor == 0 ? blue : red;
                int nextColor = 1 - lastColor;
                for (int next : nextGraph.get(node)) {
                    if (!seen[next][nextColor]) {
                        seen[next][nextColor] = true;
                        queue.offer(new int[] {next, nextColor});
                    }
                }
            }
            distance++;
        }
        return answer;
    }
}
