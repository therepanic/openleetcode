def str_str(haystack, needle)
  idx = haystack.index(needle)
  idx.nil? ? -1 : idx
end
