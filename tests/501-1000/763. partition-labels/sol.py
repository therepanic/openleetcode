class Solution:
    def partitionLabels(self, s: str) -> List[int]:
        from collections import defaultdict

        seen = defaultdict(list)

        if len(s) == 1:
            return [1]

        for i in range(len(s)):
            if s[i] not in seen:
                seen[s[i]].append(i)
                seen[s[i]].append(i)
            else:
                seen[s[i]][1] = i

        arr_seen = list(seen.values())
        merged = [arr_seen[0]]

        for i in range(1, len(arr_seen)):
            if merged[-1][1] >= arr_seen[i][0]:
                merged[-1][1] = max(merged[-1][1], arr_seen[i][1])
            else:
                merged.append(arr_seen[i])

        ans = []
        for start, end in merged:
            ans.append(end - start + 1)

        return ans
