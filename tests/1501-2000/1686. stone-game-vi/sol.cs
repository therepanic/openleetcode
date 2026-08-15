public class Solution {
    public int StoneGameVI(int[] aliceValues, int[] bobValues) {
        int n = aliceValues.Length;
        var combined = new List<(int, int, int)>();
        for (int i = 0; i < n; i++) {
            combined.Add((aliceValues[i] + bobValues[i], aliceValues[i], bobValues[i]));
        }
        combined.Sort((a, b) => b.Item1.CompareTo(a.Item1));

        int alice = 0, bob = 0;
        for (int i = 0; i < n; i++) {
            if (i % 2 == 0) {
                alice += combined[i].Item2;
            } else {
                bob += combined[i].Item3;
            }
        }

        if (alice > bob) return 1;
        else if (alice < bob) return -1;
        else return 0;
    }
}
