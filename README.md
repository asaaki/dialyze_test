# DialyzeTest

## Packages

* <https://github.com/devinus/poison>
* <https://github.com/fishcakez/dialyze>

## Command

Fresh environment (no prebuilt PLTs)

    $ mix do deps.get, compile, compile.protocols
    $ mix dialyze

## Output

    Finding applications for analysis
    Finding suitable PLTs
    Looking up modules in dialyze_erlang-17.3_elixir-1.0.2_deps-dev.plt
    Looking up modules in dialyze_erlang-17.3_elixir-1.0.2.plt
    Looking up modules in dialyze_erlang-17.3.plt
    Finding applications for dialyze_erlang-17.3.plt
    Finding modules for dialyze_erlang-17.3.plt
    Creating dialyze_erlang-17.3.plt
    Looking up modules in dialyze_erlang-17.3.plt
    Adding 865 modules to dialyze_erlang-17.3.plt
    Finding applications for dialyze_erlang-17.3_elixir-1.0.2.plt
    Finding modules for dialyze_erlang-17.3_elixir-1.0.2.plt
    Copying dialyze_erlang-17.3.plt to dialyze_erlang-17.3_elixir-1.0.2.plt
    Looking up modules in dialyze_erlang-17.3_elixir-1.0.2.plt
    Adding 197 modules to dialyze_erlang-17.3_elixir-1.0.2.plt
    Finding applications for dialyze_erlang-17.3_elixir-1.0.2_deps-dev.plt
    Finding modules for dialyze_erlang-17.3_elixir-1.0.2_deps-dev.plt
    Copying dialyze_erlang-17.3_elixir-1.0.2.plt to dialyze_erlang-17.3_elixir-1.0.2_deps-dev.plt
    Looking up modules in dialyze_erlang-17.3_elixir-1.0.2_deps-dev.plt
    Adding 9 modules to dialyze_erlang-17.3_elixir-1.0.2_deps-dev.plt
    Finding modules for analysis
    Analysing 6 modules with dialyze_erlang-17.3_elixir-1.0.2_deps-dev.plt
    :0: Unknown function 'Elixir.DialyzeTestInternal.Proto.Atom':'__impl__'/1
    :0: Unknown function 'Elixir.DialyzeTestInternal.Proto.BitString':'__impl__'/1
    :0: Unknown function 'Elixir.DialyzeTestInternal.Proto.Float':'__impl__'/1
    :0: Unknown function 'Elixir.DialyzeTestInternal.Proto.Function':'__impl__'/1
    :0: Unknown function 'Elixir.DialyzeTestInternal.Proto.Integer':'__impl__'/1
    :0: Unknown function 'Elixir.DialyzeTestInternal.Proto.List':'__impl__'/1
    :0: Unknown function 'Elixir.DialyzeTestInternal.Proto.Map':'__impl__'/1
    :0: Unknown function 'Elixir.DialyzeTestInternal.Proto.PID':'__impl__'/1
    :0: Unknown function 'Elixir.DialyzeTestInternal.Proto.Port':'__impl__'/1
    :0: Unknown function 'Elixir.DialyzeTestInternal.Proto.Reference':'__impl__'/1
    :0: Unknown function 'Elixir.DialyzeTestInternal.Proto.Tuple':'__impl__'/1
    lib/dialyze_test.ex:5: Callback info about the 'Elixir.Poison.Decoder' behaviour is not available

## Questions

### Poison.Decoder callbacks

    lib/dialyze_test.ex:5: Callback info about the 'Elixir.Poison.Decoder' behaviour is not available

Why is the dialyzer not able to resolve the `Poison.Decoder` callback info here?

If I run

    dialyzer --plt _build/dev/dialyze_erlang-17.3_elixir-1.0.2_deps-dev.plt \
      _build/dev/lib/poison/ebin \
      _build/dev/lib/dialyze_test/ebin

I only get warnings for the protocols but the issue with the `Poison.Decoder` is gone.

### defimpl DialyzeTestInternal.Proto, for: Any

    :0: Unknown function 'Elixir.DialyzeTestInternal.Proto.Atom':'__impl__'/1

Is it possible to get rid of these warnings?
Is anybody working on this issue?

### Map.t

    :0: Unknown type 'Elixir.Map':t/0
