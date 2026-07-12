class Solution(object):
    def findReplaceString(self, s, indices, sources, targets):
        patch = {}
        for i, src, tgt in zip(indices, sources, targets):
            if s[i : i + len(src)] == src:
                patch[i] = (src, tgt)
        res, i, n = [], 0, len(s)
        while i < n:
            if i in patch:
                src, tgt = patch[i]
                res.append(tgt)
                i += len(src)
            else:
                res.append(s[i])
                i += 1
        return "".join(res)
