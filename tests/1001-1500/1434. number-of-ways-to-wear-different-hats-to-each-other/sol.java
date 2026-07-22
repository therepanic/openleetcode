import java.util.ArrayList;
import java.util.List;

class Solution {
    public int numberWays(int[][] hats) {
        List<List<Integer>> people = new ArrayList<>();
        for (int[] choices : hats) {
            List<Integer> row = new ArrayList<>(choices.length);
            for (int hat : choices) {
                row.add(hat);
            }
            people.add(row);
        }
        return numberWays(people);
    }

    public int numberWays(List<List<Integer>> hats) {
        final int MOD = 1_000_000_007;
        int n = hats.size();
        List<List<Integer>> likedByHat = new ArrayList<>();
        likedByHat.add(new ArrayList<>());
        for (int i = 1; i <= 40; i++) {
            likedByHat.add(new ArrayList<>());
        }
        for (int person = 0; person < n; person++) {
            for (int hat : hats.get(person)) {
                likedByHat.get(hat).add(person);
            }
        }
        
        int[] dp = new int[1 << n];
        dp[0] = 1;
        for (int hat = 1; hat <= 40; hat++) {
            int[] updated = dp.clone();
            for (int mask = 0; mask < (1 << n); mask++) {
                if (dp[mask] == 0) continue;
                for (int person : likedByHat.get(hat)) {
                    int personBit = 1 << person;
                    if ((mask & personBit) == 0) {
                        int target = mask | personBit;
                        updated[target] = (updated[target] + dp[mask]) % MOD;
                    }
                }
            }
            dp = updated;
        }
        return dp[(1 << n) - 1];
    }
}
