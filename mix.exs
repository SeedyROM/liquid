defmodule Liquid.Mixfile do
	use Mix.Project

	def project do
		[
			app: :liquid,
			version: "0.1.0",
			elixir: "~> 1.5",
			start_permanent: Mix.env == :prod,
			deps: deps()
		]
	end

	# Run "mix help compile.app" to learn about applications.
	def application do
		applications = [:logger, :cowboy, :plug, :poison]
		
		dev_applications = case Mix.env == :dev do
			true -> [:mimimix],
			false -> []
		end

		[
			extra_applications: [applications ++ dev_applications],
			mod: {Liquid.Application, []}
		]
	end

	# Run "mix help deps" to learn about dependencies.
	defp deps do
		[
			{:cowboy, "~> 1.0.0"},
			{:plug, "~> 1.4"},
			{:poison, "~> 3.1"},
			{:mimimix, github: "evbogdanov/mimimix", only: :dev},
		]
	end
end
