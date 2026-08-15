import 'dart:collection';

class Solution {
  List<int> assignTasks(List<int> servers, List<int> tasks) {
    int n = servers.length;
    int m = tasks.length;
    
    SplayTreeMap<List<int>, int> available = SplayTreeMap<List<int>, int>(
      (a, b) {
        if (a[0] != b[0]) return a[0].compareTo(b[0]);
        return a[1].compareTo(b[1]);
      }
    );
    for (int i = 0; i < n; i++) {
      available[[servers[i], i]] = 0;
    }
    
    PriorityQueue<List<int>> busy = PriorityQueue<List<int>>(
      (a, b) => a[0].compareTo(b[0])
    );
    List<int> ans = List.filled(m, 0);
    int time = 0;
    
    for (int i = 0; i < m; i++) {
      time = time > i ? time : i;
      while (busy.isNotEmpty && busy.first[0] <= time) {
        List<int> s = busy.removeFirst();
        available[[s[1], s[2]]] = 0;
      }
      
      if (available.isEmpty) {
        time = busy.first[0];
        while (busy.isNotEmpty && busy.first[0] <= time) {
          List<int> s = busy.removeFirst();
          available[[s[1], s[2]]] = 0;
        }
      }
      
      List<int> key = available.firstKey()!;
      available.remove(key);
      busy.add([time + tasks[i], key[0], key[1]]);
      ans[i] = key[1];
    }
    
    return ans;
  }
}
