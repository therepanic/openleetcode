class Solution {

public:

    long long wonderfulSubstrings(string word) {

        long long count[1024] = {0};

        count[0] = 1;

        int mask = 0;

        long long res = 0;

        for (char ch : word) {

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

};
