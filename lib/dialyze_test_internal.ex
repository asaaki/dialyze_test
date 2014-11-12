defmodule DialyzeTestInternal do
  defstruct bar: 2, foo: 0

  def decode(value) do
    DialyzeTestInternal.Proto.decode(value)
  end
end

defimpl DialyzeTestInternal.Proto, for: DialyzeTestInternal do
  def decode(value) do
    %DialyzeTestInternal{ value | foo: "no dialyzer warning" }
  end
end

# DialyzeTestInternal.decode(%DialyzeTestInternal{})
