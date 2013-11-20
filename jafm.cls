\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jafm}[2013/10/18 Custom class for JAFM]

\LoadClass[a4paper,twocolumn]{article}

% +----------+
% | Packages |
% +----------+
\RequirePackage{pslatex} % fonts
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{amsmath}
\RequirePackage{chicago}
\RequirePackage{geometry}
\RequirePackage{color}
\RequirePackage{fancyhdr}
\RequirePackage{fleqn}
\RequirePackage{hyperref}

% +-------------+
% | Page Layout |
% +-------------+
\setlength{\parindent}{0mm}
\setlength{\parskip}{6pt}
\usepackage{geometry}
\geometry{ tmargin=1in, bmargin=1.06in, lmargin=1.18in, 
  rmargin=1.18in, headheight=12pt, headsep=0.3in, footskip=0.3in }
\setlength{\columnsep}{0.25in}
\setlength{\parsep}{6pt}

% +----------+
% | Hyperref |
% +----------+
\hypersetup{ colorlinks,
  pdfborder=0 0 0,
  linkcolor=blue,
  urlcolor=blue,
  citecolor=blue
}

% +--------+
% | Header |
% +--------+
\def\hdvol#1{ \gdef\@hdvol{#1} }
\def\hdnum#1{ \gdef\@hdnum{#1} }
\def\hdpgs#1{ \gdef\@hdpgs{#1} }
\def\hdpge#1{ \gdef\@hdpge{#1} }
\def\hdyrs#1{ \gdef\@hdyrs{#1} }
\def\issn#1{ \gdef\@issn{#1} }
\def\eissn#1{ \gdef\@eissn{#1} }
\def\hdfr#1{ \gdef\@hdfr{#1} }              %%%%%%%%%%%%%%%%%%new line
\fancypagestyle{plain} {
  \fancyhf{}
  \fancyhead[L]{ \@hdfr \textit{et al.} / \textbf{JAFM}, 
    Vol. \@hdvol, No. \@hdnum, pp. \@hdpgs-\@hdpge, \@hdyrs. }
  \renewcommand{\headrulewidth}{0pt} 
  \fancyfoot[C]{ \thepage }
}
\pagestyle{plain}

