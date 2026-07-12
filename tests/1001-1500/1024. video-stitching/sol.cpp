class Solution {
public:
    int videoStitching(vector<vector<int>>& clips, int time) {
        sort(clips.begin(), clips.end(), [](const vector<int>& a, const vector<int>& b) {
            return a[0] < b[0];
        });
        int end = 0;
        int farthest = 0;
        int res = 0;
        int i = 0;
        while (farthest < time) {
            int prevFarthest = farthest;
            while (i < clips.size() && clips[i][0] <= end) {
                farthest = max(farthest, clips[i][1]);
                i++;
            }
            if (farthest == prevFarthest) {
                return -1;
            }
            end = farthest;
            res++;
        }
        return res;
    }
};
