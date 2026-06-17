# @param {Integer[][]} envelopes
# @return {Integer}
def max_envelopes(envelopes)
    envelopes.sort_by! { |a, b| [a, -b] }
    result = []
    envelopes.each do |_, e|
        idx = result.bsearch_index { |x| x >= e } || result.size
        if idx == result.size
            result << e
        else
            result[idx] = e
        end
    end
    result.size
end
