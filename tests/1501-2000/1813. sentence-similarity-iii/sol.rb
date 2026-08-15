# @param {String} sentence1
# @param {String} sentence2
# @return {Boolean}
def are_sentences_similar(sentence1, sentence2)
    sentence1 = sentence1.split(" ")
    sentence2 = sentence2.split(" ")
    
    l1, l2, r1, r2 = 0, 0, sentence1.length - 1, sentence2.length - 1
    
    while l1 <= r1 and l2 <= r2
        if sentence1[l1] == sentence2[l2]
            l1 += 1
            l2 += 1
        elsif sentence1[r1] == sentence2[r2]
            r1 -= 1
            r2 -= 1
        else
            return false
        end
    end
    
    true
end
