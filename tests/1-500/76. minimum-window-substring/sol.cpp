class Solution {
public:
  string minWindow(string s, string t) {
    if (s.empty() || t.empty() || s.size() < t.size()) return "";

    unordered_map<char, int> need;
    for (char c : t) need[c]++;

    int missing = (int)t.size();
    int left = 0, bestL = 0, bestLen = INT_MAX;
    for (int right = 0; right < (int)s.size(); ++right) {
      char c = s[right];
      if (need.count(c)) {
        if (need[c] > 0) --missing;
        --need[c];
      }

      while (missing == 0) {
        if (right - left + 1 < bestLen) {
          bestLen = right - left + 1;
          bestL = left;
        }
        char d = s[left++];
        if (need.count(d)) {
          ++need[d];
          if (need[d] > 0) ++missing;
        }
      }
    }

    return bestLen == INT_MAX ? "" : s.substr(bestL, bestLen);
  }
};
