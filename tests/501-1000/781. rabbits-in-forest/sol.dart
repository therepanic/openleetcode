class Solution {
  int numRabbits(List<int> answers) {
    Map<int, int> mpp = {};
    for (var a in answers) {
      mpp[a] = (mpp[a] ?? 0) + 1;
    }
    int total = 0;
    mpp.forEach((x, count) {
      total += (count / (x + 1)).ceil() * (x + 1);
    });
    return total;
  }
}
