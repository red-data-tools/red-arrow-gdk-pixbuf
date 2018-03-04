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

class ConvertTest < Test::Unit::TestCase
  test("RGB") do
    r_xpm = [
      "16 10 2 1",
      ".  c #FE0B0B",
      "+  c #FFFFFF",
      "++++.......+++++",
      "++++..++++..++++",
      "++++..++++..++++",
      "++++..+++...++++",
      "++++.......+++++",
      "++++.....+++++++",
      "++++..++..++++++",
      "++++..++...+++++",
      "++++..+++...++++",
      "++++..++++..++++",
    ]
    pixbuf = GdkPixbuf::Pixbuf.new(xpm: r_xpm)
    assert_equal(pixbuf.pixels,
                 pixbuf.to_arrow.to_pixbuf.pixels)
  end

  test("RGBA") do
    r_xpm = [
      "16 10 3 1",
      "   c None",
      ".  c #FE0B0B",
      "+  c #FFFFFF",
      "++++.......+++++",
      "++++..    ..++++",
      "++++..    ..++++",
      "++++..   ...++++",
      "++++.......+++++",
      "++++.....+++++++",
      "++++..++..++++++",
      "++++..++...+++++",
      "++++..+++...++++",
      "++++..++++..++++",
    ]
    pixbuf = GdkPixbuf::Pixbuf.new(xpm: r_xpm)
    assert_equal(pixbuf.pixels,
                 pixbuf.to_arrow.to_pixbuf.pixels)
  end
end
