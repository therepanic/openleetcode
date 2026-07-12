class Solution {
public:
    int numPairsDivisibleBy60(vector<int>& time) {
        vector<long long> remainders(60, 0);
        for (int t : time) {
            remainders[t % 60]++;
        }
        
        long long count = 0;
        count += remainders[0] * (remainders[0] - 1) / 2;
        count += remainders[30] * (remainders[30] - 1) / 2;
        
        for (int i = 1; i < 30; i++) {
            count += remainders[i] * remainders[60 - i];
        }
        
        return (int)count;
    }
};
