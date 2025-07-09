/// @desc An exception to be thrown due to invalid Demigui usage.
/// @arg {String} code              The code of the exception to differentiate between different exception causes.
/// @arg {String} description       A detailed description explaining the exception.
function DemiguiException(_code, _description) constructor {
    /// @desc The code of the exception to differentiate between different exception causes.
    /// @type {String}
    code = _code;
    
    /// @desc A detailed description explaining the exception.
    /// @type {String}
    description = _description;
    
    toString = function() {
        return $"Demigui.{code}: {description}";
    }
}

DemiguiException.not_implemented = function(_context, _method) {
    var _type = typeof(_context) == "struct" ? instanceof(_context) : object_get_name(_context.object_index);
    return new DemiguiException(
        nameof(not_implemented),
        $"{_type}.{_method} was not implemented."
        );
}