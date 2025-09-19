function DemiguiEventSubscription(_subject, _callback) constructor {
    subject = _subject;
    receive = _callback;
    
    static unsubscribe = function() {
        if (!is_undefined(subject))
            subject.remove_subscription(self);
        
        subject = undefined;
    }
}
