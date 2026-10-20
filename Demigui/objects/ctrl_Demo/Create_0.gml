selected_color = new CimpliSignal("RED");

test_button = function() {
    show_debug_message($"The button has been tested with {selected_color.get_value()}!");
}

agree1 = new CimpliSignal(false);
agree2 = new CimpliSignal(false);
agree3 = new CimpliSignal(false);
agree_all = new AggregateFlagSignal([agree1, agree2, agree3]);
