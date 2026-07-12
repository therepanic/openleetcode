class Solution:
    def smallestSubsequence(self, s: str) -> str:
        fqMap = {}
        stack = []
        visited = set()
        for ch in s:
            fqMap[ch] = fqMap.get(ch, 0) + 1
        for ch in s:
            fqMap[ch] -= 1
            if ch in visited:
                continue
            while stack and ch < stack[-1] and fqMap[stack[-1]] > 0:
                visited.remove(stack.pop())
            visited.add(ch)
            stack.append(ch)
        return "".join(stack)
