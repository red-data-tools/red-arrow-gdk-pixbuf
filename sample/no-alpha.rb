# Copyright 2018 Kouhei Sutou <kou@clear-code.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "arrow-gdk-pixbuf"
require "arrow-numo-narray"

if ARGV.empty?
  $stderr.puts("Usage: #{$0} IMAGE_FILE")
  exit(false)
end

path = ARGV[0]
pixbuf = GdkPixbuf::Pixbuf.new(file: path)
unless pixbuf.has_alpha?
  $stderr.puts("must specify an image that has alpha channel: #{path}")
  exit(false)
end

narray = pixbuf.to_arrow.to_narray
narray[true, true, 3] = 255
no_alpha_pixbuf = narray.to_arrow.to_pixbuf

type = File.extname(path).gsub(/\A\./, "").downcase
no_alpha_pixbuf.save(type,
                     filename: path.gsub(/\.([^.]+)\z/, "-no-alpha.\\1"))
