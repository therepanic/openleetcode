public class Solution {

    public long WonderfulSubstrings(string word) {

        long[] count = new long[1024];

        count[0] = 1;

        int mask = 0;

        long res = 0;

        foreach (char ch in word) {

            int bit = ch - 'a';

            mask ^= (1 << bit);

            res += count[mask];

            for (int i = 0; i < 10; i++) {

                res += count[mask ^ (1 << i)];

            }

            count[mask]++;

        }

        return res;

    }

}
