class Solution {
  int minFlips(String target) {
    int minCount = 0;
    int flag = 0;
    int n = target.length;
    
    for (int i = 0; i < n; i++) {
      String expected = String.fromCharCode(48 + flag % 2);
      if (target[i] != expected) {
        minCount++;
        flag++;
      }
    }
    
    return minCount;
  }
}
