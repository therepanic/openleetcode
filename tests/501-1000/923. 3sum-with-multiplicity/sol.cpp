class Solution {
public:
    int threeSumMulti(vector<int>& arr, int target) {
        sort(arr.begin(), arr.end());
        unordered_map<int, int> cnt;
        for (int x : arr) {
            cnt[x]++;
        }
        long long res = 0;
        int i = 0, l = arr.size();
        const int MOD = 1'000'000'007;
        
        while (i < l) {
            int j = i, k = l - 1;
            
            while (j < k) {
                int s = arr[i] + arr[j] + arr[k];
                if (s < target) {
                    j += cnt[arr[j]];
                } else if (s > target) {
                    k -= cnt[arr[k]];
                } else {
                    if (arr[i] != arr[j] && arr[j] != arr[k]) {
                        res += (long long)cnt[arr[i]] * cnt[arr[j]] * cnt[arr[k]];
                    } else if (arr[i] == arr[j] && arr[j] != arr[k]) {
                        long long c = cnt[arr[i]];
                        res += c * (c - 1) * cnt[arr[k]] / 2;
                    } else if (arr[i] != arr[j] && arr[j] == arr[k]) {
                        long long c = cnt[arr[j]];
                        res += cnt[arr[i]] * c * (c - 1) / 2;
                    } else {
                        long long c = cnt[arr[i]];
                        res += c * (c - 1) * (c - 2) / 6;
                    }
                    j += cnt[arr[j]];
                    k -= cnt[arr[k]];
                }
            }
            
            i += cnt[arr[i]];
        }
        
        return res % MOD;
    }
};
