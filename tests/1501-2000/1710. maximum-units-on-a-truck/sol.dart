class Solution {
  int maximumUnits(List<List<int>> boxTypes, int truckSize) {
    boxTypes.sort((a, b) => b[1].compareTo(a[1]));
    int ans = 0;
    int remaining = truckSize;
    for (var box in boxTypes) {
      int quantitytaken = box[0] < remaining ? box[0] : remaining;
      ans += box[1] * quantitytaken;
      remaining -= quantitytaken;
      if (remaining == 0) break;
    }
    return ans;
  }
}
