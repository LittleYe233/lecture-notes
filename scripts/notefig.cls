% Packages may needed manual installation: pgfplots

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notefig}[LaTeX template for figures from notes ver. 1.0.0]

\LoadClass[border=2pt]{standalone}

\RequirePackage[svgnames]{xcolor}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{unicode-math}
\RequirePackage[fontset=custom]{ctex}

% See: https://thenode.biologists.com/data-visualization-with-flying-colors/research/
\definecolor{ochre}     {HTML}{D4A03C}
\definecolor{babyblue}  {HTML}{7AB1E3}
\definecolor{tea}       {HTML}{549A76}
\definecolor{straw}     {HTML}{EAE363}
\definecolor{flatblue}  {HTML}{4271AB}
\definecolor{copper}    {HTML}{BD642B}
\definecolor{lavender}  {HTML}{BA7DA3}

\usetikzlibrary{shapes, arrows.meta, positioning, circuits.ee.IEC, calc, decorations.pathreplacing}
% Resolve pgfplots compatibility warning.
\pgfplotsset{%
    compat=1.18,
    samples=300,
    axis lines=middle,
    legend pos=north east,
    every axis plot/.append style={line width=0.9pt}
}
