class Solution {
  List<List<int>> allPathsSourceTarget(List<List<int>> graph) {
    int target = graph.length - 1;
    List<List<int>> result = [];
    
    List<List<dynamic>> queue = [[0, [0]]];
    
    while (queue.isNotEmpty) {
        var current = queue.removeAt(0);
        int node = current[0];
        List<int> path = List<int>.from(current[1]);
        
        if (node == target) {
            result.add(path);
            continue;
        }
        
        for (int neighbor in graph[node]) {
            queue.add([neighbor, [...path, neighbor]]);
        }
    }
    
    return result;
  }
}
