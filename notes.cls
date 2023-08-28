% Packages may needed manual installation: pgfplots, extarrows, wrapstuff, curve2e, pict2e, circuitikz, l3kernel, l3packages
% Remember to `sudo fmtutil-sys --all'!

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[LaTeX template for notes ver. 1.8.0]

% Define options
\newif\if@notes@circuitikz
% Set it to false
\@notes@circuitikzfalse
\DeclareOption{circuitikz}{\@notes@circuitikztrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

\LoadClass[
    fontset=custom,
    linespread=1.5
]{ctexart}

\RequirePackage[svgnames]{xcolor}
\RequirePackage[
    a4paper,
    top=1in, bottom=1in, left=.75in, right=.75in
]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage[USenglish]{babel}
\RequirePackage[useregional]{datetime2}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{pgfplots}
\RequirePackage{subcaption}
\RequirePackage[abspath]{currfile}
\RequirePackage{lastpage}
\RequirePackage{chngcntr}
% wrapfig2 must be loaded before amsmath.
\RequirePackage{wrapfig2}
% Try to add some missing math symbols.
% See: https://tex.stackexchange.com/a/621515
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{ifthen}
\RequirePackage{float}
% Include `subfigure'.
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{wrapstuff}
\RequirePackage{extarrows}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{tabularx}
\RequirePackage{xltabular}
% See: https://tex.stackexchange.com/a/31956
\RequirePackage{cases}

% Choose TikZ or CircuiTikZ
\if@notes@circuitikz
    \RequirePackage[siunitx]{circuitikz}
    \RequirePackage{tikz}
    \usetikzlibrary{shapes, arrows.meta, positioning, calc, decorations.pathreplacing}
\else
    \RequirePackage{tikz}
    \usetikzlibrary{shapes, arrows.meta, positioning, circuits.ee.IEC, calc, decorations.pathreplacing}
    \RequirePackage{siunitx}
\fi

\ctexset{
    today=old,
    section/format=\Large\bfseries,
    tablename=Table,
    figurename=Figure
}
\definecolor{transpink} {HTML}{F5AAB9}
\definecolor{transblue} {HTML}{5BCEFA}
\definecolor{transwhite}{HTML}{FFFFFF}
% See: https://thenode.biologists.com/data-visualization-with-flying-colors/research/
\definecolor{ochre}     {HTML}{D4A03C}
\definecolor{babyblue}  {HTML}{7AB1E3}
\definecolor{tea}       {HTML}{549A76}
\definecolor{straw}     {HTML}{EAE363}
\definecolor{flatblue}  {HTML}{4271AB}
\definecolor{copper}    {HTML}{BD642B}
\definecolor{lavender}  {HTML}{BA7DA3}
% Fancyhdr style for the first page
% See: https://tex.stackexchange.com/a/30229
\fancypagestyle{firststyle}
{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt} % removes horizontal header line
}
% Set fancyhdr style after the first page.
\fancyhead[R]{\thepage\ of\ \begin{NoHyper}\pageref{LastPage}\end{NoHyper}}
\fancyfoot{}
% Set page style after the first page.
\pagestyle{fancy}
% Remove the horizontal bar of footer.
% \renewcommand{\headrulewidth}{0pt}
% Resolve fancyhdr head height too small
% See: https://tex.stackexchange.com/a/327298
\setlength{\headheight}{13pt}
% Specify image search paths.
\graphicspath{ {./, ./figures, ./figure, ./images, ./image, ./assets, ./asset} }
\hypersetup{
    colorlinks=true,
    linkcolor=transblue,
    filecolor=magenta,
    urlcolor=transpink
}
\urlstyle{same}
% Resolve pgfplots compatibility warning.
\pgfplotsset{%
    compat=1.18,
    samples=300,
    axis lines=middle,
    legend pos=north east,
    every axis plot/.append style={line width=0.9pt}
}
% Change figure and equation number counters.
% See: https://stackoverflow.com/a/44662211/12002560
\counterwithin{figure}{subsection}
\counterwithin{table}{subsection}
\counterwithin{equation}{subsection}
% Resolve hypcap=true overriden warning.
\captionsetup{hypcap=false}
% Reduce line space between enumerate and itemize items.
% See: https://tex.stackexchange.com/a/43747
\setlist[enumerate]{nosep}
\setlist[itemize]{nosep}

