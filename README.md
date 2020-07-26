# Gtk4 Constraints using Visual Format Language

## Table of Contents

- [About](#about)
- [Usage](#usage)
- [Screenshot](#screenshot)

## About <a name = "about"></a>

GtkConstraintLayout provides a layout manager that uses relations between widgets (also known as "constraints") to compute the position and size of each child. This Demo uses the 'Visual Format Language' or VFL to describe this relations.

### Prerequisites

Gtk4 version > 3.95

### Installing

Simple `meson` project.

```
> meson --prefix=/usr builddir
> ninja -C builddir
```

## Screenshot <a name = "screenshot"></a>

![Sceenshot](https://github.com/aeldemery/gtk4_constraints_vfl/blob/master/Screenshot%201.gif)