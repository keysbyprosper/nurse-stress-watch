import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class NurseApp extends Application.AppBase {

    var _view; // Store reference to the view

    function initialize() {
        AppBase.initialize();
    }

    // Called on application start-up
    function onStart(state as Dictionary?) as Void {
        // Add initialization logic if needed
    }

    // Called when application is exiting on stop
    function onStop(state as Dictionary?) as Void {
        // Add cleanup logic if needed
    }

    // Getter for current view
    function getView() {
        return _view;
    }

    // Returns the initial view of the application first
    function getInitialView() as [Views] or [Views, InputDelegates] {
        _view = new NurseView();
        return [_view, new NurseDelegate(_view)];
    }
}
