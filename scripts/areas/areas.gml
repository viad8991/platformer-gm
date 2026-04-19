enum Area {
    WINTER,
    FOREST,
    DESERT,
    
	NONE 
}

// @return {Area} area
function get_area() {
    if (place_meeting(x, y, obj_area_winter)) {
        return Area.WINTER
    } else if (place_meeting(x, y, obj_area_forest)) {
        return Area.FOREST
    } else if (place_meeting(x, y, obj_area_desert)) {
        return Area.DESERT
    } else {
    	return Area.NONE
    }
}

function get_area_name(area) {
    switch (area) {
    	case Area.WINTER:
            return "Winter" 
        case Area.FOREST:
            return "Forest"
        case Area.DESERT:
            return "Desert"
        case Area.NONE:
            return "None"
    }
}
