class Solution {
  int slidingPuzzle(List<List<int>> board) {
    String target = "123450";
    String start = board.expand((row) => row).join('');
    
    Map<int, List<int>> neighbors = {
      0: [1, 3], 1: [0, 2, 4], 2: [1, 5],
      3: [0, 4], 4: [1, 3, 5], 5: [2, 4]
    };
    
    Queue<MapEntry<String, int>> queue = Queue();
    Set<String> visited = {};
    
    queue.add(MapEntry(start, 0));
    visited.add(start);
    
    while (queue.isNotEmpty) {
      var entry = queue.removeFirst();
      String state = entry.key;
      int moves = entry.value;
      
      if (state == target) {
        return moves;
      }
      
      int zeroIndex = state.indexOf('0');
      
      for (int neighbor in neighbors[zeroIndex]!) {
        List<String> newStateList = state.split('');
        String temp = newStateList[zeroIndex];
        newStateList[zeroIndex] = newStateList[neighbor];
        newStateList[neighbor] = temp;
        String newState = newStateList.join('');
        
        if (!visited.contains(newState)) {
          visited.add(newState);
          queue.add(MapEntry(newState, moves + 1));
        }
      }
    }
    
    return -1;
  }
}
