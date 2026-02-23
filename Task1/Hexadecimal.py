text = input("Enter a text= ") 

encoded = text.encode().hex()
print("Hex Encoded:", encoded)

decoded = bytes.fromhex(encoded).decode()
print("Decoded Text:", decoded)
