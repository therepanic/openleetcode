class Solution {
  int minWastedSpace(List<int> packages, List<List<int>> boxes) {
    packages.sort();
    int n = packages.length;
    int totalPackageSum = packages.reduce((a, b) => a + b);
    
    int minGrossArea = 1 << 62;
    
    for (List<int> supplierBoxes in boxes) {
      supplierBoxes.sort();
      if (supplierBoxes.last < packages[n - 1]) continue;
      
      int grossArea = 0;
      int lowIdx = 0;
      
      for (int b in supplierBoxes) {
        int highIdx = upperBound(packages, b, lowIdx);
        int count = highIdx - lowIdx;
        if (count > 0) {
          grossArea += b * count;
          lowIdx = highIdx;
        }
        if (lowIdx == n) break;
      }
      
      if (grossArea < minGrossArea) minGrossArea = grossArea;
    }
    
    if (minGrossArea == 1 << 62) return -1;
    return (minGrossArea - totalPackageSum) % 1000000007;
  }
  
  int upperBound(List<int> arr, int target, int lo) {
    int hi = arr.length;
    while (lo < hi) {
      int mid = lo + (hi - lo) ~/ 2;
      if (arr[mid] <= target) lo = mid + 1;
      else hi = mid;
    }
    return lo;
  }
}
