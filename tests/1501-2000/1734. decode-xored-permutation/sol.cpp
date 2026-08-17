class Solution {
public:
    vector<int> decode(vector<int>& encoded) {
        int n = encoded.size() + 1;
        int xr = 0;
        for (int i = 1; i <= n; i++) xr ^= i;
        int nxr = 0;
        for (int i = 0; i < encoded.size(); i++) {
            if (i % 2 == 1) nxr ^= encoded[i];
        }
        vector<int> perm(n);
        perm[0] = xr ^ nxr;
        for (int i = 0; i < encoded.size(); i++) {
            perm[i + 1] = encoded[i] ^ perm[i];
        }
        return perm;
    }
};
