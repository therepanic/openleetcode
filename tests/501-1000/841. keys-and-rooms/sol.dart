class Solution {
  bool canVisitAllRooms(List<List<int>> rooms) {
    int n = rooms.length;
    List<int> keys = [0];
    List<bool> visited = List.filled(n, false);
    visited[0] = true;
    int count = 1;
    while (keys.isNotEmpty) {
      int room = keys.removeLast();
      for (int i in rooms[room]) {
        if (!visited[i]) {
          visited[i] = true;
          keys.add(i);
          count++;
        }
      }
    }
    return count == n;
  }
}
