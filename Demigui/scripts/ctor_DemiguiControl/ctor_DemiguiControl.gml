function DemiguiControl(_instance) : DemiguiComponent(_instance) constructor {
    control_node = new DemiguiControlNode(_instance, /* is container */ false);
}
