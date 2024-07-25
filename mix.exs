defmodule PhosphorIcons.MixProject do
  use Mix.Project

  def project do
    [
      app: :phosphor_icons,
      version: "2.1.0",
      elixir: "~> 1.0",
      start_permanent: false,
      package: package(),
      deps: deps(),
      description: description(),
      name: "Phosphor Icons",
      source_url: "https://github.com/altdsoy/phosphor_icons",
      docs: [
        # The main page in the docs
        api_reference: false,
        main: "readme",
        logo: "phosphor-logo.png",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    []
  end

  defp description() do
    "Phosphor Icons assets for use with Tailwind CSS for example."
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:makeup_html, ">= 0.0.0", only: :dev, runtime: false},
      {:makeup_js, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "phosphor_icons",
      # These are the default files included in the package
      files: ~w(core/raw),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/altdsoy/phosphor_icons"}
    ]
  end
end
