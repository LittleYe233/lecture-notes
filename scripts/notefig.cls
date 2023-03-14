% Packages may needed manual installation: pgfplots, circuitikz, l3kernel, l3packages
% Remember to `sudo fmtutil-sys --all'!

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notefig}[LaTeX template for figures from notes ver. 1.1.0]

% Define options
% See: https://tex.stackexchange.com/a/5896/290833
\newif\if@notefig@circuitikz
% Set it to false
\@notefig@circuitikzfalse
% See: https://www.overleaf.com/learn/latex/Writing_your_own_class#Options
\DeclareOption{circuitikz}{\@notefig@circuitikztrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{standalone}}
\ProcessOptions\relax

\LoadClass[border=2pt]{standalone}

\RequirePackage[svgnames]{xcolor}
\RequirePackage{pgfplots}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{unicode-math}
\RequirePackage[fontset=custom]{ctex}

% Choose TikZ or CircuiTikZ
\if@notefig@circuitikz
    \RequirePackage[siunitx]{circuitikz}
    \RequirePackage{tikz}
    \usetikzlibrary{shapes, arrows.meta, positioning, calc, decorations.pathreplacing}
\else
    \RequirePackage{tikz}
    \usetikzlibrary{shapes, arrows.meta, positioning, circuits.ee.IEC, calc, decorations.pathreplacing}
\fi

% See: https://thenode.biologists.com/data-visualization-with-flying-colors/research/
\definecolor{ochre}     {HTML}{D4A03C}
\definecolor{babyblue}  {HTML}{7AB1E3}
\definecolor{tea}       {HTML}{549A76}
\definecolor{straw}     {HTML}{EAE363}
\definecolor{flatblue}  {HTML}{4271AB}
\definecolor{copper}    {HTML}{BD642B}
\definecolor{lavender}  {HTML}{BA7DA3}

% Resolve pgfplots compatibility warning.
\pgfplotsset{%
    compat=1.18,
    samples=300,
    axis lines=middle,
    legend pos=north east,
    every axis plot/.append style={line width=0.9pt}
}
