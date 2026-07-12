class Solution:
    def camelMatch(self, queries: List[str], pattern: str) -> List[bool]:
        ans = []

        for query in queries:
            j = 0
            i = 0
            while i < len(query):
                if query[i].isupper() and (
                    (j < len(pattern) and query[i] != pattern[j])
                    or j > len(pattern) - 1
                ):
                    break

                if j < len(pattern) and query[i] == pattern[j]:
                    j += 1

                i += 1

            if i == len(query) and j == len(pattern):
                ans.append(True)
            else:
                ans.append(False)

        return ans
