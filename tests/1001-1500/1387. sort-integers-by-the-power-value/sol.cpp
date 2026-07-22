class Solution {
public:
    int getKth(int lo, int hi, int k) {
        vector<pair<int, int>> vc;
        for (int i = lo; i <= hi; i++) {
            int num = i;
            int count = 0;
            while (num != 1) {
                if (num % 2 == 0) {
                    num /= 2;
                } else {
                    num = 3 * num + 1;
                }
                count++;
            }
            vc.push_back({i, count});
        }
        sort(vc.begin(), vc.end(), [](const pair<int, int>& a, const pair<int, int>& b) {
            if (a.second != b.second) return a.second < b.second;
            return a.first < b.first;
        });
        return vc[k - 1].first;
    }
};
