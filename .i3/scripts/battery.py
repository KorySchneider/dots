#!/usr/bin/env python3

from subprocess import check_output

status = check_output(['acpi'], universal_newlines=True)
state = status.split(": ")[1].split(", ")[0]
commasplitstatus = status.split(", ")
percentleft = int(commasplitstatus[1].rstrip("%\n"))

FA_LIGHTNING = "\uf0e7"
FA_PLUG = "\uf1e6"

fulltext = "<span color='#ebdbb2'>{}</span>".format(FA_LIGHTNING)
timeleft = ""

if state == "Discharging":
    time = commasplitstatus[-1].split()[0]
    time = ":".join(time.split(":")[0:2])
    timeleft = " ({})".format(time)
else:
    fulltext += " " + FA_PLUG

def color(percent):
    if percent < 20:
        return "#fb4934" # red
    elif percent < 35:
        return "#fe8019" # orange
    elif percent < 50:
        return "#fabd2f" # yellow
    return "#ebdbb2"

form =  ' <span color="{}">{}%</span>'
fulltext += form.format(color(percentleft), percentleft)
fulltext += timeleft

print(fulltext)
print(fulltext)
