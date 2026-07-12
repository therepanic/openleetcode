class Solution {
public:
    string largestTimeFromDigits(vector<int>& arr) {
        vector<vector<int>> permList;
        permute(arr, 0, permList);
        
        int bestTime = -1;
        int bestIdx = -1;
        
        for (int i = 0; i < permList.size(); i++) {
            auto& perm = permList[i];
            int hours = perm[0] * 10 + perm[1];
            int minutes = perm[2] * 10 + perm[3];
            
            if (hours < 24 && minutes < 60) {
                int currTime = hours * 60 + minutes;
                if (currTime > bestTime) {
                    bestTime = currTime;
                    bestIdx = i;
                }
            }
        }
        
        if (bestIdx == -1) return "";
        
        auto& res = permList[bestIdx];
        return to_string(res[0]) + to_string(res[1]) + ":" + to_string(res[2]) + to_string(res[3]);
    }
    
private:
    void permute(vector<int>& arr, int start, vector<vector<int>>& result) {
        if (start == arr.size()) {
            result.push_back(arr);
            return;
        }
        for (int i = start; i < arr.size(); i++) {
            swap(arr[start], arr[i]);
            permute(arr, start + 1, result);
            swap(arr[start], arr[i]);
        }
    }
};
