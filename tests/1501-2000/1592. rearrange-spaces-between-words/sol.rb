# @param {String} text
# @return {String}
def reorder_spaces(text)
    words = text.split
    total = text.count(" ")
    return words[0] + " " * total if words.length == 1
    gap = total / (words.length - 1)
    extra = total % (words.length - 1)
    words.join(" " * gap) + " " * extra
end
