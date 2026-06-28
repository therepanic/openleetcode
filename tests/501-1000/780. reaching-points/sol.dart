class Solution {
  bool reachingPoints(int sx, int sy, int tx, int ty) {
    while (tx >= sx && ty >= sy) {
      if (tx == sx) {
        return (ty - sy) % tx == 0;
      }
      if (ty == sy) {
        return (tx - sx) % ty == 0;
      }
      if (ty > tx) {
        ty = ty % tx;
      } else {
        tx = tx % ty;
      }
    }
    return false;
  }
}
