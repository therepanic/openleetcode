class Solution {
public:
    int numRabbits(vector<int>& answers) {
        unordered_map<int, int> mpp;
        for (int a : answers) {
            mpp[a]++;
        }
        int total = 0;
        for (auto& [x, count] : mpp) {
            total += ceil((double)count / (x + 1)) * (x + 1);
        }
        return total;
    }
};
