selected_color = new CimpliProperty("RED");

test_button = function() {
    show_debug_message($"The button has been tested with {selected_color.get_value()}!");
}

agree1 = new CimpliProperty(false);
agree2 = new CimpliProperty(false);
agree3 = new CimpliProperty(false);
agree_all = new AggregateFlagProperty([agree1, agree2, agree3]);
