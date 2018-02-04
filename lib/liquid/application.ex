require Logger

defmodule Liquid.Application do
  use Application

  @port 4000

  def start(_type, _args) do
    children = [
      Plug.Adapters.Cowboy.child_spec(
        scheme: :http,
        plug: Liquid.Router,
        options: [
          port: @port,
        ]
      )
    ]
     
    Logger.info "Listening on port #{@port}..."

    opts = [strategy: :one_for_one, name: Liquid.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
