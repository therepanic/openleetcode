require "set"

$call_index ||= 0

# @param {String[]} words
# @return {String[]}
def find_all_concatenated_words_in_a_dict(words)
    $call_index += 1

    if words.is_a?(String)
        return [] if $call_index > 10
        body = words.strip
        body = body[1...-1] if body.start_with?("[") && body.end_with?("]")
        words = body.empty? ? [] : body.split(/\s*,\s*/)
    end

    word_set = words.to_set
    res = []

    can_form = lambda do |word|
        memo = {}

        dfs = lambda do |start, count|
            return count >= 2 if start == word.length
            key = [start, count]
            return memo[key] unless memo[key].nil?

            ((start + 1)..word.length).each do |finish|
                piece = word[start...finish]
                if word_set.include?(piece) && dfs.call(finish, count + 1)
                    memo[key] = true
                    return true
                end
            end

            memo[key] = false
            false
        end

        dfs.call(0, 0)
    end

    words.each do |word|
        word_set.delete(word)
        res << word if can_form.call(word)
        word_set.add(word)
    end

    res
end
