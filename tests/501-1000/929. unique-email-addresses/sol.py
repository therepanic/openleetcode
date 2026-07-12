class Solution:
    def numUniqueEmails(self, emails: List[str]) -> int:
        res = set()
        for email in emails:
            local, domain = email.split("@")
            if "+" in local:
                local = local[: local.index("+")]
            local = local.replace(".", "")
            res.add(local + "@" + domain)
        return len(res)
