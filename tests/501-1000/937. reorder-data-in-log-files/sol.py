from typing import List


class Solution:
    def reorderLogFiles(self, logs: List[str]) -> List[str]:
        def key(log: str):
            ident, rest = log.split(" ", 1)
            if rest[0].isdigit():
                return (1,)
            return (0, rest, ident)

        return sorted(logs, key=key)
