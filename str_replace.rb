#!/usr/bin/env ruby

# String replacement module - equivalent to str_replace.c
module StrReplace
  # Count occurrences of search string in source
  def self.count_occurrences(source, search)
    return 0 if source.nil? || search.nil? || search.empty?
    source.scan(search).length
  end

  # Replace all occurrences of search with replace in source
  def self.replace(source, search, replace_str)
    return nil if source.nil?
    return source.dup if search.nil? || search.empty?

    replace_str ||= ""
    source.gsub(search, replace_str)
  end
end

# Main program - equivalent to main.c
def main
  puts "String Replacement Program"
  puts "=========================="
  puts

  # Read input strings
  print "Enter string1 (source string): "
  string1 = gets
  if string1.nil?
    $stderr.puts "Error reading string1"
    return 1
  end
  string1.chomp!

  print "Enter string2 (search string): "
  string2 = gets
  if string2.nil?
    $stderr.puts "Error reading string2"
    return 1
  end
  string2.chomp!

  print "Enter string3 (replacement string): "
  string3 = gets
  if string3.nil?
    $stderr.puts "Error reading string3"
    return 1
  end
  string3.chomp!

  # Validate search string is not empty
  if string2.empty?
    puts
    puts "Search string is empty. No replacement performed."
    puts "Result: #{string1}"
    return 0
  end

  # Perform replacement
  result = StrReplace.replace(string1, string2, string3)

  # Display results
  puts
  puts "--- Results ---"
  puts "Original:    \"#{string1}\""
  puts "Search for:  \"#{string2}\""
  puts "Replace with: \"#{string3}\""

  count = StrReplace.count_occurrences(string1, string2)
  if count > 0
    puts "Occurrences: #{count}"
    puts "Result:      \"#{result}\""
  else
    puts "Pattern not found. No changes made."
    puts "Result:      \"#{result}\""
  end

  0
end

# Run main if executed directly
exit(main) if __FILE__ == $PROGRAM_NAME
