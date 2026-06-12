using System.Collections.Generic;

public class Solution {
    public bool CanFinish(int numCourses, int[][] prerequisites) {
        var graph = new List<int>[numCourses];
        for (int i = 0; i < numCourses; i++) graph[i] = new List<int>();
        var indegree = new int[numCourses];
        foreach (var edge in prerequisites) {
            graph[edge[1]].Add(edge[0]);
            indegree[edge[0]]++;
        }
        var queue = new Queue<int>();
        for (int i = 0; i < numCourses; i++) if (indegree[i] == 0) queue.Enqueue(i);
        int seen = 0;
        while (queue.Count > 0) {
            int node = queue.Dequeue();
            seen++;
            foreach (int nxt in graph[node]) {
                indegree[nxt]--;
                if (indegree[nxt] == 0) queue.Enqueue(nxt);
            }
        }
        return seen == numCourses;
    }
}
