# @param {String} s
# @param {String[]} words
# @return {Integer}
def num_matching_subseq(s, words)
    n = s.length
    mp = Hash.new { |h, k| h[k] = [] }
    s.each_char.with_index { |c, i| mp[c] << i }
    ('a'..'z').each do |c|
        mp[c] << n
        mp[c].sort!
    end
    
    found = ->(word) {
        curr = -1
        word.each_char do |c|
            return false if curr >= n
            arr = mp[c]
            idx = arr.bsearch_index { |x| x >= curr + 1 }
            curr = arr[idx]
        end
        curr < n
    }
    
    cnt = 0
    words.each { |w| cnt += 1 if found.call(w) }
    cnt
end
