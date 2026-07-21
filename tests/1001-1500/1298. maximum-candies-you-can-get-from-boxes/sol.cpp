class Solution {
public:
    int maxCandies(vector<int>& status, vector<int>& candies, vector<vector<int>>& keys, vector<vector<int>>& containedBoxes, vector<int>& initialBoxes) {
        unordered_set<int> owned(initialBoxes.begin(), initialBoxes.end());
        unordered_set<int> opened;
        bool changed = true;
        int totalCandies = 0;
        while (changed) {
            changed = false;
            vector<int> ownedVec(owned.begin(), owned.end());
            for (int boxId : ownedVec) {
                if (opened.count(boxId) || status[boxId] == 0) continue;
                opened.insert(boxId);
                changed = true;
                totalCandies += candies[boxId];
                for (int keyId : keys[boxId]) {
                    status[keyId] = 1;
                }
                for (int box : containedBoxes[boxId]) {
                    owned.insert(box);
                }
            }
        }
        return totalCandies;
    }
};
