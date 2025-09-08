function DemiguiCanvas(_instance, _joint = undefined) : DemiguiContainer(_instance, _joint) constructor {
    static create_hook = function() {
        return create_joint(DemiguiHookJoint);
    }
}
