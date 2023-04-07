defmodule ShowsExDocError.MixProject do
  use Mix.Project

  def project do
    [
      app: :shows_ex_doc_error,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: [
        main: ShowsExDocError,
        javascript_config_path: "../docs_config.js",
        before_closing_head_tag: &before_closing_head_tag/1
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # ex_doc 0.28.5 WORKS with KaTeX!
      # {:ex_doc, "0.28.5", only: :dev, runtime: false}
      #
      # But ex_doc 0.28.6 does NOT work!
      # {:ex_doc, "0.28.6", only: :dev, runtime: false}
      #
      # The current version of ex_doc (0.29.4) also does not work:
      # {:ex_doc, "~> 0.29", only: :dev, runtime: false}
      #
      # My fork of ex_doc fixes the problem:
      {:ex_doc, github: "woodward/ex_doc", only: :dev, runtime: false}
    ]
  end

  def before_closing_head_tag(:epub), do: ""

  def before_closing_head_tag(:html) do
    """
    <!-- KaTeX JS and CSS Files -->
    <!-- From: https://hexdocs.pm/ex_doc/readme.html#rendering-math -->
    <!-- and from: view-source:https://katex.org/ -->

    <link rel="preload" href="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/fonts/KaTeX_Main-Regular.woff2" as="font" type="font/woff2" crossorigin="anonymous">
    <link rel="preload" href="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/fonts/KaTeX_Math-Italic.woff2" as="font" type="font/woff2" crossorigin="anonymous">
    <link rel="preload" href="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/fonts/KaTeX_Size2-Regular.woff2" as="font" type="font/woff2" crossorigin="anonymous">
    <link rel="preload" href="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/fonts/KaTeX_Size4-Regular.woff2" as="font" type="font/woff2" crossorigin="anonymous">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:300,400,700,700i">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/katex.min.css" crossorigin="anonymous">
    <!-- do NOT include static/index.css (from view-source:https://katex.org/) -->

    <script defer src="https://cdn.jsdelivr.net/npm/clipboard@2.0.1/dist/clipboard.min.js" integrity="sha256-hIvIxeqhGZF+VVeM55k0mJvWpQ6gTkWk3Emc+NmowYA=" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/katex.min.js" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/contrib/mhchem.min.js" crossorigin="anonymous"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/contrib/copy-tex.min.js" crossorigin="anonymous"></script>
    <!-- do NOT include js/index.js (from view-source:https://katex.org/) -->
    <script defer src="https://cdn.jsdelivr.net/npm/webfontloader@1.6.28/webfontloader.js" integrity="sha256-4O4pS1SH31ZqrSO2A/2QJTVjTPqVe+jnYgOWUVr7EEc=" crossorigin="anonymous"></script>

    <!-- From: https://katex.org/docs/autorender.html#usage -->

    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/contrib/auto-render.min.js" integrity="sha384-+VBxd3r6XgURycqtZ117nYw44OOcIax56Z4dCRWbxyPt0Koah1uHoK0o4+/RRE05" crossorigin="anonymous"
      onload="renderMathInElement(document.body, {
        // customised options
        // • auto-render specific keys, e.g.:
        delimiters: [
            {left: '$$', right: '$$', display: true},
            {left: '$', right: '$', display: false},
            // {left: '\\(', right: '\\)', display: false},
            // {left: '\\[', right: '\\]', display: true}
        ],
        // • rendering keys, e.g.:
        throwOnError : false
      } );">
    </script>
    """
  end
end
