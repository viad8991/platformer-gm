_items = [
    new Item(obj_ammunition, 1),
    new Item(obj_medkit, 2),
];

function Item(_obj, _rare) constructor {
    obj = _obj
    rare = _rare
}

function get_random_items() {
    // randomize();
    // return irandom(_items);
    
    return choose(
        new Item(obj_ammunition, 1),
        new Item(obj_medkit, 2),
        new Item(obj_boot, 3),
    )
}