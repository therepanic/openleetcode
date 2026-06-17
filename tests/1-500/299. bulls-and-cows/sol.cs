public class Solution {
    public string GetHint(string secret, string guess) {
        int bulls = 0;
        int[] secretCounts = new int[10];
        int[] guessCounts = new int[10];

        for (int i = 0; i < secret.Length; i++) {
            if (secret[i] == guess[i]) {
                bulls++;
            } else {
                secretCounts[secret[i] - '0']++;
                guessCounts[guess[i] - '0']++;
            }
        }

        int cows = 0;
        for (int i = 0; i < 10; i++) {
            cows += Math.Min(secretCounts[i], guessCounts[i]);
        }
        return $"{bulls}A{cows}B";
    }
}
