class Solution {
  List<int> movesToStamp(String stamp, String target) {
    int m = stamp.length;
    int n = target.length;
    List<String> stampArr = stamp.split('');
    List<String> targetArr = target.split('');
    
    bool canStamp(int i) {
      for (int j = 0; j < m; j++) {
        if (targetArr[i + j] != '?' && targetArr[i + j] != stampArr[j]) {
          return false;
        }
      }
      return true;
    }
    
    void applyStamp(int i) {
      for (int j = 0; j < m; j++) {
        targetArr[i + j] = '?';
      }
    }
    
    List<bool> stamped = List.filled(n, false);
    List<int> result = [];
    List<int> queue = [];
    
    for (int i = 0; i <= n - m; i++) {
      if (canStamp(i)) {
        applyStamp(i);
        queue.add(i);
        result.add(i);
        stamped[i] = true;
      }
    }
    
    while (queue.isNotEmpty) {
      int pos = queue.removeAt(0);
      int start = (pos - m + 1).clamp(0, n - m);
      int end = (pos + m).clamp(0, n - m);
      for (int i = start; i <= end; i++) {
        if (canStamp(i)) {
          if (!stamped[i]) {
            applyStamp(i);
            queue.add(i);
            result.add(i);
            stamped[i] = true;
          }
        }
      }
    }
    
    if (targetArr.every((c) => c == '?')) {
      return result.reversed.toList();
    }
    return [];
  }
}
