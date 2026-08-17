class Solution {
    public int[] decode(int[] encoded) {
        int n = encoded.length + 1;
        int xr = 0;
        for (int i = 1; i <= n; i++) xr ^= i;
        int nxr = 0;
        for (int i = 0; i < encoded.length; i++) {
            if (i % 2 == 1) nxr ^= encoded[i];
        }
        int[] perm = new int[n];
        perm[0] = xr ^ nxr;
        for (int i = 0; i < encoded.length; i++) {
            perm[i + 1] = encoded[i] ^ perm[i];
        }
        return perm;
    }
}
