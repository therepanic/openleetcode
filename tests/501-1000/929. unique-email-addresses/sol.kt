class Solution {
    fun numUniqueEmails(emails: Array<String>): Int {
        val res = mutableSetOf<String>()
        for (email in emails) {
            val atIndex = email.indexOf('@')
            var local = email.substring(0, atIndex)
            val domain = email.substring(atIndex + 1)
            val plusIndex = local.indexOf('+')
            if (plusIndex != -1) {
                local = local.substring(0, plusIndex)
            }
            local = local.replace(".", "")
            res.add(local + "@" + domain)
        }
        return res.size
    }
}
