class Solution:
    def decode(self, encoded: List[int]) -> List[int]:
        xr = 0
        for i in range(1, len(encoded) + 2):
            xr ^= i
        nxr = 0
        for i in range(len(encoded)):
            if i & 1:
                nxr ^= encoded[i]

        perm = []
        perm.append(xr ^ nxr)
        # print()
        for i in range(len(encoded)):
            perm.append(encoded[i] ^ perm[i])
        # print(perm)
        return perm
