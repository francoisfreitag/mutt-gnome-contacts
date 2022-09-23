# mutt-gnome-contacts

Queries [GNOME contacts](https://wiki.gnome.org/Apps/Contacts) database (full
name, email addresses) and outputs the results in a format compatible with
[NeoMutt](https://neomutt.org/) and [Mutt](http://www.mutt.org/).

## Build instructions

Install [meson](https://mesonbuild.com/) and run the following commands.
```sh
$ meson setup build
$ meson compile -C build
```

The executable can be found in `build/mutt-gnome-contacts`.

## Mutt configuration

```muttrc
set query_command = "mutt-gnome-contacts '%s'"
```
