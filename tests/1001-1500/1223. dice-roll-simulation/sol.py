from typing import List


class Solution:
    def dieSimulator(self, n: int, rollMax: List[int]) -> int:
        MOD = 10**9 + 7
        faces = 6

        # f[i][j] = number of valid sequences of length i+1 ending with face j
        f = [[0] * faces for _ in range(n)]
        s = [0] * n  # s[i] = total number of valid sequences of length i+1

        # Base case: 1 roll → one way for each face
        for j in range(faces):
            f[0][j] = 1
        s[0] = faces

        for i in range(1, n):
            for j in range(faces):  # current face
                max_repeat = rollMax[j]

                res = s[i - 1]  # total ways to extend sequences of length i

                if i > max_repeat:
                    # Remove sequences where appending j would cause j to appear more than allowed
                    # s[i - max_repeat - 1] = total sequences of length i - max_repeat
                    # f[i - max_repeat - 1][j] = those that already ended in j
                    res -= s[i - max_repeat - 1] - f[i - max_repeat - 1][j]
                elif i == max_repeat:
                    # Prevent the one sequence where all i+1 rolls are j
                    res -= 1

                f[i][j] = res % MOD

            s[i] = sum(f[i]) % MOD

        return s[n - 1]
