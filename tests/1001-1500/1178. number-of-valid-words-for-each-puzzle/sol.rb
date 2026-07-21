# @param {String[]} words
# @param {String[]} puzzles
# @return {Integer[]}
def find_num_of_valid_words(words, puzzles)
    def get_mask(s)
        mask = 0
        s.each_byte { |b| mask |= 1 << (b - 97) }
        mask
    end
    
    word_count = Hash.new(0)
    words.each do |w|
        mask = get_mask(w)
        word_count[mask] += 1
    end
    
    result = []
    puzzles.each do |p|
        first_mask = 1 << (p[0].ord - 97)
        puzzle_mask = get_mask(p)
        sub = puzzle_mask
        count = 0
        loop do
            if sub & first_mask != 0
                count += word_count[sub]
            end
            break if sub == 0
            sub = (sub - 1) & puzzle_mask
        end
        result << count
    end
    result
end
