defmodule Soroban.Types.Int256 do
  @moduledoc """
  `Int256` struct definition.
  """

  @behaviour Soroban.Types.Spec

  alias Stellar.TxBuild.SCVal

  defstruct [:value]

  @type value :: integer()
  @type t :: %__MODULE__{value: value()}

  @impl true
  def new(value) when is_integer(value), do: %__MODULE__{value: value}
  def new(_value), do: {:error, :invalid}

  @impl true
  def to_sc_val(%__MODULE__{value: value}), do: SCVal.new(i256: <<value::size(256)>>)
  def to_sc_val(_error), do: {:error, :invalid_struct_int256}
end
