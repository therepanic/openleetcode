class Solution {
  int maxProduct(String s) {
    int n = s.length;
    List<List<int>> palinMasks = [];
    
    for (int mask = 1; mask < (1 << n); mask++) {
      StringBuffer sb = StringBuffer();
      for (int i = 0; i < n; i++) {
        if (((mask >> i) & 1) == 1) {
          sb.write(s[i]);
        }
      }
      String seq = sb.toString();
      if (seq == seq.split('').reversed.join()) {
        palinMasks.add([mask, mask.toRadixString(2).split('1').length - 1]);
      }
    }
    
    int maxProduct = 0;
    for (int i = 0; i < palinMasks.length; i++) {
      for (int j = i + 1; j < palinMasks.length; j++) {
        int m1 = palinMasks[i][0];
        int m2 = palinMasks[j][0];
        int l1 = palinMasks[i][1];
        int l2 = palinMasks[j][1];
        if ((m1 & m2) == 0) {
          maxProduct = max(maxProduct, l1 * l2);
        }
      }
    }
    
    return maxProduct;
  }
  
  int max(int a, int b) => a > b ? a : b;
}
