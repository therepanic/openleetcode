def simplify_path(path)
  parts = []
  path.split('/').each do |part|
    next if part.empty? || part == '.'
    if part == '..'
      parts.pop
    else
      parts << part
    end
  end
  '/' + parts.join('/')
end
