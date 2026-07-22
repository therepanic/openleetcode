class Solution {
  List<bool> canMakePaliQueries(String s, List<List<int>> queries) {
    int n = s.length;
    List<int> prefix = List.filled(n + 1, 0);
    
    for (int i = 0; i < n; i++) {
      int bit = 1 << (s.codeUnitAt(i) - 'a'.codeUnitAt(0));
      prefix[i + 1] = prefix[i] ^ bit;
    }
    
    List<bool> res = [];
    
    for (var query in queries) {
      int left = query[0];
      int right = query[1];
      int ki = query[2];
      
      int mask = prefix[right + 1] ^ prefix[left];
      int oddCount = mask.toRadixString(2).split('').where((c) => c == '1').length;
      
      if (oddCount <= 1 || ki >= oddCount ~/ 2) {
        res.add(true);
      } else {
        res.add(false);
      }
    }
    
    return res;
  }
}
