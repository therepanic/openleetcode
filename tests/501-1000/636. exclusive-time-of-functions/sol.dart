class Solution {
  List<int> exclusiveTime(int n, List<String> logs) {
    List<List<int>> callstack = [];
    List<int> exectime = List.filled(n, 0);
    
    for (var log in logs) {
      var parts = log.split(":");
      int idn = int.parse(parts[0]);
      String status = parts[1];
      int curtime = int.parse(parts[2]);
      
      if (status == "start") {
        callstack.add([idn, curtime]);
      } else {
        var top = callstack.removeLast();
        int x = top[0];
        int y = top[1];
        int time = curtime - y + 1;
        exectime[x] += time;
        if (callstack.isNotEmpty) {
          x = callstack.last[0];
          exectime[x] -= time;
        }
      }
    }
    
    return exectime;
  }
}
