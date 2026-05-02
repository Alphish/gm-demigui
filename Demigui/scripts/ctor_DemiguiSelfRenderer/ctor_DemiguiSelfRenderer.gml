function DemiguiSelfRenderer(_component) : DemiguiRenderer(_component) constructor {
    static update = function() {
        // do nothing for this simple renderer
    }
    
    static draw = function(_x, _y) {
        with (component) {
            draw_self();
        }
    }
}
