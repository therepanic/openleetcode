# @param {String[]} words
# @return {Integer}
def minimum_length_encoding(words)
    words = words.uniq
    trie = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
    nodes = words.map do |word|
        word.reverse.each_char.reduce(trie) { |node, ch| node[ch] }
    end
    words.zip(nodes).sum { |word, node| node.empty? ? word.length + 1 : 0 }
end
