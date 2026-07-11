class Solution {
  List<int> fairCandySwap(List<int> aliceSizes, List<int> bobSizes) {
    int sumA = aliceSizes.reduce((a, b) => a + b);
    int sumB = bobSizes.reduce((a, b) => a + b);
    int diff = (sumB - sumA) ~/ 2;
    var setB = bobSizes.toSet();
    for (int a in aliceSizes) {
      if (setB.contains(a + diff)) {
        return [a, a + diff];
      }
    }
    return [];
  }
}
