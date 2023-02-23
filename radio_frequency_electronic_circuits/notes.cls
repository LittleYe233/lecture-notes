\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[LaTeX template for notes ver. 1.1.0]

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
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{subcaption}
\RequirePackage[abspath]{currfile}
\RequirePackage{lastpage}
\RequirePackage{chngcntr}
% Try to add some missing math symbols.
% See: https://tex.stackexchange.com/a/621515
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{unicode-math}

\ctexset{
    today=old,
    section/format=\Large\bfseries,
    tablename=Table,
    figurename=Figure
}
\definecolor{transpink}{HTML}{F5AAB9}
\definecolor{transblue}{HTML}{5BCEFA}
\definecolor{transwhite}{HTML}{FFFFFF}
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
\usetikzlibrary{shapes, arrows.meta, positioning, circuits.ee.IEC, calc}
% Resolve pgfplots compatibility warning.
\pgfplotsset{compat=1.18}
% Change figure and equation number counters.
% See: https://stackoverflow.com/a/44662211/12002560
\counterwithin{figure}{subsection}
\counterwithin{equation}{subsection}

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
