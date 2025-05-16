import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Math;
import Toybox.Application.Storage;

class NurseDelegate extends WatchUi.InputDelegate {
    var _view;

    function initialize(view as WatchUi.View) {
        InputDelegate.initialize();
        _view = view;
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new NurseMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onKey(key) as Boolean {
        var log = Storage.getValue("moodLog");

        if (log == null || log.size() == 0) {
            System.println("Mood log is empty.");
            return false;
        }

        for (var i = 0; i < log.size(); i += 1) {
            var entry = log[i];
            var time = entry["time"];
            var mood = entry["mood"];
            System.println("Mood: " + mood + ", Time: " + time);
        }

        return true;
    }

    function onSwipe(direction) as Boolean {
        // Swipe handling not implemented
        return false;
    }

    function onTap(event as WatchUi.ClickEvent) as Boolean {
        var coords = event.getCoordinates(); // [x, y]
        var y = coords[1];
        var screenHeight = _view.getScreenHeight();
        var sectionHeight = screenHeight / 3;

        if (y < sectionHeight) {
            _view._logMood("Tired");
            System.println("Tapped mood: Tired");
        } else if (y < sectionHeight * 2) {
            // Stressed - go to second screen, don't log here
            System.println("Tapped mood: Stressed");
            WatchUi.pushView(new StressLevelView(), new StressLevelDelegate(), WatchUi.SLIDE_UP);

        } else {
            _view._logMood("Neutral");
            System.println("Tapped mood: Neutral");
        }

        return true;
    }

}
