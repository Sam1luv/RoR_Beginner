vowel = ['a', 'o', 'i', 'u', 'y', 'e']
alphabet = {}
('a'..'z').each_with_index do |letter, index|
  alphabet[letter] = index + 1 if vowel.include?(letter)
end

p alphabet
