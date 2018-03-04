# README

## Name

Red Arrow GDK Pixbuf

## Description

Red Arrow GDK Pixbuf is a library that provides converters between Apache Arrow's tensor data (`Arrow::Tensor`) and GDK Pixbuf's image data (`GdkPixbuf::Pixbuf`).

Red Arrow GDK Pixbuf adds `Arrow::Tensor#to_pixbuf` and `GdkPixbuf::Pixbuf#to_arrow`. `Arrow::Tensor#to_pixbuf` returns a `GdkPixbuf::Pixbuf`. `GdkPixbuf::Pixbuf#to_arrow` returns a `Arrow::Tensor`.

## Install

```text
% gem install red-arrow-gdk-pixbuf
```

## Usage

```ruby
require "arrow-gdk-pixbuf"

tensor.to_pixbuf # -> An object of GdkPixbuf::Pixbuf
pixbuf.to_arrow  # -> An object of Arrow::Tensor
```

## Dependencies

* [Red Arrow](https://github.com/red-data-tools/red-arrow)

* [Ruby/GdkPixbuf2](https://github.com/ruby-gnome2/ruby-gnome2)

## Authors

* Kouhei Sutou \<kou@clear-code.com\>

## License

Apache License 2.0. See doc/text/apache-2.0.txt for details.

(Kouhei Sutou has a right to change the license including contributed
patches.)
