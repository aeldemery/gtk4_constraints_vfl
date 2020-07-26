using Gtk;
public class Gtk4Demo.MainWindow : ApplicationWindow {
    public MainWindow (Gtk.Application app) {
        Object (application: app);
    }

    construct {
        title = "VFL Constraints";
        margin_top = margin_bottom = margin_start = margin_end = 10;

        var header = new HeaderBar ();
        header.show_title_buttons = true;
        set_titlebar (header);

        var vbox = new Box (Orientation.VERTICAL, 12);
        set_child (vbox);

        var grid = new VFLGrid ();
        grid.vexpand = true;
        grid.hexpand = true;
        vbox.append (grid);

        var colse_button = new Button.with_label ("Close");
        colse_button.clicked.connect (() => {
            destroy ();
        });
        vbox.append (colse_button);
    }
}