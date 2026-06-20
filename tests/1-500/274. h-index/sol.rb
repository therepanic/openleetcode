# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
    citations.sort!.reverse!
    count = 0
    citations.each_with_index do |citation, i|
        if citation >= i+1
            count = i+1
        else
            break
        end
    end
    count
end
