class Solution:
    def reinitializePermutation(self, n: int) -> int:

        original = list(range(n))
        permut = original[:]
        arr = [0] * n

        count = 0

        while True:
            for i in range(n):
                if i % 2 == 0:
                    arr[i] = permut[i // 2]
                else:
                    arr[i] = permut[n // 2 + (i - 1) // 2]

            permut = arr[:]
            count += 1

            if permut == original:
                break

        return count
