# @param {String} text
# @return {String}
def arrange_words(text)
    s = text.split
    s = s.sort_by { |x| x.length }
    s = s.map { |i| i.downcase }
    s[0] = s[0][0].upcase + s[0][1..]
    s.join(" ")
end
