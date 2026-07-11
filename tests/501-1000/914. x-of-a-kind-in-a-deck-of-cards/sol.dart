class Solution {
  bool hasGroupsSizeX(List<int> deck) {
    Map<int, int> counts = {};
    for (int card in deck) {
      counts[card] = (counts[card] ?? 0) + 1;
    }
    
    int getGcd(int a, int b) {
      while (b > 0) {
        int temp = b;
        b = a % b;
        a = temp;
      }
      return a;
    }
    
    List<int> frequencies = counts.values.toList();
    int currentGcd = frequencies[0];
    
    for (int i = 1; i < frequencies.length; i++) {
      currentGcd = getGcd(currentGcd, frequencies[i]);
      if (currentGcd == 1) {
        return false;
      }
    }
    
    return currentGcd >= 2;
  }
}
