class Solution {
public:
  vector<vector<int>> subsets(vector<int>& nums) {
    vector<vector<int>> res{{}};
    for (int x : nums) {
      int sz = (int)res.size();
      for (int i = 0; i < sz; ++i) {
        auto cur = res[i];
        cur.push_back(x);
        res.push_back(move(cur));
      }
    }
    return res;
  }
};
