# @param {String[]} wordlist
# @param {String[]} queries
# @return {String[]}
def spellchecker(wordlist, queries)
    exact = wordlist.to_set
    case_map = {}
    vowel_map = {}
    
    wordlist.each do |w|
        lower = w.downcase
        devowel = de_vowel(lower)
        case_map[lower] = w unless case_map.key?(lower)
        vowel_map[devowel] = w unless vowel_map.key?(devowel)
    end
    
    result = []
    queries.each do |q|
        if exact.include?(q)
            result << q
        else
            lower = q.downcase
            devowel = de_vowel(lower)
            if case_map.key?(lower)
                result << case_map[lower]
            elsif vowel_map.key?(devowel)
                result << vowel_map[devowel]
            else
                result << ""
            end
        end
    end
    result
end

def de_vowel(s)
    s.chars.map { |c| 'aeiou'.include?(c) ? '*' : c }.join
end

def spellchecker(wordlist, queries)
    exact = wordlist.to_set
    case_map = {}
    vowel_map = {}
    
    wordlist.each do |w|
        lower = w.downcase
        devowel = de_vowel(lower)
        case_map[lower] = w unless case_map.key?(lower)
        vowel_map[devowel] = w unless vowel_map.key?(devowel)
    end
    
    result = []
    queries.each do |q|
        if exact.include?(q)
            result << q
        else
            lower = q.downcase
            devowel = de_vowel(lower)
            if case_map.key?(lower)
                result << case_map[lower]
            elsif vowel_map.key?(devowel)
                result << vowel_map[devowel]
            else
                result << ""
            end
        end
    end
    result
end
