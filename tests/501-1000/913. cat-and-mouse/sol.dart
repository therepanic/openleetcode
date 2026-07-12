import 'dart:collection';

class Solution {
  int catMouseGame(List<List<int>> graph) {
    const MOUSE = 0;
    const CAT = 1;
    const MOUSE_WIN = 1;
    const CAT_WIN = 2;
    const DRAW = 0;
    
    int n = graph.length;
    Map<String, int> results = {};
    for (int i = 1; i < n; i++) {
      results['0,$i,$CAT'] = MOUSE_WIN;
      results['0,$i,$MOUSE'] = MOUSE_WIN;
      results['$i,$i,$CAT'] = CAT_WIN;
      results['$i,$i,$MOUSE'] = CAT_WIN;
    }
    
    Map<String, int> degree = {};
    for (int mouse = 1; mouse < n; mouse++) {
      for (int cat = 1; cat < n; cat++) {
        degree['$mouse,$cat,$MOUSE'] = graph[mouse].length;
        degree['$mouse,$cat,$CAT'] = graph[cat].where((x) => x != 0).length;
      }
    }
    
    Queue<String> q = Queue<String>();
    q.addAll(results.keys);
    
    while (q.isNotEmpty) {
      String state = q.removeFirst();
      List<String> parts = state.split(',');
      int mouse = int.parse(parts[0]);
      int cat = int.parse(parts[1]);
      int turn = int.parse(parts[2]);
      int curResult = results[state]!;
      
      List<String> prevStates = [];
      if (turn == MOUSE) {
        for (int prevCat in graph[cat]) {
          prevStates.add('$mouse,$prevCat,$CAT');
        }
      } else {
        for (int prevMouse in graph[mouse]) {
          prevStates.add('$prevMouse,$cat,$MOUSE');
        }
      }
      
      for (String prevState in prevStates) {
        if (results.containsKey(prevState)) continue;
        List<String> prevParts = prevState.split(',');
        int prevMouse = int.parse(prevParts[0]);
        int prevCat = int.parse(prevParts[1]);
        int prevTurn = int.parse(prevParts[2]);
        if (prevCat == 0) continue;
        
        degree[prevState] = degree[prevState]! - 1;
        bool isMoverWinner = ((curResult == MOUSE_WIN && prevTurn == MOUSE) ||
                              (curResult == CAT_WIN && prevTurn == CAT));
        if (isMoverWinner || degree[prevState] == 0) {
          results[prevState] = curResult;
          q.add(prevState);
        }
      }
    }
    
    return results['1,2,$MOUSE'] ?? DRAW;
  }
}
