# ShowsExDocError

This repo shows the problem with ExDoc and an external library such 
as [KaTeX](https://katex.org/). Look at the `mix.exs` file to see how
KaTeX was set up using the `before_closing_head_tag`.  

The bug was introduced in ExDoc 0.28.6 (i.e., 0.28.5 works). Build the docs 
(i.e., `mix docs`) and then open `doc/index.html` in the browser. The math is displayed in
both cases, but in ExDoc 0.28.5 the modules are shown in the left-hand pane, 
but not in 0.28.6. Open up the JS console in the browser to see the error
when doing a hard reload of the page. For some reason, with 0.28.6 onwards the 
HTML element with the ID `toast` is not present at the time the module pane is
being rendered.

The fix is in the commit:
https://github.com/woodward/ex_doc/commit/a5ed367990315271eede9c67e83c922df7d6bd27
Basically, only add the event listener to the HTML element with the `toast` ID if
it exists in the page.

You can try out various versions of ex_doc (see the deps section of the mix file); just
be sure and clear things out between runs of `mix docs`!  e.g., delete `doc/*`, `_build`, 
and make sure you update the deps to the correct version.