class Solution {
  bool canFinish(int numCourses, List<List<int>> prerequisites) {
    final graph = List.generate(numCourses, (_) => <int>[]);
    final indegree = List.filled(numCourses, 0);
    for (final edge in prerequisites) {
      graph[edge[1]].add(edge[0]);
      indegree[edge[0]]++;
    }
    final queue = <int>[];
    for (int i = 0; i < numCourses; i++) {
      if (indegree[i] == 0) queue.add(i);
    }
    int seen = 0;
    for (int head = 0; head < queue.length; head++) {
      final node = queue[head];
      seen++;
      for (final nxt in graph[node]) {
        indegree[nxt]--;
        if (indegree[nxt] == 0) queue.add(nxt);
      }
    }
    return seen == numCourses;
  }
}
