class Solution {
public:
    int leastInterval(vector<char>& tasks, int n) {
        unordered_map<char, int> count;
        for (char t : tasks) {
            count[t]++;
        }
        int f_max = 0;
        for (auto& p : count) {
            f_max = max(f_max, p.second);
        }
        int max_count = 0;
        for (auto& p : count) {
            if (p.second == f_max) max_count++;
        }
        return max((int)tasks.size(), (f_max - 1) * (n + 1) + max_count);
    }
};
