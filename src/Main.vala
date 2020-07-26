int main (string[] args) {
    var app = new Gtk4Demo.VFLConstraintsApp ();
    return app.run (args);
}

public class Gtk4Demo.VFLConstraintsApp : Gtk.Application {
    public VFLConstraintsApp () {
        Object (
            application_id: "github.aeldemery.gtk4_constraints_vfl",
            flags : GLib.ApplicationFlags.FLAGS_NONE);
    }

    protected override void activate () {
        var win = active_window;
        if (win == null) {
            win = new MainWindow (this);
        }
        win.present ();
    }
}