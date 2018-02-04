defmodule Liquid.StaticFiles do
    use Plug.Builder

    plug Plug.Static, at: "/", from: {:liquid, "priv/static"}
end