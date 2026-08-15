class Solution {
public:
    int minDeletions(string s) {
        vector<int> count(26, 0);
        for (char c : s) {
            count[c - 'a']++;
        }
        vector<int> freqs;
        for (int f : count) {
            if (f > 0) freqs.push_back(f);
        }
        sort(freqs.rbegin(), freqs.rend());
        int deletes = 0;
        for (int idx = 1; idx < freqs.size(); idx++) {
            if (freqs[idx] >= freqs[idx - 1]) {
                int target = max(0, freqs[idx - 1] - 1);
                deletes += (freqs[idx] - target);
                freqs[idx] = target;
            }
        }
        return deletes;
    }
};
