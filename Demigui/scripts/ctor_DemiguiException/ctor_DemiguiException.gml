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

DemiguiException.invalid_typeof = function(_entity, _expected, _value) {
    return new DemiguiException(
        nameof(invalid_typeof),
        $"{_entity} should be {_expected}; got {typeof(_value)} instead."
        );
}

DemiguiException.unsupported_operation = function(_message) {
    return new DemiguiException(nameof(unsupported_operation), _message);
}

DemiguiException.invalid_operation = function(_message) {
    return new DemiguiException(nameof(invalid_operation), _message);
}

DemiguiException.unexpected_state = function(_message) {
    return new DemiguiException(nameof(unexpected_state), _message);
}

DemiguiException.invalid_argument = function(_arg, _message) {
    return new DemiguiException(
        nameof(invalid_argument),
        $"Invalid argument '{_arg}': {_message}"
        );
}

