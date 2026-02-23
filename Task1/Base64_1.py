import base64

text = input("Enter text for Base64 encoding: ")
encoded = base64.b64encode(text.encode()).decode()
decoded = base64.b64decode(encoded.encode()).decode()

print("Original:", text)
print("Base64 Encoded:", encoded)
print("Base64 Decoded:", decoded)
