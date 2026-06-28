class Solution {
  List<int> asteroidCollision(List<int> asteroids) {
    List<int> res = [];
    for (int a in asteroids) {
      bool destroyed = false;
      while (res.isNotEmpty && a < 0 && res.last > 0) {
        if (-a > res.last) {
          res.removeLast();
          continue;
        } else if (-a == res.last) {
          res.removeLast();
        }
        destroyed = true;
        break;
      }
      if (!destroyed) {
        res.add(a);
      }
    }
    return res;
  }
}
