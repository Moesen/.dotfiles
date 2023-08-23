import re

with open("xresources/.Xresources", "r") as xfile:
    xtext = xfile.read()

with open("kitty/kitty.conf", "r") as kfile:
    ktext = kfile.read()

kmatches = re.findall(r"^color\d+\s#[\d\w]{6}", ktext, flags=re.MULTILINE)
print(kmatches)

matches = re.findall(r"^\*(color\d+):\s+(#[\w\d]{6})", xtext, flags=re.MULTILINE)
for colname, colcode in matches:
    ktext = re.sub(f"{colname}\s#[\d\w]{6}", f"{colname} {colcode}", ktext)

print(ktext)
