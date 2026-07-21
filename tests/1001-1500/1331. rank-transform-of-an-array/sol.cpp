class Solution {
public:
    vector<int> arrayRankTransform(vector<int>& arr) {
        vector<int> s = arr;
        sort(s.begin(), s.end());
        vector<int> unique;
        for (int x : s) {
            if (unique.empty() || unique.back() != x) {
                unique.push_back(x);
            }
        }
        for (int i = 0; i < arr.size(); i++) {
            arr[i] = bisect_left(unique, arr[i]) + 1;
        }
        return arr;
    }
    
private:
    int bisect_left(vector<int>& a, int x) {
        int lo = 0, hi = a.size();
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (a[mid] < x) {
                lo = mid + 1;
            } else {
                hi = mid;
            }
        }
        return lo;
    }
};
