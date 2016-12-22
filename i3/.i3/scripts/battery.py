#!/usr/bin/env python3

from subprocess import check_output

# Battery info
status = check_output(['acpi'], universal_newlines=True)
state = status.split(': ')[1].split(', ')[0]
comma_split_status = status.split(', ')
percent = int(comma_split_status[1].rstrip('%\n'))

# Icons
fa_plug = ''
fa_bat_empty = ''
fa_bat_quarter = ''
fa_bat_half = ''
fa_bat_three_quarters = ''
fa_bat_full = ''

# Colors
red    = '#fb4934'
orange = '#fe8019'
yellow = '#fabd2f'
white  = '#ebdbb2'

# Text
fulltext = '<span color="#ebdbb2">{}</span> '
time_left = ''

#####

if state == 'Discharging':
    time = comma_split_status[-1].split()[0]
    time = ':'.join(time.split(':')[0:2])
    time_left = ' ({})'.format(time)
else:
    fulltext = fa_plug + ' ' + fulltext

def battery_icon(fulltext, percent):
    if percent < 10:
        return fulltext.format(fa_bat_empty)
    elif percent < 35:
        return fulltext.format(fa_bat_quarter)
    elif percent < 65:
        return fulltext.format(fa_bat_half)
    elif percent < 85:
        return fulltext.format(fa_bat_three_quarters)
    else:
        return fulltext.format(fa_bat_full)

fulltext = battery_icon(fulltext, percent)

def color(percent):
    global fulltext
    if percent < 10:
        return red
    elif percent < 35:
        return orange
    elif percent < 65:
        return white
    elif percent < 80:
        return white
    else:
        return white

form = ' <span color="{}">{}%</span>'
fulltext += form.format(color(percent), percent)
fulltext += time_left

print(fulltext)
print(fulltext)
