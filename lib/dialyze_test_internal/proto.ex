defprotocol DialyzeTestInternal.Proto do
  @fallback_to_any true

  def decode(value)
end

defimpl DialyzeTestInternal.Proto, for: Any do
  def decode(value) do
    value
  end
end