\makeatletter
% See: https://tex.stackexchange.com/a/216121
\renewcommand{\maketitle}{
    \makeatletter
    \newpage
    \null
    \vskip 2em
    \begin{center}
        \let\footnote\thanks
        {
            \LARGE\@title
            \par
        }
        \vskip 1.5em
            {
                \large\lineskip .5em
                \begin{tabular}[t]{c}
                    \@author
                \end{tabular}
                \par
            }
        \vskip 1em
            {
                \large\textsf{Version:}\ \theversion
            }
        \vskip .5em
            {
                \large\textsf{Last Modified:}\ \selectlanguage{USenglish}\thedatemodified
            }
        \vskip .5em
            {
                \large\textsf{Last Compiled:}\ \@date
            }
    \end{center}
    \par
    \vskip 1.5em
    \makeatother
    \thispagestyle{firststyle}
}
\makeatother

\newcommand{\thedatemodified}{\today}
\newcommand{\theversion}{0.1.0}
\newcommand{\datemodified}[1]{\renewcommand{\thedatemodified}{#1}}
\newcommand{\version}[1]{\renewcommand{\theversion}{#1}}

% See: https://tex.stackexchange.com/a/85115/290833
\makeatletter
\newcommand{\xRightarrow}[2][]{\ext@arrow 0359\Rightarrowfill@{#1}{#2}}
\makeatother

% See: https://tex.stackexchange.com/a/284749/290833
\makeatletter
\newcommand{\listofexampleprobs}{\@starttoc{loep}}
\makeatother

\newcounter{exampleprob}[subsection]
\counterwithin{exampleprob}{subsection}
% See: https://www.dickimaw-books.com/latex/novices/html/newenv.html
\newenvironment{exampleprob}%
{%
    \refstepcounter{exampleprob}%
    \addcontentsline{loep}{subsection}{\theexampleprob\ Example Problem}%
    \nopagebreak\par\vspace{.5\baselineskip}\noindent\hrulefill \textbf{EXAMPLE PROB \theexampleprob} \noindent\hrulefill
    \par\nopagebreak
}%
{%
    \par\vspace{.5\baselineskip}\hrule\par\vspace{.5\baselineskip}
}

% See: https://latex.org/forum/viewtopic.php?t=5976
\newcommand{\solutionnum}[1]{\ifthenelse{\equal{#1}{}}{}{\ #1}}
\newenvironment{solution}[1][]
{%
    \nopagebreak\par\vspace{.5\baselineskip}\noindent\hrulefill \textbf{SOLUTION\solutionnum{#1}} \noindent\hrulefill
    \par\nopagebreak
}%
{
    \par\vspace{.5\baselineskip}\hrule\par
}

% Use `\question' with or without `[<annotation>]' to mark a question.
% It is not a new environment, and can be collected by `\listofquestions'.
\newcounter{question}[subsection]
\counterwithin{question}{subsection}
\makeatletter
\newcommand{\listofquestions}{\@starttoc{qst}}
\makeatother

\newcommand{\questionname}[1]{\ifthenelse{\equal{#1}{}}{Question}{#1}}
\newcommand{\question}[1][]{%
    \refstepcounter{question}%
    % There should be a `\protect' to use `\ifthenelse' here, but it causes `\thequestion' in `\questionname' showing a wrong number.
    % So we directly removed it.
    \addcontentsline{qst}{subsection}{\thequestion\ \protect\questionname{#1}}%
}

\AtBeginDocument{
    \allowdisplaybreaks
}

% Remove vertical gap before equations and gathers, etc.
% Line spread is 1.5.
% See: https://tex.stackexchange.com/a/512867/290833
\newcommand{\rmg}{\vspace{-1.3\baselineskip}}
\newcommand{\srmg}{\vspace{-.5\baselineskip}}

\newcommand{\dd}[2]{\ifthenelse{\equal{#1}{1}}{\frac{\mathrm{d}}{\mathrm{d}{#2}}}{\frac{\mathrm{d}^{#1}}{\mathrm{d}{#2}^{#1}}}}
\newcommand{\ddd}[2]{\ifthenelse{\equal{#1}{1}}{\dfrac{\mathrm{d}}{\mathrm{d}{#2}}}{\dfrac{\mathrm{d}^{#1}}{\mathrm{d}{#2}^{#1}}}}

% See: https://tex.stackexchange.com/a/260414/290833
\AtBeginEnvironment{cases}{\everymath{\displaystyle}}
