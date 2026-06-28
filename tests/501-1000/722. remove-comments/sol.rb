# @param {String[]} source
# @return {String[]}
def remove_comments(source)
  in_block = false
  result = []
  current = []

  source.each do |line|
    i = 0
    current = [] unless in_block

    while i < line.length
      pair = line[i, 2]
      if !in_block && pair == '/*'
        in_block = true
        i += 2
      elsif in_block && pair == '*/'
        in_block = false
        i += 2
      elsif !in_block && pair == '//'
        break
      else
        current << line[i] unless in_block
        i += 1
      end
    end

    result << current.join if !in_block && current.any?
  end

  result
end
