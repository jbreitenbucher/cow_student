\NeedsTeXFormat{LaTeX2e}% set the version of LaTeX
\ProvidesClass{woosterpaper}[2007/01/01 v1.0 Wooster paper class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{amsart}}% any options available to AMS article are available to woosterpaper
\ProcessOptions% process any options

\LoadClass{amsart}[1996/10/24]% everything is based on the AMS article class
%%%%%%%%%%%%%%%%%--Standard set of packages for Wooster--%%%%%%%%%%%%%%%%%
\RequirePackage[letterpaper,hmargin={1in,1in},includehead,includefoot,top=1.25in,bottom=1.25in]{geometry}% sets the margins for the document
\RequirePackage{ifxetex}% allows us to check for the use of XeTeX should be standard in TeXLive 2006
\RequirePackage{amsthm}% to style theorems
\RequirePackage{amssymb}% provides access to the full range of math symbols
\RequirePackage{amsmath}% to obtain special math related commands
\RequirePackage{amsfonts}% to use the AMS math fonts
\RequirePackage{natbib}% Use natbib for the bibliography
\bibpunct{[}{]}{;}{a}{,}{,}
\citestyle{wooster}% requires natbib.cfg file
\RequirePackage{listings}% for including code
\renewcommand{\lstlistlistingname}{List of Listings}
\RequirePackage{setspace}% to allow single and double spacing
\RequirePackage[vflt]{floatflt} % to insert figures in a paragraph
\RequirePackage{float}% to handle figures and tables
\RequirePackage{ifthen}% to do conditional checks
\RequirePackage[labelfont={bf,normalsize},font={small}, justification=raggedright]{caption}% to format captions
\RequirePackage{subfigure}% to allow multiple images in a figure
\captionsetup[subfloat]{listofindent=4em}% set captions on subfigures
\newcommand{\woopic}[2]{
  \includegraphics[scale=#2]{#1}
}% Figure command easier to remember than includegraphics. It has two arguments #1= file and %#2=scaling factor
%%%%%%%%%%%%%%%%%--General Shortcuts--%%%%%%%%%%%%%%%%%
%general symbols
\newcommand{\Q}{\ensuremath{\mathbb Q}}
\newcommand{\R}{\ensuremath{\mathbb R}}
\newcommand{\C}{\ensuremath{\mathbb C}}
\newcommand{\N}{\ensuremath{\mathbb N}}
\newcommand{\I}{\ensuremath{\mathbb I}}
\newcommand{\mbd}[1]{{\mathbf{#1}}}
\newcommand{\abs}[1]{\vert{#1}\vert}
\newcommand{\bvec}[1]{{\mbd{#1}}}
\newcommand{\lvec}[1]{\abs{\bvec{#1}}}
\newcommand{\bd}[1]{\textbf{#1}}
\newcommand{\degree}[1]{\ensuremath{#1^{\circ}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Kyle Kindbom requested a theorem style where the theorem header was on a
% separate line.
% The break theorem style will put a line break after the theorem header. - JB
\newtheoremstyle{break}% name
  {\topsep}%      Space above
  {\topsep}%      Space below
  {\itshape}%     Body font
  {}%             Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}%    Theorem head font
  {.}%            Punctuation after thm head
  {\newline}%     Space after theorem head: " " = normal interword space;
            %     \newline = linebreak
  {}%             Theorem head spec (can be left empty, meaning `normal')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newtheoremstyle{scthm}{\topsep}{\topsep}{\itshape}{}{\bfseries}{.}{ }{}
\theoremstyle{break}
\newtheorem{thm}{Theorem}[section]% create a short command for theorems and number them within sections 
\newtheorem{cor}[thm]{Corollary}% create a short command for corollaries and number with theorems
\newtheorem{lem}[thm]{Lemma}% create a short command for lemmas and number with theorems
\newtheorem{prop}[thm]{Proposition}% create a short command for propositions and number with theorems
\theoremstyle{definition}% change the theorem styling
\newtheorem{defn}{Definition}[section]% create a short command for definitions and number within sections
\newtheorem{ex}{Example}% create a short command for examples and number within sections
\newtheorem{exer}{Exercise}% create a short command for exercises and number within the document
\theoremstyle{remark}% change the theorem styling
\newtheorem{rem}{Remark}[section]% create a short command for remarks and number within sections
\renewcommand{\therem}{}% set the counter for remarks
\theoremstyle{plain}% change the theorem styling
\newtheorem{note}{Notation}[section]% create a short command for notation and number within sections
\renewcommand{\thenote}{}% set the counter for notation
\newtheorem{nts}{Note to self}% create a short command for notes to self and number within the document
\renewcommand{\thents}{}% set the counter for note to self
\newtheorem{term}{Terminology}[section]% create a short command for terminology and number within sections
\renewcommand{\theterm}{}% set the counter for terminology
\numberwithin{equation}{section}% equations are numbered within sections
\numberwithin{figure}{section}% figures are numbered within sections
\numberwithin{table}{section}% tables are numbered within sections
\numberwithin{lstlisting}{section}% listings are numbered within sections
%%%%%%%%%%%%%%%%%--Output Settings--%%%%%%%%%%%%%%%%
\ifxetex%
	\RequirePackage{fontspec}% allows one to easily set up fonts in the document
	\RequirePackage{xunicode}
	\RequirePackage{xltxtra}% adds extra commands specific to XeTeX
	%\RequirePackage[xetex]{graphicx}% use the graphicx package with XeTeX specifics
	\defaultfontfeatures{Mapping=tex-text}%
	\RequirePackage[dvipdfmx,%
		pdfusetitle=true,%
		pdfpagemode=UseOutlines,%
		bookmarks,%
		bookmarksopen=true,%
		pdfstartview=FitV,%
		colorlinks,%
		linkcolor=black,%
		citecolor=black,%
		pagebackref=true,%
		plainpages=false,%
		linktocpage=true,%
		pdfpagelabels=true,%
		hyperindex=false,%
		pdfpagetransition=Glitter,%
		breaklinks=true,%
		pagecolor=black,%
		urlcolor=black,%
		debug=true,%
		pdfstartpage=1]
		{hyperref}% to create hyper-linked pdf output
\else
	\RequirePackage[pdftex]{graphicx}% use the graphicx package with pdfTeX specifics
	\RequirePackage[verbose,expansion=alltext,stretch=50]{microtype}% this package creates a much more uniform text color on the page
	\RequirePackage[%dvipdfm,%
		pdftex,%
		pdfusetitle=true,%
		pdfpagemode=UseOutlines,%
		bookmarks,%
		bookmarksopen=true,%
		pdfstartview=FitV,%
		colorlinks,%
		linkcolor=black,%
		citecolor=black,%
		pagebackref=true,%
		plainpages=false,%
		linktocpage=true,%			
		pdfpagelabels=true,%
		hyperindex=true,%
		pdfpagetransition=Glitter,%
		breaklinks=true,%
		pagecolor=black,%
		urlcolor=black,%
		debug=true,%
		pdfstartpage=1]	
		{hyperref}% to create hyper-linked pdf output
\fi
\DeclareGraphicsExtensions{.pdf, .jpg, .tif}

\setlength\columnsep{16pt}% sets the separation between columns
%\def\publname{Name of the class}% for use in the production of a class proceedings

\def\@PII{ }% need to figure out what this does

%\def\ISSN{This needs to be obtained from http://www.issn.org/en/node/66 for each publication}

%    Blank box placeholder for figures (to avoid requiring any
%    particular graphics capabilities for printing this document).
\newcommand{\blankbox}[2]{%
  \parbox{\columnwidth}{\centering
%    Set fboxsep to 0 so that the actual size of the box will match the
%    given measurements more closely.
    \setlength{\fboxsep}{0pt}%
    \fbox{\raisebox{0pt}[#2]{\hspace{#1}}}%
  }%
}

\def\@maketitle{%
  \normalfont\normalsize
  \let\@makefnmark\relax  \let\@thefnmark\relax
  \ifx\@empty\@date\else \@footnotetext{\@setdate}\fi
  \ifx\@empty\@subjclass\else \@footnotetext{\@setsubjclass}\fi
  \ifx\@empty\@keywords\else \@footnotetext{\@setkeywords}\fi
  \ifx\@empty\thankses\else \@footnotetext{%
    \def\par{\let\par\@par}\@setthanks}\fi
  \@mkboth{\@nx\shortauthors}{\@nx\shorttitle}%
  \global\topskip42\p@ % 5.5 picas to the base of the first title line
  \@settitle
  \ifx\@empty\authors \else \@setauthors \fi
  \ifx\@empty\@commby
  \else
    \baselineskip18\p@
    \vtop{\centering{\footnotesize\@commby\@@par}%
      \global\dimen@i\prevdepth}\prevdepth\dimen@i
  \fi
  \ifx\@empty\@dedicatory
  \else
    \baselineskip18\p@
    \vtop{\centering{\footnotesize\itshape\@dedicatory\@@par}%
      \global\dimen@i\prevdepth}\prevdepth\dimen@i
  \fi
  \@setabstract
  \normalsize
  \dimen@34\p@ \advance\dimen@-\baselineskip
  \vskip\dimen@\relax
} % end \@maketitle

\endinput
