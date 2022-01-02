from libqtile.core.manager import Qtile

def shutdown_computer(qtile):
    qtile.cmd_spawn('shutdown now')
