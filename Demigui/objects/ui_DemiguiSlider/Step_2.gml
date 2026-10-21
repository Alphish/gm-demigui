fill_amount = (value_signal.get_value() - minimum) / (maximum - minimum);
with (thumb_instance) {
    x = other.x + round(lerp(other.xfrom, other.xto, other.fill_amount));
    y = other.y + round(lerp(other.yfrom, other.yto, other.fill_amount));
}
