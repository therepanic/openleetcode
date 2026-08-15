class Solution {
  String modifyString(String s) {
    List<String> arr = s.split('');
    int n = arr.length;
    for (int i = 0; i < n; i++) {
      if (arr[i] == '?') {
        String left = i > 0 ? arr[i-1] : ' ';
        String right = i+1 < n ? arr[i+1] : ' ';
        if (left != 'a' && right != 'a') {
          arr[i] = 'a';
        } else if (left != 'b' && right != 'b') {
          arr[i] = 'b';
        } else {
          arr[i] = 'c';
        }
      }
    }
    return arr.join();
  }
}
