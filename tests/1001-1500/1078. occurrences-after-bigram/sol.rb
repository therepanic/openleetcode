# @param {String} text
# @param {String} first
# @param {String} second
# @return {String[]}
def find_ocurrences(text, first, second)
    text_list = text.split
    result = []
    (0...(text_list.length - 2)).each do |i|
        if text_list[i] == first && text_list[i + 1] == second
            result << text_list[i + 2]
        end
    end
    result
end
