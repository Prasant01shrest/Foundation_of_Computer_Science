import urllib.parse

text = input("Enter text for URL encoding: ")
print("Original:", text)

encoded = urllib.parse.quote(text)
print("URL Encoded:", encoded)

decoded = urllib.parse.unquote(encoded)
print("URL Decoded:", decoded)
