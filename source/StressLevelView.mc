using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Time;
using Toybox.Application.Storage;
using Toybox.Lang;

class StressLevelView extends WatchUi.View {

    var _options = [
        "1",
        "2",
        "3",
        "4",
        "5"
    ];

    var _screenHeight;

    function initialize() {
        View.initialize();
    }

    function onUpdate(dc as Graphics.Dc) {
        dc.clear();

        var width = dc.getWidth();
        _screenHeight = dc.getHeight(); // Save height here

        var sectionHeight = _screenHeight / _options.size();

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);

        for (var i = 0; i < _options.size(); i += 1) {
            var y = sectionHeight * i + sectionHeight / 2;
            dc.drawText(width / 2, y, Graphics.FONT_SMALL, _options[i], Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

    function onTap(event as WatchUi.ClickEvent) {
        var y = event.getCoordinates()[1];
        var sectionHeight = _screenHeight / _options.size();
        var index = (y / sectionHeight).toNumber();

        var level = index + 1;
        var timestamp = Time.now().value();

        var log = Storage.getValue("moodLog");
        if (log == null) {
            log = [];
        }

        log.add({ "time" => timestamp, "mood" => "Stressed", "level" => level });
        Storage.setValue("moodLog", log);

        System.println("Logged: Stressed, Level " + level + " at " + timestamp);

        WatchUi.popView(WatchUi.SLIDE_DOWN); // Go back to NurseView
        return true;
    }
}
