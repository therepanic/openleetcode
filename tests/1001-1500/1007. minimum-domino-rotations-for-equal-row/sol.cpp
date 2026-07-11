class Solution {
public:
    int minDominoRotations(vector<int>& tops, vector<int>& bottoms) {
        int n = tops.size();
        int res = INT_MAX;
        vector<int> face(7, 0);
        for (int i = 0; i < n; i++) {
            face[tops[i]]++;
            if (bottoms[i] != tops[i]) {
                face[bottoms[i]]++;
            }
        }
        for (int x = 1; x <= 6; x++) {
            if (face[x] < n) {
                continue;
            }
            int maintainTop = 0;
            int maintainBottom = 0;
            bool possible = true;
            for (int i = 0; i < n; i++) {
                if (tops[i] != x) {
                    maintainTop++;
                }
                if (bottoms[i] != x) {
                    maintainBottom++;
                }
            }
            if (possible) {
                res = min(res, min(maintainTop, maintainBottom));
            }
        }
        return res == INT_MAX ? -1 : res;
    }
};
