# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, extension, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from keys import keys
import callbacks

import os
import subprocess
import random

mod = "mod4"
TERMINAL = "alacritty"
HOME_DIR = os.path.expanduser('~')

colors = [
        ['#1c1b22', '#1c1b22'], # Top bar background color, dark grey
        ['#c678dd', '#c678dd'], # Widget background 1, purple
        ['#46d9ff', '#46d9ff'], # Light purple
        ['#5f5faf', '#5f5faf'], # Widget background 2, dark purple / blue
        ]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

groups.append(
    ScratchPad("scratchpad", [
        DropDown("qalculate-gtk", "qalculate-gtk", width=0.5, x=0.25, y=0.2),
        DropDown("term", TERMINAL, width=0.75, height=0.5, x=0.125, y=0.2),
    ]),
)

layouts = [
    layout.Columns(border_focus_stack=['#d75f5f', '#8f3d3d'], border_width=4),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
     # layout.Stack(num_stacks=2),
     layout.Bsp(),
     # layout.Matrix(),
     layout.MonadTall(),
     layout.MonadWide(),
     # layout.RatioTile(),
     # layout.Tile(),
     layout.TreeTab(),
     layout.VerticalTile(),
     # layout.Zoomy(),
]

widget_defaults = dict(
    font='Ubuntu bold',
    fontsize=14,
    padding=3,
    background=colors[0],
)
extension_defaults = widget_defaults.copy()

def init_widget_list():
    widgets_list = [
        widget.Sep(
            linewidth = 0,
            padding = 8,
            ),
        widget.CurrentLayout(),
        widget.Sep(
            foreground = '#ffffff',
            linewidth = 2,
            ),
        widget.GroupBox(
            highlight_method='line',
            this_current_screen_border = colors[1],
            ),
        widget.Sep(
            foreground = '#ffffff',
            linewidth = 2,
            ),
        widget.WindowName(),
        widget.Chord(
            chords_colors={
                'launch': ("#ff0000", "#ffffff"),
            },
            name_transform=lambda name: name.upper(),
        ),
        widget.CheckUpdates(
            update_interval = 1800,
            distro = 'Arch_checkupdates',
            display_format = '{updates} Updates',
            mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(TERMINAL + ' -e sudo pacman -Syu')},
            ),
        widget.Systray(
            ),
        widget.TextBox(
            text = '◢',
            fontsize = 43,
            foreground = colors[1],
            padding = 0,
            ),
        widget.Clock(
            format='%Y-%m-%d %a %H:%M %p',
            background = colors[1],
            padding = 0,
            ),
        widget.TextBox(
            text = '◢',
            fontsize = 43,
            foreground = colors[3],
            background = colors[1],
            padding = 0,
            ),
        widget.Volume(
            fmt = 'Vol: {}',
            padding = 0,
            background = colors[3],
            ),
        widget.TextBox(
            text = '◢',
            fontsize = 43,
            foreground = colors[1],
            background = colors[3],
            padding = 0,
            ),
        widget.BatteryIcon(
            mouse_callbacks={'Button1': lambda: qtile.cmd_spawn('gnome-power-statistics')},
            background = colors[1],
            ),
        widget.Battery(
            format='{char} {percent:2.0%}', 
            mouse_callbacks={'Button1': lambda: qtile.cmd_spawn('gnome-power-statistics')},
            background = colors[1],
            ),
        widget.TextBox(
            text = '◢',
            fontsize = 43,
            foreground = colors[3],
            background = colors[1],
            padding = 0,
            ),
        ]
    return widgets_list

def get_random_wallpaper():
    path_to_wallpapers = HOME_DIR+'/Pictures/backgrounds/'
    files = os.listdir(path_to_wallpapers)
    return path_to_wallpapers + random.choice(files)

wallpaper = get_random_wallpaper()
screens = [
    Screen(
        wallpaper=wallpaper,
        wallpaper_mode='stretch',
        top=bar.Bar(
            init_widget_list(),
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry

    Match(wm_class='eog'),
    Match(wm_class='feh'),
    Match(wm_class='qalculate-gtk'),
    Match(title='JavaGUI'),
    Match(wm_class='yad'),
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.run([home])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
