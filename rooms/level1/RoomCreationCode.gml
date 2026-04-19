var areas_layer_id = layer_get_id("Areas");

if (layer_get_visible(areas_layer_id)) {
    layer_set_visible(areas_layer_id, false);	
}