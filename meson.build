project('mutt-gnome-contacts', 'vala', license: 'MIT', version: '1.0')

dependencies = [
    dependency('glib-2.0'),
    dependency('gobject-2.0'),
    dependency('folks'),
]

sources = files('mutt_gnome_contacts.vala')

executable('mutt-gnome-contacts', sources, dependencies: dependencies, install: true)
