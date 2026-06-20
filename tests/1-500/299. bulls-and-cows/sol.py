class Solution(object):
    def getHint(self, secret, guess):
        """
        :type secret: str
        :type guess: str
        :rtype: str
        """
        from collections import Counter

        bulls = 0
        secret_counts = Counter()
        guess_counts = Counter()

        for s, g in zip(secret, guess):
            if s == g:
                bulls += 1
            else:
                secret_counts[s] += 1
                guess_counts[g] += 1

        cows = sum(min(secret_counts[d], guess_counts[d]) for d in secret_counts)
        return "{}A{}B".format(bulls, cows)
