/// @arg {String} name
/// @arg {Array<String>} modifiers
function DemiguiStyleFamily(_name, _modifiers) constructor {
    name = _name;
    modifiers = _modifiers;
    styles = [];
    variables = [];
    
    base_values = {};
    styles_by_modifier = {};
    array_foreach(modifiers, function(_modifier) { styles_by_modifier[$ _modifier] = []; });
    
    static with_base = function(_values) {
        base_values = _values;
        return self;
    }
    
    static with_style = function(_modifiers, _values) {
        var _index = array_length(styles);
        var _style = new DemiguiStyle(_index, _modifiers, _values);
        
        // register the style and associate it with its modifiers
        array_push(styles, _style);
        for (var i = 0, _count = array_length(_style.required_modifiers); i < _count; i++) {
            var _modifier = _style.required_modifiers[i];
            array_push(styles_by_modifier[$ _modifier], _style);
        }
        for (var i = 0, _count = array_length(_style.forbidden_modifiers); i < _count; i++) {
            var _modifier = _style.forbidden_modifiers[i];
            array_push(styles_by_modifier[$ _modifier], _style);
        }
        
        // add new variables affected by styles, if any
        array_copy(variables, array_length(variables), _style.variables, 0, array_length(_style.variables));
        var _count = array_unique_ext(variables);
        array_resize(variables, _count);
        
        return self;
    }
    
    static get_fallback_style = function(_variable, _index, _applied) {
        for (var i = _index - 1; i >= 0; i--) {
            if (_applied[i] && struct_exists(styles[i].values, _variable))
                return styles[i];
        }
        return undefined;
    }
}
