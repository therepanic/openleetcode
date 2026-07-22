class Solution {
  int numOfMinutes(int n, int headID, List<int> manager, List<int> informTime) {
    var children = List.generate(n, (_) => <int>[]);
    for (int employee = 0; employee < n; employee++) {
      int parent = manager[employee];
      if (parent != -1) {
        children[parent].add(employee);
      }
    }
    var stack = <List<int>>[];
    stack.add([headID, 0]);
    int answer = 0;
    while (stack.isNotEmpty) {
      var pair = stack.removeLast();
      int employee = pair[0];
      int elapsed = pair[1];
      if (elapsed > answer) {
        answer = elapsed;
      }
      for (int child in children[employee]) {
        stack.add([child, elapsed + informTime[employee]]);
      }
    }
    return answer;
  }
}
