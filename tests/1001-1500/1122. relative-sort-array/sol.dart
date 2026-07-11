class Solution {
  List<int> relativeSortArray(List<int> arr1, List<int> arr2) {
    List<int> freq = List.filled(1001, 0);
    for (var num in arr1) {
      freq[num]++;
    }
    int idx = 0;
    for (var num in arr2) {
      while (freq[num] > 0) {
        arr1[idx++] = num;
        freq[num]--;
      }
    }
    for (int num = 0; num < 1001; num++) {
      while (freq[num] > 0) {
        arr1[idx++] = num;
        freq[num]--;
      }
    }
    return arr1;
  }
}
