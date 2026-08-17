# @param {String} sentence
# @return {Boolean}
def check_if_pangram(sentence)
    return false if sentence.length < 26
    
    (0...26).each do |i|
        return false unless sentence.include?((97+i).chr)
    end
    true
end
