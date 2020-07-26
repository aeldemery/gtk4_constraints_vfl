project (
    'github.aeldemery.gtk4_constraints_vfl',
    'c', 'vala',
    version: '0.1.1',
)

sources = files (
    'src/Main.vala',
    'src/VFLGrid.vala',
    'src/MainWindow.vala',
)

dependencies = [
    dependency ('gobject-2.0'),
    dependency ('glib-2.0'),
    dependency ('gtk4'),
    meson.get_compiler('c').find_library ('m', required: false),
]

executable (
    meson.project_name(),
    sources: sources,
    dependencies: dependencies,
    install: true,
)
