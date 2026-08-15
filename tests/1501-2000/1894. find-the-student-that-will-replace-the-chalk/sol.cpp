class Solution {
public:
    int chalkReplacer(vector<int>& chalk, int k) {
        long long total = 0;
        for (int amount : chalk) total += amount;
        long long remaining = k % total;
        for (int i = 0; i < chalk.size(); i++) {
            if (remaining < chalk[i]) return i;
            remaining -= chalk[i];
        }
        return 0;
    }
};
