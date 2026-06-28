class Solution {
  int numMatchingSubseq(String s, List<String> words) {
    int n = s.length;
    Map<String, List<int>> mp = {};
    for (int i = 0; i < n; i++) {
      String c = s[i];
      mp.putIfAbsent(c, () => []);
      mp[c]!.add(i);
    }
    for (int i = 0; i < 26; i++) {
      String c = String.fromCharCode('a'.codeUnitAt(0) + i);
      mp.putIfAbsent(c, () => []);
      mp[c]!.add(n);
      mp[c]!.sort();
    }
    
    bool found(String word) {
      int curr = -1;
      for (int i = 0; i < word.length; i++) {
        if (curr >= n) return false;
        String c = word[i];
        List<int> arr = mp[c]!;
        int idx = _lowerBound(arr, curr + 1);
        curr = arr[idx];
      }
      return curr < n;
    }
    
    int cnt = 0;
    for (String word in words) {
      if (found(word)) cnt++;
    }
    return cnt;
  }
  
  int _lowerBound(List<int> arr, int target) {
    int left = 0, right = arr.length;
    while (left < right) {
      int mid = left + (right - left) ~/ 2;
      if (arr[mid] < target) {
        left = mid + 1;
      } else {
        right = mid;
      }
    }
    return left;
  }
}
