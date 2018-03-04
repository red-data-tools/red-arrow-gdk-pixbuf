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

module Arrow
  class Tensor
    def to_pixbuf
      unless value_data_type.is_a?(UInt8DataType)
        message = "Arrow::UInt8DataType tensor is only convertable "
        message << "to GdkPixbuf::Pixbuf: #{value_data_type.inspect}"
        raise Error::Invalid.new(message)
      end
      if n_dimensions != 3
        message = "[height, width, n_channels] shape tensor is only convertable "
        message << "to GdkPixbuf::Pixbuf: #{shapes.inspect}"
        raise Error::Invalid.new(message)
      end
      height, width, n_channels = shape
      if n_channels != 3 and n_channels != 4
        message = "3 (RGB) or 4 (RGBA) channels tensor is only convertable "
        message << "to GdkPixbuf::Pixbuf: #{n_channels}"
        raise Error::Invalid.new(message)
      end
      if column_major?
        message = "Row major tensor is only  convertable "
        message << "to GdkPixbuf::Pixbuf for now"
        raise Error::NotImplemented.new(message)
      end
      data = buffer.data
      GdkPixbuf::Pixbuf.new(bytes: data,
                            width: width,
                            height: height,
                            has_alpha: n_channels == 4,
                            row_stride: data.size / height)
    end
  end
end
