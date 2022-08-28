import subprocess
from libqtile.config import Key
from libqtile.command import lazy
from libqtile import extension

mod = 'mod4'

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html

    # Switch between windows
    Key([mod], 'h',
        lazy.layout.left(),
        desc='Move focus to left'),
    Key([mod], "l",
        lazy.layout.right(),
        desc='Move focus to right'),
    Key([mod], "j",
        lazy.layout.down(),
        desc='Move focus down'),
    Key([mod], "k",
        lazy.layout.up(),
        desc='Move focus up'),
    Key([mod], "space",
        lazy.layout.next(),
        desc='Move window focus to other window'),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, 'shift'], 'h',
        lazy.layout.shuffle_left(),
        desc='Move window to the left'),
    Key([mod, 'shift'], 'l',
        lazy.layout.shuffle_right(),
        desc='Move window to the right'),
    Key([mod, 'shift'], 'j',
        lazy.layout.shuffle_down(),
        desc='Move window down'),
    Key([mod, 'shift'], 'k',
        lazy.layout.shuffle_up(),
        desc='Move window up'),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, 'control'], 'h',
        lazy.layout.grow_left(),
        desc='Grow window to the left'),
    Key([mod, 'control'], 'l',
        lazy.layout.grow_right(),
        desc='Grow window to the right'),
    Key([mod, 'control'], 'j',
        lazy.layout.grow_down(),
        desc='Grow window down'),
    Key([mod, 'control'], 'k', 
        lazy.layout.grow_up(),
        desc='Grow window up'),
    Key([mod], 'n',
        lazy.layout.normalize(),
        desc='Reset all window sizes'),
    Key([mod], 'y',
        lazy.window.toggle_floating(),
        desc='Toggle floating window'),
    Key([mod], 'm',
        lazy.window.toggle_fullscreen(),
        desc='Toggle fullscreen window'),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, 'control'], 'Return',
        lazy.layout.toggle_split(),
        desc='Toggle between split and unsplit sides of stack'),

    # Toggle between different layouts as defined below
    Key([mod], 'Tab',
        lazy.next_layout(),
        desc='Toggle between layouts'),
    Key([mod, 'shift'], 'Tab',
        lazy.prev_layout(),
        desc='Toggle back between layouts'),
    Key([mod], 'w',
        lazy.window.kill(),
        desc='Kill focused window'),

    Key([mod, 'control'], 'r',
        lazy.reload_config(),
        desc='Reload the config'),
    Key([mod, 'control'], 'q',
        lazy.shutdown(),
        desc='Shutdown Qtile'),

    # Custom spawns
    Key([mod], 'Return',
            lazy.spawn('alacritty'),
            desc='Launch terminal'),
    Key([mod], 'b',
            lazy.spawn('firefox'),
            desc='Spawn shell'),
    Key([mod], 'q',
            lazy.spawn('rofi -modi drun -show drun'),
            desc='Show application menu'),
    Key(['mod1'], 'Tab',
            lazy.spawn('rofi -modi window -show window'),
            desc='Show running applications'),
    Key([mod], 'e',
            lazy.spawn('pcmanfm'),
            desc='Launch pcmanfm (graphical file manager)'),
    Key([mod], 'r',
            lazy.spawn('alacritty -e ranger /home/daniel/Dropbox/DTU/E22'),
            desc='Launch ranger in current notes directory'),

    # Scratchpad shortcuts
    Key([mod], 'c',
            lazy.group["scratchpad"].dropdown_toggle("qalculate-gtk"),
            desc="Show calculator scratchpad"),
    Key([mod, 'shift'], 'Return',
            lazy.group['scratchpad'].dropdown_toggle('term'),
            desc='Show terminal scratchpad'),

    # Monitor brightness
    Key([], 'XF86MonBrightnessUp',
            lazy.spawn('xbacklight -inc 10'),
            desc='Increment monitor brightness'),
    Key([], 'XF86MonBrightnessDown',
            lazy.spawn('xbacklight -dec 10'),
            desc='Increment monitor brightness'),

    # Audio keybindings
    Key([], 'XF86AudioRaiseVolume',
            lazy.spawn('ponymix increase 5'),
            desc='Increase audio level'),
    Key([], 'XF86AudioLowerVolume',
            lazy.spawn('ponymix decrease 5'),
            desc='Decrease audio level'),
    Key([], 'XF86AudioMute',
            lazy.spawn('ponymix toggle'),
            desc='Toggle audio mute'),

    # Lock screen
    Key([mod, 'mod1'], 'l',
            lazy.spawn('xdotool key ctrl+alt+F1'),
            desc='Lock screen with XDoTool'),
]
