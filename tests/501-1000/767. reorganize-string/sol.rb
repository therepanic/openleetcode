# @param {String} s
# @return {String}
def reorganize_string(s)
    char_freq = Hash.new(0)
    s.each_char { |c| char_freq[c] += 1 }
    
    max_heap = char_freq.map { |char, freq| [-freq, char] }
    max_heap.sort!
    
    res = []
    prev_freq, prev_char = 0, ""
    
    until max_heap.empty?
        freq, char = max_heap.shift
        res << char
        
        unless prev_freq == 0
            max_heap << [prev_freq, prev_char]
            max_heap.sort!
        end
        
        freq += 1
        prev_freq, prev_char = freq, char
    end
    
    return "" if res.length != s.length
    res.join
end
