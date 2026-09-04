from i3ipc import Connection, Event

i3 = Connection()

toggle = True  # switches split direction

def on_new_window(i3, e):
    global toggle

    tree = i3.get_tree()
    focused = tree.find_focused()

    if focused:
        if toggle:
            i3.command("split h")  # horizontal
        else:
            i3.command("split v")  # vertical

        toggle = not toggle

i3.on("window::new", on_new_window)
i3.main()
