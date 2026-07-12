# @param {String[]} queries
# @param {String} pattern
# @return {Boolean[]}
def camel_match(queries, pattern)
    ans = []
    queries.each do |query|
        j = 0
        i = 0
        while i < query.length
            if query[i] == query[i].upcase && ((j < pattern.length && query[i] != pattern[j]) || j > pattern.length - 1)
                break
            end
            if j < pattern.length && query[i] == pattern[j]
                j += 1
            end
            i += 1
        end
        if i == query.length && j == pattern.length
            ans << true
        else
            ans << false
        end
    end
    ans
end
