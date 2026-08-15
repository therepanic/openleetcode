class Solution {
    int find(vector<int>& p, int x) { while (p[x] != x) { p[x] = p[p[x]]; x = p[x]; } return x; }
    void unite(vector<int>& p, vector<int>& sz, int a, int b) {
        a = find(p, a); b = find(p, b); if (a == b) return;
        if (sz[a] < sz[b]) swap(a, b); p[b] = a; sz[a] += sz[b];
    }
public:
    bool gcdSort(vector<int>& nums) {
        int mx = 0; for (int x : nums) mx = max(mx, x);
        vector<int> p(mx + 1), sz(mx + 1, 1);
        for (int i = 0; i <= mx; i++) p[i] = i;
        for (int value : nums) {
            int x = value;
            for (int f = 2; f * f <= x; f++) if (x % f == 0) {
                unite(p, sz, f, value);
                while (x % f == 0) x /= f;
            }
            if (x > 1) unite(p, sz, x, value);
        }
        vector<int> sorted = nums;
        for (int i = 1; i < (int)sorted.size(); i++) {
            int x = sorted[i], j = i - 1;
            while (j >= 0 && sorted[j] > x) { sorted[j + 1] = sorted[j]; j--; }
            sorted[j + 1] = x;
        }
        for (int i = 0; i < (int)nums.size(); i++)
            if (find(p, nums[i]) != find(p, sorted[i])) return false;
        return true;
    }
};
