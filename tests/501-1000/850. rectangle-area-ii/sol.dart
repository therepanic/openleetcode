class Solution {
  int rectangleArea(List<List<int>> rectangles) {
    const int OPEN = 0;
    const int CLOSE = 1;
    const int MOD = 1000000007;
    
    List<List<int>> events = [];
    for (var r in rectangles) {
      int x1 = r[0], y1 = r[1], x2 = r[2], y2 = r[3];
      events.add([y1, OPEN, x1, x2]);
      events.add([y2, CLOSE, x1, x2]);
    }
    events.sort((a, b) => a[0].compareTo(b[0]));
    
    int res = 0;
    int curY = events[0][0];
    List<List<int>> active = [];
    
    for (var e in events) {
      int y = e[0], typ = e[1], x1 = e[2], x2 = e[3];
      
      int q = 0;
      int cur = -1;
      active.sort((a, b) => a[0].compareTo(b[0]));
      for (var seg in active) {
        q += max(0, seg[1] - max(cur, seg[0]));
        cur = max(cur, seg[1]);
      }
      
      res = (res + q * (y - curY)) % MOD;
      curY = y;
      
      if (typ == OPEN) {
        active.add([x1, x2]);
      } else {
        final index = active.indexWhere((seg) => seg[0] == x1 && seg[1] == x2);
        if (index >= 0) active.removeAt(index);
      }
    }
    
    return res;
  }
}
