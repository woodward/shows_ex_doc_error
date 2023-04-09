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
      # {:ex_doc, github: "woodward/ex_doc", only: :dev, runtime: false}
      #
      # which is now merged into ExDoc via this commit:
      {:ex_doc,
       github: "elixir-lang/ex_doc",
       commit: "2c581239e0989fdc91e3c83b4ce28ef4fe0adda6",
       only: :dev,
       runtime: false}
    ]
  end

  def before_closing_head_tag(:epub), do: ""

  def before_closing_head_tag(:html) do
    """
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/katex.min.css" integrity="sha384-vKruj+a13U8yHIkAyGgK1J3ArTLzrFGBbBc0tDp4ad/EyewESeXE/Iv67Aj8gKZ0" crossorigin="anonymous">
    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/katex.min.js" integrity="sha384-PwRUT/YqbnEjkZO0zZxNqcxACrXe+j766U2amXcgMg5457rve2Y7I6ZJSm2A0mS4" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/katex-copytex@1.0.2/dist/katex-copytex.min.css" rel="stylesheet" type="text/css">
    <script src="https://cdn.jsdelivr.net/npm/katex-copytex@1.0.2/dist/katex-copytex.min.js" crossorigin="anonymous"></script>

    <script defer src="https://cdn.jsdelivr.net/npm/katex@0.16.4/dist/contrib/auto-render.min.js" integrity="sha384-+VBxd3r6XgURycqtZ117nYw44OOcIax56Z4dCRWbxyPt0Koah1uHoK0o4+/RRE05" crossorigin="anonymous"
      onload="renderMathInElement(document.body, {
        delimiters: [
          {left: '$$', right: '$$', display: true},
          {left: '$', right: '$', display: false},
        ],
        throwOnError : false
      });"></script>
    </script>
    """
  end
end
