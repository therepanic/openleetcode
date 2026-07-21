# @param {String[]} queries
# @param {String[]} words
# @return {Integer[]}
def num_smaller_by_frequency(queries, words)
    def f(s)
        min_char = 'z'
        count = 0
        s.each_char do |char|
            if char < min_char
                min_char = char
                count = 1
            elsif char == min_char
                count += 1
            end
        end
        count
    end
    
    buckets = Array.new(12, 0)
    words.each do |w|
        buckets[f(w)] += 1
    end
    
    9.downto(0) do |i|
        buckets[i] += buckets[i+1]
    end
    
    queries.map { |q| buckets[f(q) + 1] }
end
