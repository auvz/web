from random import choice
from string import digits, ascii_lowercase, ascii_uppercase
chars = digits + ascii_lowercase + ascii_uppercase
# special_chars = "\"!@#$^&*()-+_,"
# passwd = chars + special_chars

L1 = ["".join([choice(chars) for i in range(6)]) for j in range(3)]

print(*L1,sep='-')
