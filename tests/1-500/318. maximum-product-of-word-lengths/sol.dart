class Solution {
  int maxProduct(List<String> words) {
    int n = words.length;
    List<int> bitmasks = List.filled(n, 0);
    for (int i = 0; i < n; i++) {
      int mask = 0;
      for (int j = 0; j < words[i].length; j++) {
        mask |= 1 << (words[i].codeUnitAt(j) - 'a'.codeUnitAt(0));
      }
      bitmasks[i] = mask;
    }
    int maxProd = 0;
    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        if ((bitmasks[i] & bitmasks[j]) == 0) {
          int prod = words[i].length * words[j].length;
          if (prod > maxProd) {
            maxProd = prod;
          }
        }
      }
    }
    return maxProd;
  }
}
