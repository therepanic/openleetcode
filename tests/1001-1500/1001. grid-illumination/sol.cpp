#include <vector>
#include <unordered_map>
#include <unordered_set>

using namespace std;

class Solution {
public:
    vector<int> gridIllumination(int n, vector<vector<int>>& lamps, vector<vector<int>>& queries) {
        unordered_map<int, int> rowCount, colCount, diag1, diag2;
        unordered_set<long long> lampSet;
        vector<int> ans(queries.size());
        int dirs[9][2] = {{-1,-1}, {-1,0}, {-1,1}, {0,-1}, {0,0}, {0,1}, {1,-1}, {1,0}, {1,1}};
        
        for (auto& lamp : lamps) {
            int r = lamp[0], c = lamp[1];
            long long key = ((long long)r << 32) | (c & 0xFFFFFFFFLL);
            if (!lampSet.count(key)) {
                lampSet.insert(key);
                rowCount[r]++;
                colCount[c]++;
                diag1[r - c]++;
                diag2[r + c]++;
            }
        }
        
        for (int i = 0; i < queries.size(); i++) {
            int r = queries[i][0], c = queries[i][1];
            if (rowCount[r] > 0 || colCount[c] > 0 || diag1[r - c] > 0 || diag2[r + c] > 0) {
                ans[i] = 1;
                for (auto& d : dirs) {
                    int nr = r + d[0], nc = c + d[1];
                    long long key = ((long long)nr << 32) | (nc & 0xFFFFFFFFLL);
                    if (lampSet.count(key)) {
                        lampSet.erase(key);
                        rowCount[nr]--;
                        colCount[nc]--;
                        diag1[nr - nc]--;
                        diag2[nr + nc]--;
                    }
                }
            } else {
                ans[i] = 0;
            }
        }
        return ans;
    }
};
