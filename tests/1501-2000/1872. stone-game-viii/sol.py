class Solution:
    def stoneGameVIII(self, stones: List[int]) -> int:
        p = stones
        n = len(p)
        for i in range(1, n):
            p[i] += p[i - 1]

        @cache
        def rec(i):
            # Base case: only two stones left
            # player will take all remaining stones
            # and leave one stone after this
            # then game ends
            if i == n - 2:
                return p[i + 1]

            # alice continue to play
            # going forward and will take scores
            # somewhere after this index
            alice_cont = rec(i + 1)

            # alice completes his chance
            # takes all what she got
            # let bob play after her
            alice_done = p[i + 1] - rec(i + 1)

            return max(alice_cont, alice_done)

        return rec(0)
