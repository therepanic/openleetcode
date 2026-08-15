class Solution {
  List<List<int>> splitPainting(List<List<int>> segments) {
    List<List<int>> events = [];
    for (var seg in segments) {
      events.add([seg[0], seg[2]]);
      events.add([seg[1], -seg[2]]);
    }
    events.sort((a, b) => a[0].compareTo(b[0]));
    
    List<List<int>> ans = [];
    int prev = -1;
    int mix = 0;
    for (var e in events) {
      if (prev != -1) {
        if (e[0] != prev && mix != 0) {
          ans.add([prev, e[0], mix]);
        }
      }
      prev = e[0];
      mix += e[1];
    }
    return ans;
  }
}
