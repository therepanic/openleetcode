class Solution:
    def countTheRepetitions(S: str, n1: int, T: str, n2: int) -> int:
        m, n = len(S), len(T)

        # Quick prune: if total characters in S' < total needed for T', impossible
        if m * n1 < n * n2:
            return 0

        # j – position in T
        j = 0
        # cnt – number of complete T copies found
        cnt = 0
        # k – number of full S copies processed
        k = 0

        # seen[j] = (cnt_at_first_seen, k_at_first_seen)
        seen = {}

        while k < n1:
            # Process one full copy of S
            for ch in S:
                if ch == T[j]:
                    j += 1
                    if j == n:  # finished one T
                        cnt += 1
                        j = 0

            k += 1  # finished one copy of S

            # If we have seen this j before, a cycle is detected
            if j in seen:
                prev_cnt, prev_k = seen[j]
                period_k = k - prev_k  # how many S copies per cycle
                period_cnt = cnt - prev_cnt  # how many T copies per cycle

                if period_cnt == 0:  # no progress in a cycle → stop
                    break

                remaining = n1 - k
                cycles = remaining // period_k

                cnt += cycles * period_cnt
                k += cycles * period_k
                # After fast‑forward we continue the loop; the state (j) is the same
            else:
                seen[j] = (cnt, k)

        return cnt // n2
