class Solution {
public:
    vector<int> decode(vector<int>& encoded, int first) {
        vector<int> arr = {first};
        for (int e : encoded) {
            arr.push_back(arr.back() ^ e);
        }
        return arr;
    }
};
