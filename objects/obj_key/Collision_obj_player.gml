var temp = global.keys + 1
global.keys = min(temp, global.max_keys)

instance_destroy()
