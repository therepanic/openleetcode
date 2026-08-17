class Solution {
  int stoneGameVI(List<int> aliceValues, List<int> bobValues) {
    int n = aliceValues.length;
    List<List<int>> combined = List.generate(n, (i) => [aliceValues[i] + bobValues[i], aliceValues[i], bobValues[i]]);
    combined.sort((a, b) => b[0].compareTo(a[0]));

    int alice = 0, bob = 0;
    for (int i = 0; i < n; i++) {
      if (i % 2 == 0) {
        alice += combined[i][1];
      } else {
        bob += combined[i][2];
      }
    }

    if (alice > bob) return 1;
    else if (alice < bob) return -1;
    else return 0;
  }
}
