# @param {String} word
# @return {Boolean}
def detect_capital_use(word)
    word == word.upcase || word == word.downcase || word == word.capitalize
end
