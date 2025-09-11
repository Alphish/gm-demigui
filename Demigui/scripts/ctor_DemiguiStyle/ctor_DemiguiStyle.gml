function DemiguiStyle() constructor {
    base = new DemiguiStyleVariant("", []);
    variants = [];
    variants_by_key = {};
    
    // -----
    // Setup
    // -----
    
    static with_value = function(_key, _value) {
        base.with_value(_key, _value);
        return self;
    }
    
    static get_variant = function(_modifiers) {
        var _sorted_modifiers = variable_clone(_modifiers, 1);
        array_sort(_sorted_modifiers, true);
        var _key = string_join_ext("+", _sorted_modifiers);
        
        if (struct_exists(variants_by_key, _key))
            return variants_by_key[$ _key];
        
        var _variant = new DemiguiStyleVariant(_key, _modifiers);
        array_push(variants, _variant);
        variants_by_key[$ _key] = _variant;
        return _variant;
    }
    
    static define_variant = function(_modifiers) {
        return get_variant(_modifiers);
    }
    
    // --------
    // Applying
    // --------
    
    static apply = function(_renderer, _modifiers) {
        base.apply(_renderer, _modifiers);
        for (var i = 0, _count = array_length(variants); i < _count; i++) {
            variants[i].apply(_renderer, _modifiers);
        }
    }
}

DemiguiStyle.create = function() {
    return new DemiguiStyle();
}
