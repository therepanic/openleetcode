class Solution(object):
    def subdomainVisits(self, cpdomains):
        freq = {}
        for entry in cpdomains:
            cnt, dom = entry.split()
            cnt = int(cnt)
            parts = dom.split(".")
            for i in range(len(parts)):
                sub = ".".join(parts[i:])
                freq[sub] = freq.get(sub, 0) + cnt
        return [f"{c} {d}" for d, c in freq.items()]
