from random import choice
from string import digits, ascii_lowercase, ascii_uppercase
chars = digits + ascii_lowercase + ascii_uppercase
# special_chars = "\"!@#$^&*()-+_,"
# passwd = chars + special_chars

L1 = ["".join([choice(chars) for i in range(6)]) for j in range(1)]
L2 = ["".join([choice(chars) for i in range(6)]) for j in range(1)]
L3 = ["".join([choice(chars) for i in range(6)]) for j in range(1)]

# output password similar to MAC output

L = L1 + L2 + L3

print(*L,sep='-')
