using Toybox.WatchUi;

class StressLevelDelegate extends WatchUi.InputDelegate {

    var _view;

    function initialize() {
        InputDelegate.initialize();
    }

    function setView(view as WatchUi.View) {
        _view = view;
    }

    function onTap(event as WatchUi.ClickEvent) {
        _view.onTap(event); // ✅ No need for respondsTo
        return true;
    }
}
