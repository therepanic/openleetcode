class Solution {
public:
    int flipgame(vector<int>& fronts, vector<int>& backs) {
        unordered_set<int> bad;
        for (int i = 0; i < fronts.size(); i++) {
            if (fronts[i] == backs[i]) {
                bad.insert(fronts[i]);
            }
        }
        int best = 2001;
        for (int i = 0; i < fronts.size(); i++) {
            if (bad.find(fronts[i]) == bad.end() && fronts[i] < best) {
                best = fronts[i];
            }
            if (bad.find(backs[i]) == bad.end() && backs[i] < best) {
                best = backs[i];
            }
        }
        return best <= 2000 ? best : 0;
    }
};
