class Solution {
public:
    vector<string> findRelativeRanks(vector<int>& score) {
        int n = score.size();
        vector<int> sorted = score;
        sort(sorted.begin(), sorted.end(), greater<int>());
        unordered_map<int, string> ranks;
        for (int i = 0; i < n; i++) {
            ranks[sorted[i]] = to_string(i + 1);
        }
        ranks[sorted[0]] = "Gold Medal";
        if (n > 1) ranks[sorted[1]] = "Silver Medal";
        if (n > 2) ranks[sorted[2]] = "Bronze Medal";
        vector<string> result;
        for (int s : score) {
            result.push_back(ranks[s]);
        }
        return result;
    }
};
