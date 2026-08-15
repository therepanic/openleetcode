class Solution {
public:
    int maxHappyGroups(int batchSize, vector<int>& groups) {
        vector<int> counts(batchSize, 0);
        int happyCount = 0;
        for (int g : groups) {
            int rem = g % batchSize;
            if (rem == 0) {
                happyCount++;
            } else {
                counts[rem]++;
            }
        }
        
        for (int i = 1; i <= batchSize / 2; i++) {
            if (i == batchSize - i) {
                int pairCount = counts[i] / 2;
                happyCount += pairCount;
                counts[i] %= 2;
            } else {
                int pairCount = min(counts[i], counts[batchSize - i]);
                happyCount += pairCount;
                counts[i] -= pairCount;
                counts[batchSize - i] -= pairCount;
            }
        }
        
        vector<int> state(counts.begin() + 1, counts.end());
        unordered_map<string, int> memo;
        return happyCount + viterbi(state, 0, batchSize, memo);
    }
    
    int viterbi(vector<int> counts, int leftover, int batchSize, unordered_map<string, int>& memo) {
        string key = "";
        for (int c : counts) key += to_string(c) + ",";
        key += to_string(leftover);
        if (memo.count(key)) return memo[key];
        
        int sum = 0;
        for (int c : counts) sum += c;
        if (sum == 0) {
            memo[key] = 0;
            return 0;
        }
        
        int res = 0;
        for (int i = 0; i < counts.size(); i++) {
            if (counts[i] > 0) {
                int rem = i + 1;
                vector<int> next = counts;
                next[i]--;
                
                int isHappy = (leftover == 0) ? 1 : 0;
                int newLeftover = (leftover + rem) % batchSize;
                
                int val = isHappy + viterbi(next, newLeftover, batchSize, memo);
                if (val > res) res = val;
            }
        }
        memo[key] = res;
        return res;
    }
};
