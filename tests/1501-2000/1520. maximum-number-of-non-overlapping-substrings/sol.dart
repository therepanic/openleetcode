class Solution {
  List<String> maxNumOfSubstrings(String s) {
    int n = s.length;
    Map<String, int> counts = {};
    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      counts[c] = (counts[c] ?? 0) + 1;
    }
    Map<String, int> first = {};
    Map<String, int> last = {};
    counts.forEach((k, v) {
      first[k] = s.indexOf(k);
      last[k] = s.lastIndexOf(k);
    });
    
    List<String> res = [];
    List<List<int>> queue = [];
    
    counts.forEach((k, v) {
      queue.insert(0, [first[k]!, last[k]!, v]);
      int left = 1 << 62;
      int right = -(1 << 62);
      int total = 0;
      
      for (var arr in queue) {
        total += arr[2];
        if (arr[0] < left) left = arr[0];
        if (arr[1] > right) right = arr[1];
        if (total == right - left + 1) {
          break;
        }
      }
      
      if (total == right - left + 1) {
        res.add(s.substring(left, right + 1));
        queue = [];
      }
    });
    
    return res;
  }
}
