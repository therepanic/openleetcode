import 'dart:collection';

class Solution {
  List<int> busiestServers(int k, List<int> arrival, List<int> load) {
    var available = PriorityQueue<int>((a, b) => a - b);
    for (var i = 0; i < k; i++) available.add(i);
    var busy = PriorityQueue<List<int>>((a, b) => a[0] - b[0]);
    var res = List<int>.filled(k, 0);
    for (var i = 0; i < arrival.length; i++) {
      var a = arrival[i];
      while (busy.isNotEmpty && busy.first[0] <= a) {
        var x = busy.removeFirst()[1];
        available.add(i + (x - i) % k);
      }
      if (available.isNotEmpty) {
        var j = available.removeFirst() % k;
        busy.add([a + load[i], j]);
        res[j]++;
      }
    }
    var max = res.reduce((a, b) => a > b ? a : b);
    var ans = <int>[];
    for (var i = 0; i < k; i++) {
      if (res[i] == max) ans.add(i);
    }
    return ans;
  }
}
