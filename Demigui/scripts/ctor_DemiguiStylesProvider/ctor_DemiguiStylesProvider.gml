function DemiguiStylesProvider() : CimpliProvider() constructor {
    static add_family = function(_name, _modifiers) {
        var _style_family = new DemiguiStyleFamily(_name, _modifiers);
        add_value(_name, _style_family);
        return _style_family;
    }
    
    // ---------
    // Overrides
    // ---------
    
    static resolve_key = function(_specifier) {
        if (is_undefined(_specifier))
            return "none";
        
        if (is_instanceof(_specifier, DemiguiStyleFamily))
            return _specifier;
        
        var _base = method(self, CimpliProvider.resolve_key);
        return _base(_specifier);
    }
    
    static can_provide = function(_specifier, _args = undefined) {
        if (is_instanceof(_specifier, DemiguiStyleFamily))
            return true;
        
        var _key = resolve_key(_specifier);
        return struct_exists(resolvers, _key);
    }
    
    static try_provide = function(_specifier, _args = undefined) {
        if (is_instanceof(_specifier, DemiguiStyleFamily))
            return _specifier;
        
        var _key = resolve_key(_specifier);
        var _resolver = resolvers[$ _key];
        return !is_undefined(_resolver) ? _resolver.resolve(_args, self, _specifier, _key) : undefined;
    }
    
    static provide = function(_specifier, _args = undefined) {
        if (is_instanceof(_specifier, DemiguiStyleFamily))
            return _specifier;
        
        var _key = resolve_key(_specifier);
        if (!struct_exists(resolvers, _key))
            throw CimpliException.unknown_key("The provider", _key);
        
        var _entry = resolvers[$ _key];
        return _entry.resolve(_args, self, _specifier, _key);
    }
}