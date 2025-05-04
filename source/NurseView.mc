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
        
