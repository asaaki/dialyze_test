defmodule DialyzeTest do
  defstruct bar: 1, foo: 0
end

defimpl Poison.Decoder, for: DialyzeTest do
  def decode(data, _options) do
    %DialyzeTest{ data | foo: 2 }
  end
end
