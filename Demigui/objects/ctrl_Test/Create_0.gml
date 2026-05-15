event_inherited();

pointer = new DemiguiPointer();

var _actions = new DemiguiActionTable()
    .with_call_action("previous", function() { return keyboard_check(vk_shift) && keyboard_check_pressed(vk_tab); })
    .with_call_action("next", function() { return !keyboard_check(vk_shift) && keyboard_check_pressed(vk_tab); })
    .with_call_action("confirm", function() { return keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space); });
action_processor = new DemiguiActionProcessor(_actions);

input_manager = new DemiguiInputManager(pointer, action_processor);

test_string = new CimpliProperty("Dolor");
