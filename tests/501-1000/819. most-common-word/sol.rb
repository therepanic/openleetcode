# @param {String} paragraph
# @param {String[]} banned
# @return {String}
def most_common_word(paragraph, banned)
    banned_set = banned.to_set
    words = paragraph.downcase.scan(/[a-z]+/)
    counts = Hash.new(0)
    words.each { |w| counts[w] += 1 unless banned_set.include?(w) }
    counts.max_by { |k, v| v }[0]
end
