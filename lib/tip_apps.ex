defmodule TipApps do
  use Application

  def start(_type, _args) do
    children = [SimpleQueue]

    opts = [strategy: :one_for_one, name: TipApps.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
