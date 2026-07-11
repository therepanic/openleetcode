# @param {String[]} emails
# @return {Integer}
def num_unique_emails(emails)
    res = Set.new
    emails.each do |email|
        local, domain = email.split('@')
        if local.include?('+')
            local = local[0...local.index('+')]
        end
        local = local.delete('.')
        res.add(local + '@' + domain)
    end
    res.size
end
