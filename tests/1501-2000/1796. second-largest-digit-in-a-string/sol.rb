# @param {String} s
# @return {Integer}
def second_highest(s)
    digits = s.chars.select { |c| c =~ /\d/ }.map(&:to_i).uniq.sort
    digits.length > 1 ? digits[-2] : -1
end
