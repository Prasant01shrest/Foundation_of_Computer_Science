text = input("Enter a text= ")

ascii_encoded = [ord(char) for char in text]
print("Encoded ASCII values:", ascii_encoded)

decoded_text = ''.join(chr(num) for num in ascii_encoded)
print("Decoded text:", decoded_text)
