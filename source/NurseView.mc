import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Lang; 
import Toybox.Application.Storage;
import Toybox.Time;

class NurseView extends WatchUi.View {

    var _buttonRadius = 40;
    var _buttonCenters = {};  // Will hold x/y for each button
    var _screenHeight;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    function getScreenHeight() as Number {
        return _screenHeight;
    }

    // Update the view
    function onUpdate(dc as Graphics.Dc) as Void {
        
        dc.clear();
        var width = dc.getWidth();
        var height = dc.getHeight();
        _screenHeight = height;
        var sectionHeight = height / 3;

        // --- Draw Section Backgrounds Manually ---
        drawSection(dc, 0, sectionHeight, Graphics.COLOR_YELLOW, "Tired", Graphics.COLOR_BLACK);
        drawSection(dc, sectionHeight, sectionHeight, Graphics.COLOR_RED, "Stressed", Graphics.COLOR_WHITE);
        drawSection(dc, sectionHeight * 2, sectionHeight, Graphics.COLOR_GREEN, "Neutral", Graphics.COLOR_BLACK);

        // Save center points for tap detection
        _buttonCenters = {
            "Tired"    => { :x => width / 2, :y => sectionHeight / 2 },
            "Stressed" => { :x => width / 2, :y => sectionHeight + sectionHeight / 2 },
            "Neutral"  => { :x => width / 2, :y => sectionHeight * 2 + sectionHeight / 2 }
        };
    }

    function drawSection(dc as Graphics.Dc, topY as Number, height as Number, bgColor as Number, label as String, textColor as Number) {
        var width = dc.getWidth();

        // Simulate fillRect by drawing horizontal lines
        dc.setColor(bgColor, bgColor);
        for (var y = topY; y < topY + height; y += 1) {
            dc.drawLine(0, y, width, y);
        }
        // Draw the mood label
        dc.setColor(textColor, bgColor);
        dc.drawText(width / 2, topY + height / 2, Graphics.FONT_LARGE, label, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function _logMood(mood as String) {
        var timestamp = Time.now().value();
        System.println("Mood: " + mood + " at " + timestamp);
        var log = Storage.getValue("moodLog");
        if (log == null) {
            log = [];
        }
        log.add({ "time" => timestamp, "mood" => mood });
        Storage.setValue("moodLog", log);
    }
}
    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }


