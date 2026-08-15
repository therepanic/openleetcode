class Solution {
  int reinitializePermutation(int n) {
    List<int> original = List<int>.generate(n, (i) => i);
    List<int> permut = List<int>.from(original);
    List<int> arr = List<int>.filled(n, 0);
    int count = 0;
    while (true) {
      for (int i = 0; i < n; i++) {
        if (i % 2 == 0) {
          arr[i] = permut[i ~/ 2];
        } else {
          arr[i] = permut[n ~/ 2 + (i - 1) ~/ 2];
        }
      }
      permut = List<int>.from(arr);
      count++;
      bool equal = true;
      for (int i = 0; i < n; i++) {
        if (permut[i] != original[i]) {
          equal = false;
          break;
        }
      }
      if (equal) break;
    }
    return count;
  }
}
