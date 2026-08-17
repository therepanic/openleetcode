class Solution {
  bool isTransformable(String s, String t) {
    final sortedS = s.split('')..sort();
    final sortedT = t.split('')..sort();
    if (sortedS.join() != sortedT.join()) return false;
    
    List<List<int>> pos = List.generate(10, (_) => []);
    for (int i = 0; i < s.length; i++) {
      pos[int.parse(s[i])].add(i);
    }
            
    for (int i = 0; i < t.length; i++) {
      int dig = int.parse(t[i]);
      int idx = pos[dig].removeAt(0);
      for (int ii = 0; ii < dig; ii++) {
        if (pos[ii].isNotEmpty && pos[ii].first < idx) return false;
      }
    }
    return true;
  }
}
