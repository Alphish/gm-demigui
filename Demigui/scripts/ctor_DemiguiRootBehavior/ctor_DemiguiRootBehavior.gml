function DemiguiRootBehavior() : DemiguiContainerBehavior() constructor {
    static attach_to = function(_instance, _parent) {
        throw "The root cannot be attached to any container.";
    }
}
