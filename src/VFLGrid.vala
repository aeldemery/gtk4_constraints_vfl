using Gtk;
public class Gtk4Demo.VFLGrid : Widget {
    Button button1;
    Button button2;
    Button button3;

    static construct {
        set_layout_manager_type (typeof (ConstraintLayout));
    }

    construct {
        button1 = new Button.with_label ("Button 1");
        button1.name = "button1";
        button2 = new Button.with_label ("Button 2");
        button2.name = "button2";
        button3 = new Button.with_label ("Button 3");
        button3.name = "button3";

        button1.set_parent (this);
        button2.set_parent (this);
        button3.set_parent (this);

        /* Layout:
         *
         *   +-------------------------------------+
         *   | +-----------++-------++-----------+ |
         *   | |  Child 1  || Space ||  Child 2  | |
         *   | +-----------++-------++-----------+ |
         *   | +---------------------------------+ |
         *   | |             Child 3             | |
         *   | +---------------------------------+ |
         *   +-------------------------------------+
         *
         * Constraints:
         *
         *   super.start = child1.start - 8
         *   child1.width = child2.width
         *   child1.end = space.start
         *   space.end = child2.start
         *   child2.end = super.end - 8
         *   super.start = child3.start - 8
         *   child3.end = super.end - 8
         *   super.top = child1.top - 8
         *   super.top = child2.top - 8
         *   child1.bottom = child3.top - 12
         *   child2.bottom = child3.top - 12
         *   child3.height = child1.height
         *   child3.height = child2.height
         *   child3.bottom = super.bottom - 8
         *
         * Visual format:
         *
         *   H:|-8-[view1(==view2)-12-[view2]-8-|
         *   H:|-8-[view3]-8-|
         *   V:|-8-[view1]-12-[view3(==view1)]-8-|
         *   V:|-8-[view2]-12-[view3(==view2)]-8-|
         */

        // Build Constraints
        var manager = (ConstraintLayout) layout_manager;

        const string[] constraints = {
            "H:|-[button1(==button2)]-12-[button2]-|",
            "H:|-[button3]-|",
            "V:|-[button1]-12-[button3(==button1)]-|",
            "V:|-[button2]-12-[button3(==button2)]-|",
        };

        var views = new GLib.HashTable<string, ConstraintTarget>(str_hash, str_equal);
        views.insert ("button1", button1);
        views.insert ("button2", button2);
        views.insert ("button3", button3);

        try {
            manager.add_constraints_from_descriptionv (constraints, 8, 8, views);
        } catch (Error error){
            message ("Failed to parse constraints string" + error.message + "\n");
        }
    }

    protected override void dispose () {
        button1.unparent ();
        button2.unparent ();
        button3.unparent ();

        base.dispose ();
    }
}