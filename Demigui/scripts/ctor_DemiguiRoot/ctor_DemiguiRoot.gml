function DemiguiRoot(_instance) : DemiguiContainer(_instance) constructor {
    static attach_to = function(_parent) {
        throw "The root cannot be attached to any container.";
    }
    
    static detach = function() {
        throw "The root cannot be detached from any container.";
    }
}
