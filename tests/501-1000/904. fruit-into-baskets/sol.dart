class Solution {
  int totalFruit(List<int> fruits) {
    int start = 0;
    int maxLen = 0;
    Map<int, int> fruitCount = {};
    
    for (int end = 0; end < fruits.length; end++) {
      fruitCount[fruits[end]] = (fruitCount[fruits[end]] ?? 0) + 1;
      
      while (fruitCount.length > 2) {
        int leftFruit = fruits[start];
        fruitCount[leftFruit] = fruitCount[leftFruit]! - 1;
        if (fruitCount[leftFruit] == 0) {
          fruitCount.remove(leftFruit);
        }
        start++;
      }
      
      if (end - start + 1 > maxLen) {
        maxLen = end - start + 1;
      }
    }
    
    return maxLen;
  }
}
