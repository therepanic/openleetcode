class Solution {
  String reverseStr(String s, int k) {
    var arr = s.split('');
    int step = 2 * k;
    for (int i = 0; i < arr.length; i += step) {
      int start = i;
      int end = (i + k - 1 < arr.length - 1) ? i + k - 1 : arr.length - 1;
      while (start < end) {
        var tmp = arr[start];
        arr[start] = arr[end];
        arr[end] = tmp;
        start++;
        end--;
      }
    }
    return arr.join('');
  }
}