% +-----------+
% | Institute |
% +-----------+
\newcounter{inst}
\def\institute#1{\gdef\@institute{#1}}
\def\institutename{
  \par
  \begingroup
  \newdimen\instindent
  \instindent=0pt
  \parindent=0pt
  \parskip=0pt
  \setcounter{inst}{1}%
  \def\and {
    \par\stepcounter{inst}%
    \hangindent\instindent
    \noindent
    \hbox to\instindent {{}$^{\theinst}$\enspace}
    \ignorespaces
  }
  \setbox0=\vbox{\def\thanks##1{}\@institute}
  \ifnum\value{inst}>9\relax\setbox0=\hbox{$^{88}$\enspace}%
  \else\setbox0=\hbox{$^{8}$\enspace}\fi
  \instindent=\wd0\relax
  \ifnum\value{inst}=1\relax
  \else
  \setcounter{inst}{1}%
  \hangindent\instindent
  \noindent
  \hbox to\instindent{{}$^{\theinst}$\enspace}\ignorespaces
  \fi
  \ignorespaces
  \@institute\par
  \endgroup
}
\def\inst#1{\unskip$^{#1}$}

% +---------------------------+
% | Title, Abstract, Keywords |
% +---------------------------+
\def\LOGO {
  \begin{picture}(0,0)\unitlength=1cm
    \put (1,-1) {\includegraphics[scale=1.25]{logo}}
  \end{picture}
}
\def\received_date#1{\gdef\@received_date{#1}}
\def\accepted_date#1{\gdef\@accepted_date{#1}}
\def\email#1{\gdef\@email{#1}}
\def\abstract#1{\gdef\@abstract{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
\renewcommand\maketitle{
  \par
  \begingroup
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
  \long\def\@makefntext##1{\parindent 1em\noindent
    \hb@xt@1.8em{%
      \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
  \def\lastand{\ifnum\value{inst}=2\relax
    \unskip{} and\
    \else
    \unskip, and\
    \fi}%
  \def\and{\stepcounter{auth}\relax
    \ifnum\value{auth}=\value{inst}%
    \lastand
    \else
    \unskip,
    \fi}%
  \twocolumn[
    \begin{@twocolumnfalse}
      \@maketitle
      %% Abstract
      \begin{center}%
	{\bfseries \scshape Abstract \vspace{-.5em}\vspace{\z@}}%
      \end{center}%
      \@abstract
      \vskip12pt
      %% Keywords
	  {\bfseries Keywords:}
	  \@keywords
	  \vskip12pt
    \end{@twocolumnfalse}
  ]
  \thispagestyle{empty}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\newcounter{auth}
\def\@maketitle{
  % front page header
  \begin{flushleft}
    \textit{ \textbf{J}ournal of \textbf{A}pplied \textbf{F}luid \textbf{M}echanics }, 
    Vol. \@hdvol, No. \@hdnum, pp. \@hdpgs-\@hdpge, \@hdyrs.\\
    Available online at\ \textcolor{blue}{\underline{ www.jafmonline.net}}, 
    ISSN \@issn, EISSN \@eissn. 
    \LOGO\\
  \end{flushleft}
  % title
  \vspace{14pt}
  \begin{center}
    {\fontsize{16}{18} \selectfont \bfseries \@title \par} \vspace{8pt}
    \setbox0=\vbox{\setcounter{auth}{1}\def\and{\stepcounter{auth} }%
      \hfuzz=2\textwidth\def\thanks##1{}\@author}%
    \value{inst}=\value{auth}%
    \setcounter{auth}{1}{
      \fontsize{11}{12} \selectfont \@author}
  \end{center}
  \begin{center}
    \small\itshape\institutename
  \end{center}
  \begin{center}
    $\dagger$ \textit{\small Corresponding Author Email}: \normalsize\itshape\@email
  \end{center}
  \begin{center}
    \small(Received \@received_date; accepted \@accepted_date)
  \end{center}
}

% +----------+
% | Sections |
% +----------+
\renewcommand\section{\@startsection {section}{1}{.25in}%
  {0.42168mm \@plus 0pt \@minus 0pt}% the correct spacing is 12pt or (0.42168mm) before and 6pt after 
  {0.01pt \@plus 0pt}%%%%%%%%%%%%%%%%%%%%%%%%%As you can see in the outpot the space after does not change according to the command, but if set 0,it will move the text.
  {\normalfont\normalsize\scshape\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%% the correct spacing is 12pt or (0.42168mm) before and 6pt after 
  {0.42168mm \@plus 0pt \@minus 0pt}%
  {0.01pt\@plus .2ex}%
  {\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%% the correct spacing is 6pt or (0.2108mm) before and after. 
  {0.21084mm\@plus 0pt \@minus 0pt}%
  {1.5ex \@plus .2ex}%
  {\normalfont\normalsize\bfseries}}
%% add a dot after the section number                                   
\renewcommand{\thesection}{\arabic{section}.}

%% but now remove the duplicate dot for subsection
\renewcommand\thesubsection{\thesection\arabic{subsection}}

%% and for the subsubsection
\renewcommand\thesubsubsection{\thesubsection\arabic{subsubsection}}

% +-----------+
% | Equations |
% +-----------+
\setlength{\mathindent}{0pt}

% +---------+
% | Figures |
% +---------+
\renewcommand{\figurename}{ Fig. }
\captionsetup{ labelfont={small,bf}, labelsep=period }

% +--------------+
% | Bibliography |
% +--------------+
\bibliographystyle{mychicago} %%%%%%%%%%%%%%%%%%%%%%%%%%% I have changed the chicago bibliography style in order to have the et al in italic(in jafm format)
