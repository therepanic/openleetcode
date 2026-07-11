class Solution:
    def maskPII(self, s: str) -> str:
        if "@" in s:
            name, domain = s.split("@")
            name = name.lower()
            domain = domain.lower()
            name = name[0] + "*****" + name[-1]
            return name + "@" + domain
        else:
            gg = ""
            for x in s:
                if x.isdigit():
                    gg += x
            l = len(gg)
            if l > 10:
                return "+" + "*" * (l - 10) + "-***-***-" + gg[-4:]
            return "***-***-" + gg[-4:]
