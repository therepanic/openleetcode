class Solution {
  int maxCompatibilitySum(List<List<int>> students, List<List<int>> mentors) {
    int m = students.length;
    int maxScore = 0;
    List<int> perm = List.generate(m, (i) => i);
    do {
      int total = 0;
      for (int i = 0; i < m; i++) {
        for (int j = 0; j < students[i].length; j++) {
          if (students[i][j] == mentors[perm[i]][j]) total++;
        }
      }
      if (total > maxScore) maxScore = total;
    } while (nextPermutation(perm));
    return maxScore;
  }
  
  bool nextPermutation(List<int> a) {
    int n = a.length;
    int i = n - 2;
    while (i >= 0 && a[i] >= a[i+1]) i--;
    if (i < 0) return false;
    int j = n - 1;
    while (a[j] <= a[i]) j--;
    int t = a[i]; a[i] = a[j]; a[j] = t;
    for (int l = i+1, r = n-1; l < r; l++, r--) {
      t = a[l]; a[l] = a[r]; a[r] = t;
    }
    return true;
  }
}
