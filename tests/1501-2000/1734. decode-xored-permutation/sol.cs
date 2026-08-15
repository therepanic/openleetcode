public class Solution {
    public int[] Decode(int[] encoded) {
        int n = encoded.Length + 1;
        int xr = 0;
        for (int i = 1; i <= n; i++) xr ^= i;
        int nxr = 0;
        for (int i = 0; i < encoded.Length; i++) {
            if (i % 2 == 1) nxr ^= encoded[i];
        }
        int[] perm = new int[n];
        perm[0] = xr ^ nxr;
        for (int i = 0; i < encoded.Length; i++) {
            perm[i + 1] = encoded[i] ^ perm[i];
        }
        return perm;
    }
}
