class Solution {
  String predictPartyVictory(String senate) {
    List<int> r = [];
    List<int> d = [];
    int n = senate.length;
    
    for (int i = 0; i < n; i++) {
      if (senate[i] == 'R') {
        r.add(i);
      } else {
        d.add(i);
      }
    }
    
    while (r.isNotEmpty && d.isNotEmpty) {
      int rIdx = r.removeAt(0);
      int dIdx = d.removeAt(0);
      
      if (rIdx < dIdx) {
        r.add(rIdx + n);
      } else {
        d.add(dIdx + n);
      }
    }
    
    return r.isNotEmpty ? "Radiant" : "Dire";
  }
}
