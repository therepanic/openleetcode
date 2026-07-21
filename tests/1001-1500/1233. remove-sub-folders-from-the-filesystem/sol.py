class Solution:
    def removeSubfolders(self, folder: List[str]) -> List[str]:
        folder.sort()
        res = []
        for f in folder:
            if not res:
                res.append(f)
            else:
                prev = res[-1]
                if f.startswith(prev) and len(f) > len(prev) and f[len(prev)] == "/":
                    continue
                else:
                    res.append(f)
        return res
