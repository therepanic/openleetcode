class Solution {
  List<int> smallestMissingValueSubtree(List<int> parents, List<int> nums) {
    int n = parents.length;
    List<List<int>> graph = List.generate(n, (i) => []);
    int nodeOne = -1;
    int root = -1;
    
    for (int child = 0; child < n; child++) {
      if (parents[child] == -1) {
        root = child;
      } else {
        graph[parents[child]].add(child);
      }
      if (nums[child] == 1) nodeOne = child;
    }
    
    List<int> results = List.filled(n, 1);
    if (nodeOne == -1) return results;
    
    List<bool> seen = List.filled(100002, false);
    int current = nodeOne;
    int missing = 1;
    
    while (current != -1) {
      markSeen(current, graph, seen, nums);
      while (missing < 100002 && seen[missing]) missing++;
      results[current] = missing;
      current = parents[current];
    }
    
    return results;
  }
  
  void markSeen(int node, List<List<int>> graph, List<bool> seen, List<int> nums) {
    if (!seen[nums[node]]) {
      seen[nums[node]] = true;
      for (int child in graph[node]) {
        markSeen(child, graph, seen, nums);
      }
    }
  }
}
