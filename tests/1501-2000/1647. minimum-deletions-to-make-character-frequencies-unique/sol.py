class Solution:
    def minDeletions(self, s: str) -> int:
        # Count the frequencies of each character
        counter = Counter(s)
        # We just care about the frequencies,
        # so just get the values and sort in desc order
        freqs = sorted(counter.values(), reverse=True)
        deletes = 0
        # Because we can only reduce the frequencies (can't increase)
        # So we expect each value should less than its previous value
        for idx in range(1, len(freqs)):
            if freqs[idx] >= freqs[idx - 1]:
                # We need to decrease the value to previous value - 1
                # But if the previous value is already 0,
                # we should decrease current value to also 0
                target_value = max(0, freqs[idx - 1] - 1)
                deletes += freqs[idx] - target_value
                freqs[idx] = target_value
        return deletes
