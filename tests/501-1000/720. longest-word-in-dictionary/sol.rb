# @param {String[]} words
# @return {String}
def longest_word(words)
    trie = ->{ Hash.new { |h, k| h[k] = trie.call } }
    root = trie.call
    _end = true

    words.each_with_index do |word, i|
        cur = root
        word.each_char { |ch| cur = cur[ch] }
        cur[_end] = i
    end

    stack = root.values
    ans = ""
    while !stack.empty?
        cur = stack.pop
        if cur.key?(_end)
            word = words[cur[_end]]
            if word.length > ans.length || (word.length == ans.length && word < ans)
                ans = word
            end
            cur.each do |k, v|
                stack.push(v) if k != _end
            end
        end
    end
    ans
end
