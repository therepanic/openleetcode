# @param {String} s
# @param {Integer} k
# @return {String}
def longest_subsequence_repeated_k(s, k)
    def is_k(sub, t, k)
        count = 0
        i = 0
        t.each_char do |ch|
            if i < sub.length && ch == sub[i]
                i += 1
                if i == sub.length
                    i = 0
                    count += 1
                    return true if count == k
                end
            end
        end
        false
    end

    res = ""
    q = [""]
    while !q.empty?
        curr = q.shift
        ('a'..'z').each do |ch|
            nxt = curr + ch
            if is_k(nxt, s, k)
                res = nxt
                q << nxt
            end
        end
    end
    res
end
