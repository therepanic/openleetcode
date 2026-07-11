class Solution {
  int flipgame(List<int> fronts, List<int> backs) {
    var bad = <int>{};
    for (int i = 0; i < fronts.length; i++) {
      if (fronts[i] == backs[i]) {
        bad.add(fronts[i]);
      }
    }
    int best = 2001;
    for (int i = 0; i < fronts.length; i++) {
      if (!bad.contains(fronts[i]) && fronts[i] < best) {
        best = fronts[i];
      }
      if (!bad.contains(backs[i]) && backs[i] < best) {
        best = backs[i];
      }
    }
    return best <= 2000 ? best : 0;
  }
}
