using Toybox.WatchUi;
using Toybox.Graphics;

class StressLevelView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    function onUpdate(dc as Graphics.Dc) {
        dc.clear();
        var width = dc.getWidth();
        var height = dc.getHeight();

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(width / 2, height / 2, Graphics.FONT_LARGE, "Stress", Graphics.TEXT_JUSTIFY_CENTER);
    }
}
