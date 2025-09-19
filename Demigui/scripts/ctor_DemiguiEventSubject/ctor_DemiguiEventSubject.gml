function DemiguiEventSubject(_sender) constructor {
    default_sender = _sender;
    subscriptions = [];
    
    static subscribe = function(_callback) {
        var _subscription = new DemiguiEventSubscription(self, _callback);
        array_push(subscriptions, _subscription);
        return _subscription;
    }
    
    static remove_subscription = function(_subscription) {
        var _idx = array_get_index(subscriptions, _subscription);
        if (_idx >= 0)
            array_delete(subscriptions, _idx, 1);
    }
    
    static raise = function(_args = undefined, _sender = undefined) {
        _sender ??= default_sender;
        for (var i = 0, _count = array_length(subscriptions); i < _count; i++) {
            subscriptions[i].receive(_args, _sender);
        }
    }
}
