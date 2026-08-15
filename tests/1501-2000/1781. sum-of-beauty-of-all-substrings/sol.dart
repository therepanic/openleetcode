class Solution {
  int beautySum(String s) {
    int n = s.length;
    int sumOfBeauty = 0;
    for (int i = 0; i < n; i++) {
      List<int> freq = List.filled(26, 0);
      for (int j = i; j < n; j++) {
        freq[s.codeUnitAt(j) - 97]++;
        int maxi = -1;
        int mini = 1 << 30;
        for (int diff in freq) {
          if (diff > 0) {
            if (diff > maxi) maxi = diff;
            if (diff < mini) mini = diff;
          }
        }
        sumOfBeauty += maxi - mini;
      }
    }
    return sumOfBeauty;
  }
}
