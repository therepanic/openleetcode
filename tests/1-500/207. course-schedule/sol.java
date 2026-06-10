import java.util.*;

class Solution {
    public boolean canFinish(int numCourses, int[][] prerequisites) {
        List<List<Integer>> graph = new ArrayList<>(numCourses);
        for (int i = 0; i < numCourses; i++) graph.add(new ArrayList<>());
        int[] indegree = new int[numCourses];
        for (int[] edge : prerequisites) {
            graph.get(edge[1]).add(edge[0]);
            indegree[edge[0]]++;
        }
        ArrayDeque<Integer> queue = new ArrayDeque<>();
        for (int i = 0; i < numCourses; i++) if (indegree[i] == 0) queue.offer(i);
        int seen = 0;
        while (!queue.isEmpty()) {
            int node = queue.poll();
            seen++;
            for (int nxt : graph.get(node)) {
                if (--indegree[nxt] == 0) queue.offer(nxt);
            }
        }
        return seen == numCourses;
    }
}
